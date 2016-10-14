<?php
use yii\helpers\Url;

$action = $this->context->action->id;
?>
<?php if(IS_ROOT) : ?>
    <ul class="nav nav-pills">
        <li <?= ($action === 'index') ? 'class="active"' : '' ?>>
            <a href="<?= $this->context->getReturnUrl('/admin/settings') ?>">
                <?php if($action === 'edit') : ?>
                    <i class="glyphicon glyphicon-chevron-left font-12"></i>
                <?php endif; ?>
                <?= Yii::t('backend', 'List') ?>
            </a>
        </li>
        <li <?= ($action === 'create') ? 'class="active"' : '' ?>><a href="<?= Url::to(['/admin/settings/create']) ?>"><?= Yii::t('backend', 'Create') ?></a></li>
    </ul>
    <br/>
<?php elseif($action === 'edit') : ?>
    <ul class="nav nav-pills">
        <li>
            <a href="<?= $this->context->getReturnUrl('/admin/settings') ?>">
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
                <?= Yii::t('backend', 'Back') ?>
            </a>
        </li>
    </ul>
    <br/>
<?php endif; ?>