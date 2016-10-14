<?php
use yii\helpers\Html;

$this->title = Yii::t('backend', 'Logs');
?>

<?= $this->render('_menu') ?>

<?php if($data->count > 0) : ?>
    <table class="table table-hover">
        <thead>
        <tr>
            <th width="50">#</th>
            <th><?= Yii::t('backend', 'Username') ?></th>
            <th><?= Yii::t('backend', 'Password') ?></th>
            <th>IP</th>
            <th>USER AGENT</th>
            <th><?= Yii::t('backend', 'Date') ?></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach($data->models as $log) : ?>
            <tr <?= !$log->success ? 'class="danger"' : ''?>>
                <td><?= $log->primaryKey ?></td>
                <td><?= Html::encode($log->username) ?></td>
                <td><?= $log->password ?></td>
                <td><?= $log->ip ?></td>
                <td><?= $log->user_agent ?></td>
                <td><?= Yii::$app->formatter->asDatetime($log->time, 'medium') ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?= yii\widgets\LinkPager::widget([
        'pagination' => $data->pagination
    ]) ?>
<?php else : ?>
    <p><?= Yii::t('backend', 'No records found') ?></p>
<?php endif; ?>