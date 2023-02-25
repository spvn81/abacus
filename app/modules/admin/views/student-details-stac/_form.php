<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\StudentDetailsStac */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="student-details-stac-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->errorSummary($model); ?>

    <?= $form->field($model, 'id')->textInput(['placeholder' => 'Id']) ?>

    <?= $form->field($model, 'school_name')->textInput(['maxlength' => true, 'placeholder' => 'School Name']) ?>

    <?= $form->field($model, 'class')->textInput(['maxlength' => true, 'placeholder' => 'Class']) ?>

    <?= $form->field($model, 'section')->textInput(['maxlength' => true, 'placeholder' => 'Section']) ?>

    <?= $form->field($model, 'course')->textInput(['maxlength' => true, 'placeholder' => 'Course']) ?>

    <?= $form->field($model, 'student_name')->textInput(['maxlength' => true, 'placeholder' => 'Student Name']) ?>

    <?= $form->field($model, 'academic_year')->textInput(['maxlength' => true, 'placeholder' => 'Academic Year']) ?>

    <?= $form->field($model, 'level')->textInput(['maxlength' => true, 'placeholder' => 'Level']) ?>

    <?= $form->field($model, 'status')->textInput(['placeholder' => 'Status']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
