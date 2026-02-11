<?php

namespace App\Services;

use App\Models\User;
use App\Models\{Node, Code};
use App\Utils\Tools;

class Analytics
{
    public function getTotalUser()
    {
        return User::count();
    }

    public function getCheckinUser()
    {
        return User::where('last_check_in_time', '>', 0)->count();
    }

    public function getTodayCheckinUser()
    {
        return User::where('last_check_in_time', '>', strtotime('today'))->count();
    }

    public function getTrafficUsage()
    {
        $total = User::sum('u') + User::sum('d');
        return Tools::flowAutoShow($total);
    }

    public function getTodayTrafficUsage()
    {
        $total = User::sum('u') + User::sum('d') - User::sum('last_day_t');
        return Tools::flowAutoShow($total);
    }

    public function getRawTodayTrafficUsage()
    {
        return User::sum('u') + User::sum('d') - User::sum('last_day_t');
    }

    public function getLastTrafficUsage()
    {
        $total = User::sum('last_day_t');
        return Tools::flowAutoShow($total);
    }

    public function getRawLastTrafficUsage()
    {
        return User::sum('last_day_t');
    }

    public function getUnusedTrafficUsage()
    {
        $total = User::sum('transfer_enable') - User::sum('u') - User::sum('d');
        return Tools::flowAutoShow($total);
    }

    public function getRawUnusedTrafficUsage()
    {
        return User::sum('transfer_enable') - User::sum('u') - User::sum('d');
    }

    public function getTotalTraffic()
    {
        $total = User::sum('transfer_enable');
        return Tools::flowAutoShow($total);
    }

    public function getRawTotalTraffic()
    {
        return User::sum('transfer_enable');
    }

    public function getOnlineUser($time)
    {
        $time = time() - $time;
        return User::where('t', '>', $time)->count();
    }

    public function getUnusedUser()
    {
        return User::where('t', '=', 0)->count();
    }

    public function getTotalNode()
    {
        return Node::count();
    }

    public function getTotalNodes()
    {
        return Node::where('node_heartbeat', '>', 0)->where(
            static function ($query) {
                $query->Where('sort', '=', 0)
                    ->orWhere('sort', '=', 1)
                    ->orWhere('sort', '=', 10)
                    ->orWhere('sort', '=', 11)
                    ->orWhere('sort', '=', 12)
                    ->orWhere('sort', '=', 13)
                    ->orWhere('sort', '=', 14);
            }
        )->count();
    }

    public function getAliveNodes()
    {
        return Node::where(
            static function ($query) {
                $query->Where('sort', '=', 0)
                    ->orWhere('sort', '=', 1)
                    ->orWhere('sort', '=', 10)
                    ->orWhere('sort', '=', 11)
                    ->orWhere('sort', '=', 12)
                    ->orWhere('sort', '=', 13)
                    ->orWhere('sort', '=', 14);
            }
        )->where('node_heartbeat', '>', time() - 90)->count();
    }

    public function getIncome($start, $end)
    {
        $sum = Code::whereNotIn('type', [2, 3])->where('usedatetime', '>=', date("Y-m-d H:i:s", $start))->where('usedatetime', '<', date("Y-m-d H:i:s", $end))->sum('number');
        if ($sum == null) {
            $sum = 0;
        }
        return $sum;
    }

    public function getNewUsers($start, $end)
    {
        $users = User::where('reg_date', '>=', date("Y-m-d H:i:s", $start))
        ->where('reg_date', '<', date("Y-m-d H:i:s", $end))
        ->count();
        if ($users == null) {
            $users = 0;
        }
        return $users;
    }

      /**
     * 获取过期用户数量（按等级过期时间class_expire）
     * class_expire 字段是 DATETIME 格式
     * 只统计 class > 0 的用户（有购买等级的用户）
     * @param int $seconds 从现在起的秒数
     * @return int 用户数量
     */
    public function getExpiredUser($seconds)
    {
        try {
            // 计算未来的日期时间（格式：DATETIME）
            $future_timestamp = time() + $seconds;
            $future_datetime = date('Y-m-d H:i:s', $future_timestamp);
            
            // 只统计 class > 0 的用户，排除默认值
            $count = User::where('class', '>', 0)
                ->where('class_expire', '<=', $future_datetime)
                ->where('class_expire', '>', '1989-06-05')  // 排除默认值
                ->where('class_expire', '!=', '0000-00-00 00:00:00')
                ->count();
            
            return $count ?? 0;
        } catch (\Exception $e) {
            \error_log('getExpiredUser error: ' . $e->getMessage());
            return 0;
        }
    }

