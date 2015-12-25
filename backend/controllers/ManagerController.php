<?php

namespace backend\controllers;

use yii\web\Controller;

class Manager extends Controller{

    //创建权限
    /*public function createPermission($name)
    {
        $auth = Yii::$app->authManager;
        $createPost = $auth->createPermission($name);
        $createPost->description = '创建了 ' . $name. ' 权限';
        $auth->add($createPost);
    }

    //创建角色

    public function createRole($name)
    {
        $auth = Yii::$app->authManager;
        $role = $auth->createRole($name);
        $role->description = '创建了 ' . $name. ' 角色';
        $auth->add($role);
    }

    //以上两条添加，会创auth_item表中创建两条记录，以表中的type类型作为区分，type=1是角色，type=2为权限

    public function add($object)
    {
        if ($object instanceof Item) {
            return $this->addItem($object);
        } elseif ($object instanceof Rule) {
            return $this->addRule($object);
        } else {
            throw new InvalidParamException("Adding unsupported object type.");
        }
    }

    //将权限赋给角色

    public function addChild($items)
    {
        $auth = Yii::$app->authManager;
        $parent = $auth->createRole($items['role']);                //创建角色对象
        $child = $auth->createPermission($items['permission']);     //创建权限对象
        $auth->addChild($parent, $child);                           //添加对应关系
    }

    //将角色赋给用户

    public function addChild($items)
    {
        $auth = Yii::$app->authManager;
        $role = $auth->createRole($items['role']);                //创建角色对象
        $user_id = 1;                                             //获取用户id，此处假设用户id=1
        $auth->assign($role, $user_id);                           //添加对应关系
    }

    //验证权限

    public function beforeAction($action)
    {
        $action = Yii::$app->controller->action->id;
        if(\Yii::$app->user->can($action)){
            return true;
        }else{
            throw new \yii\web\UnauthorizedHttpException('对不起，您现在还没获此操作的权限');
        }
    }

    //看下\Yii::$app->user->can()这个方法

    public function can($permissionName, $params = [], $allowCaching = true)
    {
        if ($allowCaching && empty($params) && isset($this->_access[$permissionName])) {
            return $this->_access[$permissionName];
        }
        $access = $this->getAuthManager()->checkAccess($this->getId(), $permissionName, $params);
        if ($allowCaching && empty($params)) {
            $this->_access[$permissionName] = $access;
        }

        return $access;
    }*/
}