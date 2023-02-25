<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Courses */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="courses-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->errorSummary($model); ?>

    <?= $form->field($model, 'id')->hiddenInput(['placeholder' => 'Id'])->label(false) ?>

    <?= $form->field($model, 'courses_name')->textInput(['placeholder' => 'Courses Name']) ?>

    <?= $form->field($model, 'status')->hiddenInput(['placeholder' => 'Status','value'=>1])->label(false) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
