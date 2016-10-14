<?php
namespace backend\helpers;

use Yii;

/**
 * Description of Helper
 *
 * @author chen ming <huster.chenming@gmail.com>
 * @since 1.0
 */
class Assignment
{

    /**
     *
     * @param string $id            
     * @return array
     */
    public static function getItems($id)
    {
        $manager = Yii::$app->getAuthManager();
        $avaliable = [];
        foreach (array_keys($manager->getRoles()) as $name) {
            $avaliable[$name] = 'role';
        }
        
        foreach (array_keys($manager->getPermissions()) as $name) {
            if ($name[0] != '/') {
                $avaliable[$name] = 'permission';
            }
        }
        
        $assigned = [];
        foreach ($manager->getAssignments($id) as $item) {
            $assigned[$item->roleName] = $avaliable[$item->roleName];
            unset($avaliable[$item->roleName]);
        }
        
        return [
            'avaliable' => $avaliable,
            'assigned' => $assigned
        ];
    }
}
