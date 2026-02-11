<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Link;
use Slim\Http\Request;
use Slim\Http\Response;

class LinkController extends AdminController
{
    public function tokenIndex(Request $request, Response $response)
    {
        return $response->write(
            $this->view()->fetch('admin/link/token.tpl')
        );
    }

    public function tokenQuery(Request $request, Response $response)
    {
        // 同时尝试获取两个可能的参数
        $token  = trim($request->getParam('token'));
        $userId = trim($request->getParam('userid'));

        if ($token === '' && $userId === '') {
            return $response->withJson([
                'ret' => 0,
                'msg' => '请输入查询内容'
            ]);
        }

        // 逻辑判断：如果 userid 有值，则优先按 userid 查询；否则按 token 查询
        if ($userId !== '') {
            $link = Link::where('userid', $userId)->first();
            $errorMsg = '未找到该 User ID 对应的 Token';
        } else {
            $link = Link::where('token', $token)->first();
            $errorMsg = '未找到该 Token 对应的用户信息';
        }

        if (!$link) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $errorMsg
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'data' => [
                'id'      => $link->id,
                'userid'  => $link->userid,
                'type'    => $link->type,
                'address' => $link->address,
                'port'    => $link->port,
                'ios'     => $link->ios,
                'isp'     => $link->isp,
                'geo'     => $link->geo,
                'method'  => $link->method,
                'filter'  => $link->filter,
                'token'   => $link->token
            ]
        ]);
    }
}