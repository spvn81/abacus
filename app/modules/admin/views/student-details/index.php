<?php

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\search\StudentDetailsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

use yii\helpers\Html;
use kartik\export\ExportMenu;
use kartik\grid\GridView;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use yii\web\View;
use kartik\depdrop\DepDrop;

$this->title = Yii::t('app', 'Student Details');
$this->params['breadcrumbs'][] = $this->title;
$search = "$('.search-button').click(function(){
	$('.search-form').toggle(1000);
	return false;
});";
$this->registerJs($search);
$script = <<< JS
   $("#uploadFile").on("click",function(e){
       $( "#uploadFile" ).prop( "disabled", true );
        var formData = new FormData($("#w0")[0]);
            $.ajax({
            type:'post',
            url:'student-details/upload-student-details',
            data: formData,
            async: false,
        success: function (data) {
           let response = JSON.parse(data)
            if(response.type=='success'){
            Swal.fire({
            title: 'Success',
            text: response.message,
            icon: 'success',
            confirmButtonText: 'Ok'
            }).then((result)=>{
                if (result.isConfirmed) {
                   location.reload()

                }
            })
            }else{
                Swal.fire({
            title: 'error',
            text: response.message,
            icon: 'error',
            confirmButtonText: 'Ok'
            })
            $( "#uploadFile" ).prop( "disabled", false );

            }
           
       
        },
        cache: false,
        contentType: false,
        processData: false



        })
       
    })

    $("#delete").on("click",function(){
        let selected = $("input[type=checkbox]");
        let data = selected.serialize();
        console.log(data)
        alert(22)


   });




JS;
$this->registerJs($script, View::POS_END);


?>
<div class="student-details-index">
<p>
    <div class="student-details-form">

        <?php $form = ActiveForm::begin(); ?>


        <?= $form->errorSummary($model); ?>

        <div class="row">
        <div class="col-md-6">


        <?= $form->field($model, 'school_id')->widget(\kartik\widgets\Select2::classname(), [
            'data' => \yii\helpers\ArrayHelper::map(\app\modules\admin\models\Schools::find()->orderBy('id')->asArray()->all(), 'id', 'school_name'),
            'options' => ['placeholder' => Yii::t('app', 'Choose Schools')],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ]); ?>
        </div>


        <div class="col-md-6">

        <?=  $form->field($model, 'class_id')->widget(DepDrop::classname(), [
    'options'=>['id'=>'class_id-id'],
    'pluginOptions'=>[
        'depends'=>['studentdetails-school_id'],
        'placeholder'=>'Select...',
        'url'=>Url::to(['/admin/student-details/get-class'])
    ]
]); ?>
        </div>

        <div class="col-md-6">

        <?= $form->field($model, 'course_id')->widget(\kartik\widgets\Select2::classname(), [
            'data' => \yii\helpers\ArrayHelper::map(\app\modules\admin\models\Courses::find()->orderBy('id')->asArray()->all(), 'id', 'courses_name'),
            'options' => ['placeholder' => Yii::t('app', 'Choose Courses')],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ]); ?>
        </div>

    <div class="col-md-6">
            <?= $form->field($model, 'excel_sheet')->fileInput(['placeholder' => 'excel sheet']) ?>
        </div>
        <div class="col-md-12">
        <button type="button" id="uploadFile" class="btn btn-primary">Upload</button>
        </div>

        <a href="<?= Url::base() . '/example/Abacus certificate.xlsx' ?>"><b>Click To Download Example Format</b></a>
        </div>
        <div class="row">
        <div class="col-md-12">
        <button type="button" id="delete" class="btn btn-danger">Delete</button>
        </div>
        </div>
        <?php ActiveForm::end(); ?>

    </div>

    </p>

    <div class="search-form" style="display:none">
        <?= $this->render('_search', ['model' => $searchModel]); ?>
    </div>
    <?php
    $gridColumn = [
        ['class' => 'yii\grid\CheckboxColumn', 'checkboxOptions' => function($model) {
            return ['value' => $model->id];
        }],

        ['class' => 'yii\grid\SerialColumn'],
        'id',
        [
            'attribute' => 'school_id',
            'label' => Yii::t('app', 'School'),
            'value' => function ($model) {
                return $model->school->school_name;
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => \yii\helpers\ArrayHelper::map(\app\modules\admin\models\Schools::find()->asArray()->all(), 'id', 'id'),
            'filterWidgetOptions' => [
                'pluginOptions' => ['allowClear' => true],
            ],
            'filterInputOptions' => ['placeholder' => 'Schools', 'id' => 'grid-student-details-search-school_id']
        ],
        [
            'attribute' => 'class_id',
            'label' => Yii::t('app', 'Class'),
            'value' => function ($model) {
                return $model->class->class_name;
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => \yii\helpers\ArrayHelper::map(\app\modules\admin\models\Classes::find()->asArray()->all(), 'id', 'id'),
            'filterWidgetOptions' => [
                'pluginOptions' => ['allowClear' => true],
            ],
            'filterInputOptions' => ['placeholder' => 'Classes', 'id' => 'grid-student-details-search-class_id']
        ],
        [
            'attribute' => 'course_id',
            'label' => Yii::t('app', 'Course'),
            'value' => function ($model) {
                return $model->course->courses_name;
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => \yii\helpers\ArrayHelper::map(\app\modules\admin\models\Courses::find()->asArray()->all(), 'id', 'id'),
            'filterWidgetOptions' => [
                'pluginOptions' => ['allowClear' => true],
            ],
            'filterInputOptions' => ['placeholder' => 'Courses', 'id' => 'grid-student-details-search-course_id']
        ],
        'student_name',
        'academic_year',
        'level',
        'status',


        [
            'class' => 'kartik\grid\ActionColumn',
             'template' => '{download}{view} {update} {delete}',
             'buttons' => [

                'download'=> function($url,$model) {
           
                    return Html::a( '<span class="fas fa-download" aria-hidden="true"></span>', $url);
             
                },

            'view'=> function($url,$model) {
           
                    return Html::a( '<span class="fas fa-eye" aria-hidden="true"></span>', $url);
             
                },
            'update'=> function($url,$model) {
          
                    return Html::a( '<span class="fas fa-pencil-alt" aria-hidden="true"></span>', $url);
               
                },
            'delete'=> function($url,$model) {
                    return Html::a( '<span class="fas fa-trash-alt" aria-hidden="true"></span>', $url);
               
                },
        ]
        ],



    ];
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumn,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-student-details']],
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="glyphicon glyphicon-book"></span>  ' . Html::encode($this->title),
        ],
        'export' => false,
        // your toolbar can include the additional full export menu
        'toolbar' => [
            '{export}',
            ExportMenu::widget([
                'dataProvider' => $dataProvider,
                'columns' => $gridColumn,
                'target' => ExportMenu::TARGET_BLANK,
                'fontAwesome' => true,
                'dropdownOptions' => [
                    'label' => 'Full',
                    'class' => 'btn btn-default',
                    'itemsBefore' => [
                        '<li class="dropdown-header">Export All Data</li>',
                    ],
                ],
                'exportConfig' => [
                    ExportMenu::FORMAT_PDF => false
                ]
            ]),
        ],
    ]); ?>

</div>