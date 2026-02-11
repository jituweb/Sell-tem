<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Database\Capsule\Manager as DB;

class StatsService
{
    /**
     * 获取「已过期 X 秒以内」的用户数
     * @param int $seconds
     * @return int
     */
    public function getExpiredUser(int $seconds): int
    {
        $now = time();
        $from = $now - $seconds;

        return User::where('expire_in', '<', $now)
            ->where('expire_in', '>=', $from)
            ->count();
    }

    /**
     * 获取「所有已过期用户数」
     */
    public function getAllExpiredUser(): int
    {
        return User::where('expire_in', '<', time())->count();
    }
}
