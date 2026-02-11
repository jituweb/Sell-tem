<?php
namespace App\Controllers\User;
use App\Controllers\BaseController;

class GlobalNavController extends BaseController
{
    public function index($request, $response, $args)
    {
        // ✅ 正确的路径：Smarty 的 template_dir 已经是 metron/
        // 所以只需要写相对于 metron/ 的路径
        return $this->view()->display('user/global-nav.tpl');
    }
}