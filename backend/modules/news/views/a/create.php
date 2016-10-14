<?php
$this->title = Yii::t('backend/news', 'Create news');
?>
<?= $this->render('_menu', ['text' => isset($text) ? $text : '']) ?>
<?= $this->render('_form', ['model' => $model]) ?>