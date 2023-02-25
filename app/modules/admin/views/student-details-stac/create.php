<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\StudentDetailsStac */

$this->title = Yii::t('app', 'Create Student Details Stac');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Student Details Stacs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="student-details-stac-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
