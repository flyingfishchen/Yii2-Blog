<?php
use yii\helpers\Html;
use yii\helpers\Url;
use backend\assets\AdminAsset;
use mdm\admin\components\Helper;

$asset = AdminAsset::register($this);
$moduleName = $this->context->module->id;
?>
<?php $this->beginPage() ?>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <?= Html::csrfMetaTags() ?>
    <title><?= Yii::t('backend', 'Control Panel') ?> - <?= Html::encode($this->title) ?></title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    <link rel="shortcut icon" href="<?= $asset->baseUrl ?>/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<?= $asset->baseUrl ?>/favicon.ico" type="image/x-icon">
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<div id="admin-body">
    <div class="container">
        <div class="wrapper">
            <div class="header">
                <div class="logo">
                    Meizu
                </div>
                <div class="nav">
                    <a href="<?= Yii::$app->params['frontendUrl'] ?>" target="_blank" class="pull-left"><i class="glyphicon glyphicon-home"></i> <?= Yii::t('backend', 'Open site') ?></a>
                    <a href="<?= Url::to(['/admin/sign/out']) ?>" class="pull-right"><i class="glyphicon glyphicon-log-out"></i> <?= Yii::t('backend', 'Logout') ?></a>
                </div>
            </div>
            <div class="main">
                <div class="box sidebar">
                    <?php foreach(Yii::$app->getModule('admin')->activeModules as $module) : ?>
                        <?php if (Helper::checkRoute("/admin/$module->name/")) :?>
                        <a href="<?= Url::to(["/admin/$module->name"]) ?>" class="menu-item <?= ($moduleName == $module->name ? 'active' : '') ?>">
                            <?php if($module->icon != '') : ?>
                                <i class="glyphicon glyphicon-<?= $module->icon ?>"></i>
                            <?php endif; ?>
                            <?= $module->title ?>
                            <?php if($module->notice > 0) : ?>
                                <span class="badge"><?= $module->notice ?></span>
                            <?php endif; ?>
                        </a>
                        <?php endif;?>
                    <?php endforeach; ?>
                    
                    <?php if (Helper::checkRoute('/admin/admins/')) :?>
                    <a href="<?= Url::to(['/admin/admins']) ?>" class="menu-item <?= ($moduleName == 'admin' && $this->context->id == 'admins') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-user"></i>
                        <?= Yii::t('backend', 'Admins') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/rabc/assignment/')) :?>
                    <a href="<?= Url::to(['/rabc/assignment']) ?>" class="menu-item <?= ($moduleName == 'rabc' && $this->context->id == 'assignment') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-th-large"></i>
                        <?= Yii::t('backend', 'Assignment') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/rabc/role/')) :?>
                    <a href="<?= Url::to(['/rabc/role']) ?>" class="menu-item <?= ($moduleName == 'rabc' && $this->context->id == 'role') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-th"></i>
                        <?= Yii::t('backend', 'Role') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/rabc/route/')) :?>
                    <a href="<?= Url::to(['/rabc/route']) ?>" class="menu-item <?= ($moduleName == 'rabc' && $this->context->id == 'route') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-th-list"></i>
                        <?= Yii::t('backend', 'Route') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/admin/system/')) :?>
                    <a href="<?= Url::to(['/admin/system']) ?>" class="menu-item <?= ($moduleName == 'admin' && $this->context->id == 'system') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-hdd"></i>
                        <?= Yii::t('backend', 'System') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/admin/settings/')) :?>
                    <a href="<?= Url::to(['/admin/settings']) ?>" class="menu-item <?= ($moduleName == 'admin' && $this->context->id == 'settings') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-cog"></i>
                        <?= Yii::t('backend', 'Settings') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/admin/modules/')) :?>
                    <a href="<?= Url::to(['/admin/modules']) ?>" class="menu-item <?= ($moduleName == 'admin' && $this->context->id == 'modules') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-folder-close"></i>
                        <?= Yii::t('backend', 'Modules') ?>
                    </a>
                    <?php endif;?>
                    
                    <?php if (Helper::checkRoute('/admin/logs/')) :?>
                    <a href="<?= Url::to(['/admin/logs']) ?>" class="menu-item <?= ($moduleName == 'admin' && $this->context->id == 'logs') ? 'active' :'' ?>">
                        <i class="glyphicon glyphicon-align-justify"></i>
                        <?= Yii::t('backend', 'Logs') ?>
                    </a>
                    <?php endif;?>
                </div>
                <div class="box content">
                    <div class="page-title">
                        <?= $this->title ?>
                    </div>
                    <div class="container-fluid">
                        <?php foreach(Yii::$app->session->getAllFlashes() as $key => $message) : ?>
                            <div class="alert alert-<?= $key ?>"><?= $message ?></div>
                        <?php endforeach; ?>
                        <?= $content ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
