<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\search\StudentDetailsStacSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="form-student-details-stac-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id')->textInput(['placeholder' => 'Id']) ?>

    <?= $form->field($model, 'school_name')->textInput(['maxlength' => true, 'placeholder' => 'School Name']) ?>

    <?= $form->field($model, 'class')->textInput(['maxlength' => true, 'placeholder' => 'Class']) ?>

    <?= $form->field($model, 'section')->textInput(['maxlength' => true, 'placeholder' => 'Section']) ?>

    <?= $form->field($model, 'course')->textInput(['maxlength' => true, 'placeholder' => 'Course']) ?>

    <?php /* echo $form->field($model, 'student_name')->textInput(['maxlength' => true, 'placeholder' => 'Student Name']) */ ?>

    <?php /* echo $form->field($model, 'academic_year')->textInput(['maxlength' => true, 'placeholder' => 'Academic Year']) */ ?>

    <?php /* echo $form->field($model, 'level')->textInput(['maxlength' => true, 'placeholder' => 'Level']) */ ?>

    <?php /* echo $form->field($model, 'status')->textInput(['placeholder' => 'Status']) */ ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
