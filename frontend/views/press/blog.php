<?php

/* @var $this yii\web\View */

use frontend\assets\BlogAsset;
use yii\helpers\Html;

$bundle = BlogAsset::register($this);

$this->title = $news->seo('title', $news->model->title);
?>
<div class="page-wrapper">
	<div class="banner">
		<div class="center-wrapper">
			<h1 class="banner-title"><?= Html::encode($news->model->title) ?></h1>
			<div class="banner-pic">
				<img src="<?= $bundle->baseUrl ?>/pages/blog/images/blog-banner.jpg" alt="Press Banner">
			</div>
		</div>
	</div>

	<div class="article">
		<div class="center-wrapper">
			<div class="article-content">
				<?= $news->text ?>
			</div>
		</div>
	</div>
</div>
