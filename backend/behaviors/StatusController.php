<?php
namespace backend\behaviors;

use Yii;

/**
 * Status behavior.
 * Adds statuses to models
 * 
 * @package backend\behaviors
 */
class StatusController extends \yii\base\Behavior
{

    public $model;

    public function changeStatus($id, $status)
    {
        $modelClass = $this->model;
        
        if (($model = $modelClass::findOne($id))) {
            $model->status = $status;
            if ($model->update() === false) {
                $this->owner->error = Yii::t('backend', 'Failed to change Status');
            }
        } else {
            $this->owner->error = Yii::t('backend', 'Not found');
        }
        
        return $this->owner->formatResponse(Yii::t('backend', 'Status successfully changed'));
    }
}