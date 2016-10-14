<?php
namespace backend\controllers;

use yii\data\ActiveDataProvider;

use backend\models\LoginForm;

class LogsController extends \backend\components\Controller
{
    public $rootActions = 'all';

    public function actionIndex()
    {
        $data = new ActiveDataProvider([
            'query' => LoginForm::find()->desc(),
        ]);

        return $this->render('index', [
            'data' => $data
        ]);
    }
}