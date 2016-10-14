<?php
namespace backend\modules\news\api;

use Yii;
use backend\components\API;
use yii\helpers\Html;
use yii\helpers\Url;

class PhotoObject extends \backend\components\ApiObject
{

    public $image;

    public $description;

    public function box($width, $height)
    {
        $img = Html::img($this->thumb($width, $height));
        $a = Html::a($img, $this->image, [
            'class' => 'easyii-box',
            'rel' => 'news-' . $this->model->item_id,
            'title' => $this->description
        ]);
        return LIVE_EDIT ? API::liveEdit($a, $this->editLink) : $a;
    }

    public function getEditLink()
    {
        return Url::to([
            '/admin/news/a/photos',
            'id' => $this->model->item_id
        ]) . '#photo-' . $this->id;
    }
}