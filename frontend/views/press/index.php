<?php
use frontend\assets\IndexAsset;
use backend\modules\news\api\News;
use yii\helpers\Html;

$bundle = IndexAsset::register($this);

$this->title = 'Meizu Press';
?>
<div class="page-wrapper">
	<div class="banner">
		<div class="center-wrapper">
			<h1 class="banner-title">Press Releases</h1>
			<div class="banner-pic">
				<img src="<?= $bundle->baseUrl; ?>/pages/index/images/press-banner.jpg" alt="Press Banner">
			</div>
		</div>
	</div>

	<div class="articles">
		<div class="center-wrapper">
		    <ul>
		    <?php foreach($news as $item) : ?>
                <li class="article">
					<h2 class="article-title"><?= Html::a($item->title, Yii::$app->params['frontendUrl'] . '/press/view/' . $item->model->news_id, ['title' => $item->title]) ?></h2>
					<div class="article-fragment">
						<?= Html::encode($item->short); ?>
					</div>
				</li>
            <?php endforeach; ?>
            </ul>
            <div class="pagination-wrap">
            <?= News::pages() ?>
            </div>
            
		</div>				
	</div>
</div>
