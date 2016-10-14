<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use backend\modules\news\api\News;

/**
 * Site controller
 */
class PressController extends Controller
{

    public function actionIndex($tag = null)
    {
        return $this->render('index', [
            'news' => News::items([
                'tags' => $tag,
                'pagination' => [
                    'pageSize' => 5
                ]
            ])
        ]);
    }

    public function actionView($slug)
    {
        $news = News::get($slug);
        if (! $news) {
            throw new \yii\web\NotFoundHttpException('News not found.');
        }
        
        return $this->render('blog', ['news' => $news]);
    }

    public function actionError()
    {
        $exception = Yii::$app->getErrorHandler()->exception;
        if ($exception->statusCode == 404) {
            return $this->redirect(Yii::$app->params['attachUrl'] . '/not_found.html');
        }
        
        return $this->redirect(Yii::$app->params['attachUrl'] . '/server_busy.html');
    }
}
