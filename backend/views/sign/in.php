<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$asset = \backend\assets\EmptyAsset::register($this);
$this->title = Yii::t('backend', 'Sign in');
?>
<div class="container">
    <div id="wrapper" class="col-md-4 col-md-offset-4 vertical-align-parent">
        <div class="vertical-align-child">
            <div class="panel">
                <div class="panel-heading text-center">
                    <?= Yii::t('backend', 'Meizu Press Platform') ?>
                </div>
                <div class="panel-body">
                    <?php $form = ActiveForm::begin([
                        'fieldConfig' => [
                            'template' => "{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}"
                        ]
                    ])
                    ?>
                        <?= $form->field($model, 'username')->textInput(['class'=>'form-control', 'placeholder'=>Yii::t('backend', 'Username')]) ?>
                        <?= $form->field($model, 'password')->passwordInput(['class'=>'form-control', 'placeholder'=>Yii::t('backend', 'Password')]) ?>
                        <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                            'captchaAction' => '/admin/sign/captcha',
                            'imageOptions' => ['title' => 'Click to refresh', 'style' => 'cursor:pointer;display: inline;width: 37%;'],
                            'template' => '{input}{image}',
                        ])?>
                        <?=Html::submitButton(Yii::t('backend', 'Login'), ['class'=>'btn btn-lg btn-primary btn-block']) ?>
                    <?php ActiveForm::end(); ?>
                </div>
            </div>
            <!--<div class="text-center">
                <a class="logo" href="http://easyiicms.com" target="_blank" title="EasyiiCMS homepage">
                    <img src="<?= $asset->baseUrl ?>/img/logo_20.png">EasyiiCMS
                </a>
            </div>-->
        </div>
    </div>
</div>
