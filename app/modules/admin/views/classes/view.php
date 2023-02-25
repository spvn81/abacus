<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Classes */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Classes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="classes-view">

    <div class="row">
        <div class="col-sm-9">
            <h2><?= Yii::t('app', 'Classes').' '. Html::encode($this->title) ?></h2>
        </div>
        <div class="col-sm-3" style="margin-top: 15px">
            
            <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
            <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ])
            ?>
        </div>
    </div>

    <div class="row">
<?php 
    $gridColumn = [
        'id',
        [
            'attribute' => 'school.id',
            'label' => Yii::t('app', 'School'),
        ],
        'class_name',
        'status',
    ];
    echo DetailView::widget([
        'model' => $model,
        'attributes' => $gridColumn
    ]);
?>
    </div>
    <div class="row">
        <h4>User<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnUser = [
        'id',
        'username',
        'auth_key',
        'password_hash',
        'password_reset_token',
        'email',
        'first_name',
        'last_name',
        'status',
    ];
    echo DetailView::widget([
        'model' => $model->createdBy,
        'attributes' => $gridColumnUser    ]);
    ?>
    <div class="row">
        <h4>User<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnUser = [
        'id',
        'username',
        'auth_key',
        'password_hash',
        'password_reset_token',
        'email',
        'first_name',
        'last_name',
        'status',
    ];
    echo DetailView::widget([
        'model' => $model->updatedBy,
        'attributes' => $gridColumnUser    ]);
    ?>
    <div class="row">
        <h4>Schools<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnSchools = [
        'id',
        'school_name',
        'address',
        'status',
    ];
    echo DetailView::widget([
        'model' => $model->school,
        'attributes' => $gridColumnSchools    ]);
    ?>
    
    <div class="row">
<?php
if($providerSections->totalCount){
    $gridColumnSections = [
        ['class' => 'yii\grid\SerialColumn'],
            'id',
                        'section_name',
            'status',
    ];
    echo Gridview::widget([
        'dataProvider' => $providerSections,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-sections']],
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="glyphicon glyphicon-book"></span> ' . Html::encode(Yii::t('app', 'Sections')),
        ],
        'export' => false,
        'columns' => $gridColumnSections
    ]);
}
?>

    </div>
    
    <div class="row">
<?php
if($providerStudentDetails->totalCount){
    $gridColumnStudentDetails = [
        ['class' => 'yii\grid\SerialColumn'],
            'id',
            [
                'attribute' => 'school.id',
                'label' => Yii::t('app', 'School')
            ],
                        [
                'attribute' => 'course.username',
                'label' => Yii::t('app', 'Course')
            ],
            'student_name',
            'academic_year',
            'level',
            'status',
    ];
    echo Gridview::widget([
        'dataProvider' => $providerStudentDetails,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-student-details']],
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="glyphicon glyphicon-book"></span> ' . Html::encode(Yii::t('app', 'Student Details')),
        ],
        'export' => false,
        'columns' => $gridColumnStudentDetails
    ]);
}
?>

    </div>
</div>
