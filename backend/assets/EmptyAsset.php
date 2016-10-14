<?php
namespace backend\assets;

class EmptyAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@backend/media';
    public $css = [
        'css/empty.css',
    ];
    public $depends = [
        'yii\bootstrap\BootstrapAsset',
    ];
}
