<?php
namespace App\Command;
use App\Models\User;
use App\Models\UserDailyTraffic;
use Illuminate\Database\Capsule\Manager as DB;

class DailyTraffic
{
    public $description = '统计用户每日流量（写入 user_daily_traffic）';
    protected $argv;
    protected $batchSize = 500;

    public function __construct($argv)
    {
        $this->argv = $argv;
    }

    public function boot()
    {
        $date = date('Y-m-d', strtotime('-1 day'));
        echo "[DailyTraffic] Start {$date}" . PHP_EOL;
        
        // 检查当天是否已经统计过
        $existCount = UserDailyTraffic::where('date', $date)->count();
        if ($existCount > 0) {
            echo "[DailyTraffic] Already processed for {$date}, skipped" . PHP_EOL;
            return;
        }
        
        DB::beginTransaction();
        try {
            $processedCount = 0;
            $resetCount = 0;
            
            // 分批处理用户
            User::chunk($this->batchSize, function ($users) use ($date, &$processedCount, &$resetCount) {
                $insertData = [];
                
                foreach ($users as $user) {
                    // 当前用户的累计流量
                    $currentCumulative = $user->u + $user->d;
                    
                    // 获取用户最后一次记录（前一天或之前）
                    $lastRecord = UserDailyTraffic::where('user_id', $user->id)
                        ->orderBy('date', 'desc')
                        ->first();
                    
                    $used = 0;
                    $resetFlag = 0;
                    
                    if (!$lastRecord) {
                        // 首次记录，以当前累计为基准
                        $used = $currentCumulative;
                        $resetFlag = 0;
                    } else {
                        $lastCumulative = $lastRecord->cumulative;
                        
                        // 检测流量是否被重置（当前累计 < 上次累计）
                        if ($currentCumulative < $lastCumulative) {
                            // 流量被重置
                            $used = $currentCumulative;
                            $resetFlag = 1;
                            $resetCount++;
                            echo "[DailyTraffic] User {$user->id} traffic reset detected at {$date} (was {$lastCumulative}, now {$currentCumulative})" . PHP_EOL;
                        } else {
                            // 正常情况：计算本日使用量
                            $used = $currentCumulative - $lastCumulative;
                            $resetFlag = 0;
                        }
                    }
                    
                    // 确保使用量不为负
                    $used = max(0, $used);
                    
                    $insertData[] = [
                        'user_id' => $user->id,
                        'date' => $date,
                        'used' => $used,
                        'cumulative' => $currentCumulative,
                        'reset_flag' => $resetFlag,
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ];
                    
                    $processedCount++;
                }
                
                // 批量插入
                foreach ($insertData as $data) {
                    UserDailyTraffic::updateOrCreate(
                        [
                            'user_id' => $data['user_id'],
                            'date' => $data['date'],
                        ],
                        [
                            'used' => $data['used'],
                            'cumulative' => $data['cumulative'],
                            'reset_flag' => $data['reset_flag'],
                            'updated_at' => $data['updated_at'],
                        ]
                    );
                }
                
                echo "[DailyTraffic] Processed batch of " . count($users) . " users" . PHP_EOL;
            });
            
            DB::commit();
            echo "[DailyTraffic] Completed! Total: {$processedCount}, Resets: {$resetCount}" . PHP_EOL;
        } catch (\Throwable $e) {
            DB::rollBack();
            echo "[DailyTraffic] ERROR: {$e->getMessage()}" . PHP_EOL;
        }
    }
}
?>