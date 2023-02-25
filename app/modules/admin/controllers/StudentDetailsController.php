<?php

namespace app\modules\admin\controllers;

use app\modules\admin\models\Classes;
use Yii;
use app\modules\admin\models\StudentDetails;
use app\modules\admin\models\search\StudentDetailsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use Exception;
use kartik\mpdf\Pdf;


/**
 * StudentDetailsController implements the CRUD actions for StudentDetails model.
 */
class StudentDetailsController extends Controller
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
                        'actions' => ['index', 'view', 'create', 'update', 'delete','upload-student-details','get-class','download'],
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
     * Lists all StudentDetails models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new StudentDetailsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $model = new StudentDetails();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model'=>$model
        ]);
    }

    /**
     * Displays a single StudentDetails model.
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


    public function actionDownload($id){
        $model = $this->findModel($id);
        $content = $this->renderPartial('download',[
            'model'=>$model
        ]);


    $pdf = new Pdf([
        'mode' => Pdf::MODE_CORE, 
        'format' => Pdf::FORMAT_A3, 
        'orientation' => Pdf::ORIENT_LANDSCAPE, 
        'destination' => Pdf::DEST_BROWSER, 
        'content' => $content,  
        ]);
    
    return $pdf->render(); 

    }

    /**
     * Creates a new StudentDetails model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new StudentDetails();

        if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing StudentDetails model.
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
     * Deletes an existing StudentDetails model.
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
     * Finds the StudentDetails model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StudentDetails the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StudentDetails::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }

    
    public function actionUploadStudentDetails(){
        $data=[];
        try{
        $post = Yii::$app->request->post();
        $model = new StudentDetails();
        $school_id  = !empty($post['StudentDetails']['school_id'])?$post['StudentDetails']['school_id']:$err['school_id']='school_id required';
        $class_id  = !empty($post['StudentDetails']['class_id'])?$post['StudentDetails']['class_id']:$err['class_id']='class_id required';
        $course_id  = !empty($post['StudentDetails']['course_id'])?$post['StudentDetails']['course_id']:$err['course_id']='course_id required';
        $excel_sheet = UploadedFile::getInstance($model, 'excel_sheet');
        if(!empty($excel_sheet)){
        if(!empty($err)){
            $data['message'] ="School and Class and Course are required";
            $data['type'] = 'error';   
        }else{
            

   
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
                $uploadStudentData = new StudentDetails();
                $uploadStudentData->school_id =$school_id;
                $uploadStudentData->student_name= !empty($rowDataUpdate[0][1])?$rowDataUpdate[0][1]:'Not Set';
                $uploadStudentData->class_id=$class_id;
                $uploadStudentData->course_id= $course_id;
                $uploadStudentData->level= !empty($rowDataUpdate[0][2])?$rowDataUpdate[0][2]:'Not Set';
                $uploadStudentData->academic_year= !empty($rowDataUpdate[0][3])?$rowDataUpdate[0][3]:'Not Set';
                $uploadStudentData->status=1;
                $uploadStudentData->save(false);
              }
              
                if(unlink($file)){
                    $data['message'] ="Excel Updated Successfully";
                    $data['type'] = 'success';
                }
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

public function actionGetClass(){
    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    $out = [];
    if (isset($_POST['depdrop_parents'])) {
        $parents = $_POST['depdrop_parents'];
        if ($parents != null) {
            $school_id = $parents[0];
            $classes = Classes::find()->where(['school_id'=>$school_id])->all();
            foreach($classes as $classesData){
                $out[] = ['id'=>$classesData->id,'name'=>$classesData->class_name];
            }

            return ['output'=>$out, 'selected'=>''];
        }
    }
    return ['output'=>'', 'selected'=>''];
}



}
