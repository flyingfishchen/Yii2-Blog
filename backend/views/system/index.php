<?php
use backend\models\Setting;
use yii\helpers\Url;

$this->title = Yii::t('backend', 'System');
?>
<!--<h4><?= Yii::t('backend', 'Current version') ?>: <b><?= Setting::get('backend_version') ?></b>
    <?php if(\backend\AdminModule::VERSION > floatval(Setting::get('backend_version'))) : ?>
        <a href="<?= Url::to(['/admin/system/update']) ?>" class="btn btn-success"><?= Yii::t('backend', 'Update') ?></a>
    <?php endif; ?>
</h4>-->

<br>

<p>
    <a href="<?= Url::to(['/admin/system/flush-cache']) ?>" class="btn btn-default"><i class="glyphicon glyphicon-flash"></i> <?= Yii::t('backend', 'Flush cache') ?></a>
</p>

<br>

<p>
    <a href="<?= Url::to(['/admin/system/clear-assets']) ?>" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i> <?= Yii::t('backend', 'Clear assets') ?></a>
</p>