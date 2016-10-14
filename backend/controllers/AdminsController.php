<?php
namespace backend\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use yii\widgets\ActiveForm;
use backend\models\Admin;

class AdminsController extends \backend\components\Controller
{
    public $rootActions = 'all';

    public function actionIndex()
    {
        $data = new ActiveDataProvider([
            'query' => Admin::find()->desc(),
        ]);
        Yii::$app->user->setReturnUrl(['/admin/admins']);

        return $this->render('index', [
            'data' => $data
        ]);
    }

    public function actionCreate()
    {
        $model = new Admin;
        $model->scenario = 'create';

        if ($model->load(Yii::$app->request->post())) {
            if(Yii::$app->request->isAjax){
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            }
            else{
                if($model->save()){
                    $this->flash('success', Yii::t('backend', 'Admin created'));
                    return $this->redirect(['/admin/admins']);
                }
                else{
                    $this->flash('error', Yii::t('backend', 'Create error. {0}', $model->formatErrors()));
                    return $this->refresh();
                }
            }
        }
        else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

    public function actionEdit($id)
    {
        $model = Admin::findOne($id);

        if($model === null){
            $this->flash('error', Yii::t('backend', 'Not found'));
            return $this->redirect(['/admin/admins']);
        }

        if ($model->load(Yii::$app->request->post())) {
            if(Yii::$app->request->isAjax){
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            }
            else{
                if($model->save()){
                    $this->flash('success', Yii::t('backend', 'Admin updated'));
                }
                else{
                    $this->flash('error', Yii::t('backend', 'Update error. {0}', $model->formatErrors()));
                }
                return $this->refresh();
            }
        }
        else {
            return $this->render('edit', [
                'model' => $model
            ]);
        }
    }

    public function actionDelete($id)
    {
        if(($model = Admin::findOne($id))){
            $model->delete();
        } else {
            $this->error = Yii::t('backend', 'Not found');
        }
        return $this->formatResponse(Yii::t('backend', 'Admin deleted'));
    }
    
    public function actionSearch($text)
    {
        return $this->render('index', [
            'text' => filter_var($text, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES),
            'data' => new ActiveDataProvider([
                'query' => Admin::find()
                ->where(['like', 'username', $text])
                ->desc()
            ]),
        ]);
    }
}