    /**
     * 获取活跃转化统计数据
     * 根据class_expire字段（DATETIME格式）统计各时间段的用户
     * 只统计 class > 0 的用户（有购买等级的用户）
     * @return array 转化池数据
     */
    public function getConversionStats()
    {
        try {
            $now = time();
            
            // 定义各个时间点（秒数）
            $timeframes = [
                2 => 86400 * 2,      // 2天
                7 => 86400 * 7,      // 7天
                30 => 86400 * 30,    // 30天
                93 => 86400 * 93,    // 93天
                183 => 86400 * 183,  // 183天
                365 => 86400 * 365,  // 365天
                36500 => 86400 * 36500  // 36500天（100年）
            ];
            
            // 计算每个时间点的日期时间字符串
            $expiry_datetimes = [];
            foreach ($timeframes as $key => $seconds) {
                $expiry_datetimes[$key] = date('Y-m-d H:i:s', $now + $seconds);
            }
            
            // 一次查询获取所有数据（只统计 class > 0 的用户）
            $counts = [];
            foreach ($timeframes as $key => $seconds) {
                $counts[$key] = User::where('class', '>', 0)
                    ->where('class_expire', '<=', $expiry_datetimes[$key])
                    ->where('class_expire', '>', '1989-06-05')  // 排除默认值
                    ->where('class_expire', '!=', '0000-00-00 00:00:00')
                    ->count();
            }
            
            // 计算区间用户数（每个区间 = 该时间点 - 前一个时间点）
            return [
                'expired_2day' => $counts[2],
                'expired_2to7day' => max(0, $counts[7] - $counts[2]),
                'expired_7to30day' => max(0, $counts[30] - $counts[7]),
                'expired_30to93day' => max(0, $counts[93] - $counts[30]),
                'expired_93to183day' => max(0, $counts[183] - $counts[93]),
                'expired_183to365day' => max(0, $counts[365] - $counts[183]),
                'expired_365plus_day' => max(0, $counts[36500] - $counts[365]),
                'total_expired' => $counts[36500],
                '_debug' => [
                    'now' => date('Y-m-d H:i:s', $now),
                    'now_timestamp' => $now,
                    'expiry_datetimes' => $expiry_datetimes,
                    'all_counts' => $counts
                ]
            ];
        } catch (\Exception $e) {
            \error_log('getConversionStats error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage()
            ];
        }
    }

    /**
     * 获取用户class_expire统计总览
     * 只统计 class > 0 的用户
     * @return array 统计信息
     */
    public function getClassExpireStatistics()
    {
        try {
            $now = time();
            $now_datetime = date('Y-m-d H:i:s', $now);
            
            // 计算有效的 class_expire（class > 0 且不是默认值）
            $valid_class_expire = User::where('class', '>', 0)
                ->where('class_expire', '>', '1989-06-05')
                ->where('class_expire', '!=', '0000-00-00 00:00:00')
                ->count();
            
            $stats = [
                'total_users' => User::count(),
                'total_users_with_class' => User::where('class', '>', 0)->count(),
                'users_with_valid_class_expire' => $valid_class_expire,
                'users_with_default_class_expire' => User::where('class', '>', 0)
                    ->where(function($query) {
                        $query->where('class_expire', '<=', '1989-06-05')
                            ->orWhere('class_expire', '=', '0000-00-00 00:00:00');
                    })
                    ->count(),
                'users_class_expire_expired' => User::where('class', '>', 0)
                    ->where('class_expire', '<', $now_datetime)
                    ->where('class_expire', '>', '1989-06-05')
                    ->count(),
                'users_class_expire_active' => User::where('class', '>', 0)
                    ->where('class_expire', '>=', $now_datetime)
                    ->where('class_expire', '>', '1989-06-05')
                    ->count(),
                'min_class_expire' => User::where('class', '>', 0)
                    ->where('class_expire', '>', '1989-06-05')
                    ->min('class_expire'),
                'max_class_expire' => User::where('class', '>', 0)
                    ->where('class_expire', '>', '1989-06-05')
                    ->max('class_expire'),
                'current_datetime' => $now_datetime,
                'current_timestamp' => $now
            ];
            
            return $stats;
        } catch (\Exception $e) {
            \error_log('getClassExpireStatistics error: ' . $e->getMessage());
            return ['error' => $e->getMessage()];
        }
    }
}