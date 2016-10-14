<?php
namespace backend\controllers;

use Yii;
use backend\helpers\WebConsole;
use backend\models\Setting;

class SystemController extends \backend\components\Controller
{

    public $rootActions = [
        '*'
    ];

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionUpdate()
    {
        $result = WebConsole::migrate();
        
        Setting::set('backend_version', \backend\AdminModule::VERSION);
        Yii::$app->cache->flush();
        
        return $this->render('update', [
            'result' => $result
        ]);
    }

    public function actionFlushCache()
    {
        Yii::$app->cache->flush();
        $this->flash('success', Yii::t('backend', 'Cache flushed'));
        return $this->back();
    }

    public function actionClearAssets()
    {
        $targets = array_merge(glob(Yii::getAlias('@frontend') . '/web/assets' . DIRECTORY_SEPARATOR . '*'), 
            glob(Yii::$app->assetManager->basePath . DIRECTORY_SEPARATOR . '*'));
        foreach ($targets as $asset) {
            if (is_link($asset)) {
                unlink($asset);
            } elseif (is_dir($asset)) {
                $this->deleteDir($asset);
            } else {
                unlink($asset);
            }
        }
        $this->flash('success', Yii::t('backend', 'Assets cleared'));
        return $this->back();
    }

    public function actionLiveEdit($id)
    {
        Yii::$app->session->set('backend_live_edit', $id);
        $this->back();
    }

    private function deleteDir($directory)
    {
        $iterator = new \RecursiveDirectoryIterator($directory, \RecursiveDirectoryIterator::SKIP_DOTS);
        $files = new \RecursiveIteratorIterator($iterator, \RecursiveIteratorIterator::CHILD_FIRST);
        foreach ($files as $file) {
            if ($file->isDir()) {
                rmdir($file->getRealPath());
            } else {
                unlink($file->getRealPath());
            }
        }
        return rmdir($directory);
    }
}