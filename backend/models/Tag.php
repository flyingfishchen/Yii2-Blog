<?php
namespace backend\models;

class Tag extends \backend\components\ActiveRecord
{
    public static function tableName()
    {
        return '{{%tags}}';
    }

    public function rules()
    {
        return [
            ['name', 'required'],
            ['frequency', 'integer'],
            ['name', 'string', 'max' => 64],
        ];
    }
}