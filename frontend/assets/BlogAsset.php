<?php
namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class BlogAsset extends AssetBundle
{

    public $sourcePath = '@frontend/assets/blog/build';

    public $css = [
        'pages/blog/blog.css'
    ];

    public $js = [];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset'
    ];
}
