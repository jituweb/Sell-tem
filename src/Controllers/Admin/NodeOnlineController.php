<?php
declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Node;
use App\Models\NodeOnlineLog;
use App\Models\TrafficLog;
use Illuminate\Database\Capsule\Manager as DB;

class NodeOnlineController extends AdminController
{
    public function index($request, $response, $args)
    {
        date_default_timezone_set('Asia/Shanghai');

        $nodes = Node::all();
        $data = [];
        $totalOnline = 0;

        $monthStart = strtotime(date('Y-m-01 00:00:00'));
        $monthEnd   = strtotime(date('Y-m-t 23:59:59'));

        /**
         * 一次性取出所有节点当月流量总和
         */
        $trafficSummary = TrafficLog::selectRaw('node_id, SUM(u + d) as total_bytes')
            ->whereBetween('log_time', [$monthStart, $monthEnd])
            ->groupBy('node_id')
            ->get()
            ->keyBy('node_id')
            ->toArray();

        foreach ($nodes as $node) {
            // 最近在线记录
            $log = NodeOnlineLog::where('node_id', $node->id)
                ->orderBy('id', 'desc')
                ->first();

            if (!$log) {
                continue;
            }

            $timestamp = is_numeric($log->log_time)
                ? (int)$log->log_time
                : strtotime($log->log_time);

            $online = (int)$log->online_user;
            $totalOnline += $online;
            $isOnline = (time() - $timestamp) < 300;

            // 从预取结果中读取流量
            $monthTrafficGB = round($node->node_bandwidth / (1024 ** 3), 2);


            $data[] = [
                'id'            => $node->id,
                'name'          => $node->name,
                'online_user'   => $online,
                'status'        => $isOnline ? 'online' : 'offline',
                'updated_at'    => date('Y-m-d H:i:s', $timestamp),
                'month_traffic' => $monthTrafficGB,
            ];
        }

        return $response->write(
            $this->view()
                ->assign('data', $data)
                ->assign('totalOnline', $totalOnline)
                ->display('admin/node_online.tpl')
        );
    }
}
