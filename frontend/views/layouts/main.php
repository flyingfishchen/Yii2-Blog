<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use frontend\assets\AppAsset;
use yii\httpclient\Client;
use common\helpers\Data;

AppAsset::register($this);

function getStaticHtml($type)
{
    $typeData = [
        'header' => ['cacheKey' => 'HEADER_KEY', 'url' => 'http://www.meizu.com/en/_partial/header.html'],
        'footer' => ['cacheKey' => 'FOOTER_KEY', 'url' => 'http://www.meizu.com/en/_partial/footer.html'],
    ];
  
    return Data::cache($typeData[$type]['cacheKey'], 3600, function() use ($typeData, $type) {
        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('get')
            ->setUrl($typeData[$type]['url'])
            ->setOptions(['timeout' => 5])
            ->send();

        return preg_replace('/href=\"(\s*\/en)/', 'href="http://www.meizu.com/en', $response->content);
    });
}
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<?= getStaticHtml('header'); ?>
<?= $content; ?>
<?= getStaticHtml('footer'); ?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
