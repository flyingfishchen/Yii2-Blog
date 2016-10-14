<?php
namespace backend\behaviors;

use Yii;

class SortableDateController extends \yii\base\Behavior
{

    public $model;

    public function move($id, $direction, $condition = [])
    {
        $modelClass = $this->model;
        $success = '';
        if (($model = $modelClass::findOne($id))) {
            if ($direction === 'up') {
                $eq = '>';
                $orderDir = SORT_ASC;
            } else {
                $eq = '<';
                $orderDir = SORT_DESC;
            }
            
            $query = $modelClass::find();
            $where = [$eq, 'sequence', $model->sequence];
            if (count($condition)) {
                $where = ['and', $where];
                foreach ($condition as $key => $value) {
                    $where[] = [$key => $value];
                }
            }
            $modelSwap = $query->where($where)
                ->orderBy(['sequence' => $orderDir, 'time' => $orderDir])
                ->one();
            
            if (! empty($modelSwap)) {
                $newOrderNum = $modelSwap->sequence;
                
                $modelSwap->sequence = $model->sequence;
                $modelSwap->update(false, ['sequence']);
                
                $model->sequence = $newOrderNum;
                $model->update(false, ['sequence']);
                
                $success = [
                    'swap_id' => $modelSwap->primaryKey
                ];
            }
        } else {
            $this->owner->error = Yii::t('backend', 'Not found');
        }
        
        return $this->owner->formatResponse($success);
    }
}