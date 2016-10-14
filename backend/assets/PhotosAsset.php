<?php
namespace backend\assets;

class PhotosAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@backend/assets/photos';
    public $css = [
        'photos.css',
    ];
    public $js = [
        'photos.js'
    ];
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}
