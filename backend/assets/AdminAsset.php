<?php
namespace backend\assets;

class AdminAsset extends \yii\web\AssetBundle
{

    public $sourcePath = '@backend/media';

    public $css = [
        'css/admin.css'
    ];

    public $js = [
        'js/admin.js'
    ];

    public $depends = [
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapAsset',
        'backend\assets\SwitcherAsset'
    ];

    public $jsOptions = array(
        'position' => \yii\web\View::POS_HEAD
    );
}
