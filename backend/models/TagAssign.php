<?php
namespace backend\models;

class TagAssign extends \backend\components\ActiveRecord
{
    public static function tableName()
    {
        return '{{%tags_assign}}';
    }
}