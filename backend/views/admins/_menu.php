<?php
use yii\helpers\Url;
use yii\helpers\Html;

$action = $this->context->action->id;
$module = $this->context->module->id;
$controller = $this->context->id;
?>
<ul class="nav nav-pills">
    <li <?= ($action === 'index') ? 'class="active"' : '' ?>>
        <a href="<?= $this->context->getReturnUrl(['/admin/admins']) ?>">
            <?php if($action === 'edit') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            <?= Yii::t('backend', 'List') ?>
        </a>
    </li>
    <li <?= ($action==='create') ? 'class="active"' : '' ?>><a href="<?= Url::to(['/admin/admins/create']) ?>"><?= Yii::t('backend', 'Create') ?></a></li>
    <li class="navbar-right" style="margin-right:0px">
        <?= Html::beginForm(Url::to(['/admin/'.$controller.'/search']), 'get', ['class' => 'form-inline', 'style' => 'margin: 3px 0px']) ?>
            <div class="form-group">
                <?= Html::textInput('text', isset($text) ? $text : '', ['class' => 'form-control', 'placeholder' => 'Search']) ?>
            </div>
            <?= Html::submitButton('<i class="glyphicon glyphicon-search"></i>', ['class' => 'btn btn-default']) ?>
        <?= Html::endForm() ?>
    </li>
</ul>
<br/>
