<?php
use backend\widgets\Photos;

$this->title = $model->title;
?>

<?= $this->render('_menu', ['text' => isset($text) ? $text : '']) ?>
<?= $this->render('_submenu', ['model' => $model]) ?>

<?= Photos::widget(['model' => $model])?>