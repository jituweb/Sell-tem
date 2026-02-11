<?php

namespace App\Controllers;

use App\Models\InviteCode;
use App\Models\User;
use App\Models\Code;
use App\Models\Payback;
use App\Models\Shop;
use App\Services\Auth;
use App\Services\Config;
use App\Utils\Tools;
use App\Utils\TelegramSessionManager;
use App\Utils\Geetest;

use App\Utils\URL;
use App\Models\Node;
use App\Models\Relay;
use Slim\Http\{Request, Response};
use Psr\Http\Message\ResponseInterface;

class XController extends BaseController
{
public function getUserInfo($request, $response, $args)
    {
        $user = $this->user;

        if (!$user->isLogin) {
            $res['ret'] = -1;
            return $response->withJson($res);
        }

        $pre_user = URL::cloneUser($user);
        $ssinfo = URL::getSSConnectInfo($pre_user);
        $ssr_sub_token = LinkController::GenerateSSRSubCode($this->user->id);
        $mergeSub = $_ENV['mergeSub'];
        $subUrl = $_ENV['subUrl'];
        $baseUrl = $_ENV['baseUrl'];
        $bind_token = TelegramSessionManager::add_bind_session($this->user);
        $subInfo = LinkController::getSubinfo($this->user, 0);
        $url_subinfo = array();
        foreach ($subInfo as $key => $value) {
            $url_subinfo[$key] = urlencode($value);
        }

        $res['info'] = array(
            'user' => $user,
            'ssrSubToken' => $ssr_sub_token,
            'show_ios_account' => $show_ios_account,
            'mergeSub' => $mergeSub,
            'subUrl' => $subUrl,
            'subInfo' => $subInfo,
            'baseUrl' => $baseUrl,
            'gravatar' => $user->gravatar
        );

        $res['ret'] = 1;
        return $response->withJson($res);
    }
}