<?php

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\search\StudentDetailsStacSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

use yii\helpers\Html;
use kartik\export\ExportMenu;
use kartik\grid\GridView;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use yii\web\View;
$this->title = Yii::t('app', 'Student Details ');
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
            url:'student-details-stac/upload-student-details',
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
JS;
$this->registerJs($script,View::POS_END);



?>
<div class="student-details-stac-index">

    <h1><?= Html::encode($this->title) ?></h1>


    <p>
        <?= Html::a(Yii::t('app', 'Create Student Details'), ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a(Yii::t('app', 'Advance Search'), '#', ['class' => 'btn btn-info search-button']) ?>

    </p>
    <p>
   

    <div class="student-details-stac-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->errorSummary($model); ?>

    <?= $form->field($model, 'excel_sheet')->fileInput(['placeholder' => 'excel sheet']) ?>

    <button type="button" id="uploadFile" class="btn btn-primary">Upload</button>
    <a href="<?= Url::base().'/example/Abacus certificate.xlsx' ?>"><b>Click To Download Example Format</b></a>
    <?php ActiveForm::end(); ?>

</div>
 
    </p>
    <div class="search-form" style="display:none">
        <?=  $this->render('_search', ['model' => $searchModel]); ?>
    </div>
    <?php 
    $gridColumn = [
        ['class' => 'yii\grid\SerialColumn'],
        'id',
        'school_name',
        'class',
        'section',
        'course',
        'student_name',
        'academic_year',
        'level',
        'status',
        [
            'class' => 'yii\grid\ActionColumn',
        ],
    ]; 
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumn,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-student-details-stac']],
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
            ]) ,
        ],
    ]); ?>

</div>



 
