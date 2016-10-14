<?php
namespace backend\controllers;

use Yii;

class DefaultController extends \backend\components\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
    
    public function actionError()
    {
        return $this->render('error', [
            'message' => Yii::$app->getErrorHandler()->exception->getMessage(),
        ]);
    }
}