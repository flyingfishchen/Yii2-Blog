<?php
use backend\models\Setting;
use yii\helpers\Url;
use yii\helpers\Html;

$this->title = Yii::t('backend', 'Settings');
?>

<?= $this->render('_menu') ?>

<?php if($data->count > 0) : ?>
    <table class="table table-hover">
        <thead>
        <tr>
            <?php if(IS_ROOT) : ?>
                <th width="50">#</th>
                <th><?= Yii::t('backend', 'Name') ?></th>
            <?php endif; ?>
            <th><?= Yii::t('backend', 'Title') ?></th>
            <th><?= Yii::t('backend', 'Value') ?></th>
            <?php if(IS_ROOT) : ?>
                <th width="30"></th>
            <?php endif; ?>
        </tr>
        </thead>
        <tbody>
        <?php foreach($data->models as $setting) : ?>
            <tr <?php if($setting->visibility == Setting::VISIBLE_ROOT) echo 'class="warning"'?>>
                <?php if(IS_ROOT) : ?>
                    <td><?= $setting->primaryKey ?></td>
                    <td><?= Html::encode($setting->name) ?></td>
                <?php endif; ?>
                <td><a href="<?= Url::to(['/admin/settings/edit', 'id' => $setting->primaryKey]) ?>" title="<?= Yii::t('backend', 'Edit') ?>"><?= Html::encode($setting->title) ?></a></td>
                <td style="overflow: hidden"><?= Html::encode($setting->value) ?></td>
                <?php if(IS_ROOT) : ?>
                    <td><a href="<?= Url::to(['/admin/settings/delete', 'id' => $setting->primaryKey]) ?>" class="glyphicon glyphicon-remove confirm-delete" title="<?= Yii::t('backend', 'Delete item') ?>"></a></td>
                <?php endif; ?>
            </tr>
        <?php endforeach; ?>
        </tbody>
        <?= yii\widgets\LinkPager::widget([
            'pagination' => $data->pagination
        ]) ?>
    </table>
<?php else : ?>
    <p><?= Yii::t('backend', 'No records found') ?></p>
<?php endif; ?>