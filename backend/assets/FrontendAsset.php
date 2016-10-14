<?php
namespace backend\assets;

class FrontendAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@backend/media';
    public $css = [
        'css/frontend.css',
    ];
    public $js = [
        'js/frontend.js'
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapAsset',
        'backend\assets\SwitcherAsset'
    ];
}
