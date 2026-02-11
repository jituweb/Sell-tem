<?php
namespace App\Controllers\Admin;
use App\Controllers\AdminController;
use App\Models\UserDailyTraffic;

class UserTrafficController extends AdminController
{
    public function index($request, $response, $args)
    {
        $traffic = [];
        $params  = $request->getQueryParams();
        $user_id = trim($params['user_id'] ?? '');
        $error   = '';
        
        if ($user_id !== '') {
            // 验证user_id是否为正整数
            if (!is_numeric($user_id) || $user_id <= 0) {
                $error = '用户ID必须为正整数';
            } else {
                try {
                    // 使用 UserDailyTraffic 模型进行查询
                    $traffic = UserDailyTraffic::selectRaw("
                            `date`,
                            ROUND(`used` / 1073741824, 2) AS used_gb,
                            ROUND(`cumulative` / 1073741824, 2) AS cumulative_gb,
                            `reset_flag`
                        ")
                        ->where('user_id', (int)$user_id)
                        ->where('date', '>=', date('Y-m-d', strtotime('-30 days')))
                        ->orderBy('date', 'ASC')
                        ->get()
                        ->toArray();
                    
                    // 如果没有查询到数据
                    if (empty($traffic)) {
                        $error = '该用户在最近30天内无流量记录';
                    }
                    
                } catch (\Exception $e) {
                    // 记录错误但不中断页面
                    error_log("UserTrafficController查询错误: " . $e->getMessage());
                    $error = '查询数据库时发生错误，请稍后重试';
                }
            }
        }
        
        return $this->view()
            ->assign('user_id', $user_id)
            ->assign('traffic', $traffic)
            ->assign('error', $error)
            ->display('admin/user_traffic.tpl');
    }
}
?>