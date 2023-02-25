<?php

namespace app\modules\admin\controllers;

use Yii;
use app\modules\admin\models\StudentDetailsStac;
use app\modules\admin\models\search\StudentDetailsStacSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use Exception;

/**
 * StudentDetailsStacController implements the CRUD actions for StudentDetailsStac model.
 */
class StudentDetailsStacController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['index', 'view', 'create', 'update', 'delete','upload-student-details'],
                        'roles' => ['@']
                    ],
                    [
                        'allow' => false
                    ]
                ]
            ]
        ];
    }

    /**
     * Lists all StudentDetailsStac models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new StudentDetailsStacSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $model = new StudentDetailsStac();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model'=>$model
        ]);
    }

    /**
     * Displays a single StudentDetailsStac model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new StudentDetailsStac model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new StudentDetailsStac();

        if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing StudentDetailsStac model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing StudentDetailsStac model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->deleteWithRelated();

        return $this->redirect(['index']);
    }

    
    /**
     * Finds the StudentDetailsStac model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StudentDetailsStac the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StudentDetailsStac::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }

    public function actionUploadStudentDetails(){
        $data=[];
        try{
        $model = new StudentDetailsStac();

        $excel_sheet = UploadedFile::getInstance($model, 'excel_sheet');
            if(!empty($excel_sheet)){

        $file_path = 'uploads/'.$excel_sheet->baseName . '.' . $excel_sheet->extension;
        $file_uploaded =   $excel_sheet->saveAs('uploads/' . $excel_sheet->baseName . '.' . $excel_sheet->extension);
        if($file_uploaded){
        $file =$file_path;
        $inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($file);
          
            $objReader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($file);
                $num=$objPHPExcel->getSheetCount();//get number of sheets
              
                for($i = 0 ; $i < $num ; $i++){
                    $sheet = $objPHPExcel->getSheet($i);
                    $highestRow = $sheet->getHighestRow();
                    $highestColumn = $sheet->getHighestColumn();
                    //$row is start 2 because first row assigned for heading.         
                    for($row=2; $row<=$highestRow; ++$row){
                        $rowData[] = $sheet->rangeToArray('A'.$row.':'.$highestColumn.$row,NULL,TRUE,FALSE);
                        $emptyRow = true;
                        foreach($rowData as $k => $v){
                            if($v){
                                $emptyRow = false;
                            }
                        }
                        if($emptyRow){
                            break;
                        }

                    }
                }
           

             

              foreach($rowData as $rowDataUpdate){
                $uploadStudentData = new StudentDetailsStac();
                $uploadStudentData->student_name= !empty($rowDataUpdate[0][1])?$rowDataUpdate[0][1]:'Not Set';
                $uploadStudentData->class= !empty($rowDataUpdate[0][2])?$rowDataUpdate[0][2]:'Not Set';
                $uploadStudentData->section= !empty($rowDataUpdate[0][3])?$rowDataUpdate[0][3]:'Not Set';
                $uploadStudentData->course= !empty($rowDataUpdate[0][4])?$rowDataUpdate[0][4]:'Not Set';
                $uploadStudentData->level= !empty($rowDataUpdate[0][5])?$rowDataUpdate[0][5]:'Not Set';
                $uploadStudentData->academic_year= !empty($rowDataUpdate[0][6])?$rowDataUpdate[0][6]:'Not Set';
                $uploadStudentData->school_name= !empty($rowDataUpdate[0][7])?$rowDataUpdate[0][7]:'Not Set';
                $uploadStudentData->status=1;
                $uploadStudentData->save(false);
              }
              
                if(unlink($file)){
                    $data['message'] ="Excel Updated Successfully";
                    $data['type'] = 'success';
                }
            }


        }else{
            $data['message'] ="Excel File Not Found";
            $data['type'] = 'error';   
        }



    }catch(Exception $e){
        $data['message'] =$e->getMessage();
        $data['type'] = 'error';    
    }

    return json_encode($data);
 

    }


}
