<?php
namespace backend\modules\news\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use backend\behaviors\SortableDateController;
use yii\widgets\ActiveForm;
use yii\web\UploadedFile;
use backend\components\Controller;
use backend\modules\news\models\News;
use backend\helpers\Image;
use backend\behaviors\StatusController;

class AController extends Controller
{

    public function behaviors()
    {
        return [
            [
                'class' => SortableDateController::className(),
                'model' => News::className()
            ],
            [
                'class' => StatusController::className(),
                'model' => News::className()
            ]
        ];
    }

    public function actionIndex()
    {
        $data = new ActiveDataProvider([
            'query' => News::find()->orderBy([
                'sequence' => SORT_DESC,
                'time' => SORT_DESC
            ])
        ]);
        
        return $this->render('index', [
            'data' => $data
        ]);
    }

    public function actionCreate()
    {
        $model = new News();
        $model->time = time();
        
        if ($model->load(Yii::$app->request->post())) {
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            } else {
                if (isset($_FILES) && $this->module->settings['enableThumb']) {
                    $model->image = UploadedFile::getInstance($model, 'image');
                    if ($model->image && $model->validate(['image'])) {
                        $model->image = Image::upload($model->image, 'news');
                    } else {
                        $model->image = '';
                    }
                }
                if ($model->save()) {
                    $this->flash('success', Yii::t('backend/news', 'News created'));
                    return $this->redirect([
                        '/admin/' . $this->module->id
                    ]);
                } else {
                    $this->flash('error', Yii::t('backend', 'Create error. {0}', $model->formatErrors()));
                    return $this->refresh();
                }
            }
        } else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

    public function actionEdit($id)
    {
        $model = News::findOne($id);
        
        if ($model === null) {
            $this->flash('error', Yii::t('backend', 'Not found'));
            return $this->redirect([
                '/admin/' . $this->module->id
            ]);
        }
        
        if ($model->load(Yii::$app->request->post())) {
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            } else {
                if (isset($_FILES) && $this->module->settings['enableThumb']) {
                    $model->image = UploadedFile::getInstance($model, 'image');
                    if ($model->image && $model->validate([
                        'image'
                    ])) {
                        $model->image = Image::upload($model->image, 'news');
                    } else {
                        $model->image = $model->oldAttributes['image'];
                    }
                }
                
                if ($model->save()) {
                    $this->flash('success', Yii::t('backend/news', 'News updated'));
                } else {
                    $this->flash('error', Yii::t('backend', 'Update error. {0}', $model->formatErrors()));
                }
                return $this->refresh();
            }
        } else {
            return $this->render('edit', [
                'model' => $model
            ]);
        }
    }

    public function actionPhotos($id)
    {
        if (! ($model = News::findOne($id))) {
            return $this->redirect([
                '/admin/' . $this->module->id
            ]);
        }
        
        return $this->render('photos', [
            'model' => $model
        ]);
    }

    public function actionDelete($id)
    {
        if (($model = News::findOne($id))) {
            $model->delete();
        } else {
            $this->error = Yii::t('backend', 'Not found');
        }
        return $this->formatResponse(Yii::t('backend/news', 'News deleted'));
    }

    public function actionClearImage($id)
    {
        $model = News::findOne($id);
        
        if ($model === null) {
            $this->flash('error', Yii::t('backend', 'Not found'));
        } else {
            $model->image = '';
            if ($model->update()) {
                @unlink(Yii::getAlias('@webroot') . $model->image);
                $this->flash('success', Yii::t('backend', 'Image cleared'));
            } else {
                $this->flash('error', Yii::t('backend', 'Update error. {0}', $model->formatErrors()));
            }
        }
        return $this->back();
    }

    public function actionUp($id)
    {
        return $this->move($id, 'up');
    }

    public function actionDown($id)
    {
        return $this->move($id, 'down');
    }

    public function actionOn($id)
    {
        return $this->changeStatus($id, News::STATUS_ON);
    }

    public function actionOff($id)
    {
        return $this->changeStatus($id, News::STATUS_OFF);
    }
    
    public function actionSearch($text)
    {
        return $this->render('index', [
            'text' => filter_var($text, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES),
            'data' => new ActiveDataProvider([
                'query' => News::find()
                    ->where(['or', ['like', 'title', $text], ['like', 'short', $text], ['like', 'text', $text]])
                    ->orderBy(['sequence' => SORT_DESC, 'time' => SORT_DESC])
            ]),
        ]);
    }
}