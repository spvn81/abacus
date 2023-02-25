<?php

namespace app\modules\admin\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;

/**
 * This is the base model class for table "student_details".
 *
 * @property integer $id
 * @property integer $school_id
 * @property integer $class_id
 * @property integer $course_id
 * @property string $student_name
 * @property string $academic_year
 * @property string $level
 * @property integer $status
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property \app\modules\admin\models\Schools $school
 * @property \app\modules\admin\models\Classes $class
 * @property \app\modules\admin\models\User $createdBy
 * @property \app\modules\admin\models\User $updatedBy
 * @property \app\modules\admin\models\Courses $course
 */
class StudentDetails extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;
public $excel_sheet;

    /**
    * This function helps \mootensai\relation\RelationTrait runs faster
    * @return array relation names of this model
    */
    public function relationNames()
    {
        return [
            'school',
            'class',
            'createdBy',
            'updatedBy',
            'course'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['school_id', 'class_id', 'course_id', 'student_name', 'academic_year'], 'required'],
            [['school_id', 'class_id', 'course_id', 'status', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['student_name', 'level'], 'string', 'max' => 255],
            [['academic_year'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'student_details';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'school_id' => Yii::t('app', 'School ID'),
            'class_id' => Yii::t('app', 'Class ID'),
            'course_id' => Yii::t('app', 'Course ID'),
            'student_name' => Yii::t('app', 'Student Name'),
            'academic_year' => Yii::t('app', 'Academic Year'),
            'level' => Yii::t('app', 'Level'),
            'status' => Yii::t('app', 'Status'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSchool()
    {
        return $this->hasOne(\app\modules\admin\models\Schools::className(), ['id' => 'school_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(\app\modules\admin\models\Classes::className(), ['id' => 'class_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(\app\modules\admin\models\User::className(), ['id' => 'created_by']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(\app\modules\admin\models\User::className(), ['id' => 'updated_by']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCourse()
    {
        return $this->hasOne(\app\modules\admin\models\Courses::className(), ['id' => 'course_id']);
    }
    
    /**
     * @inheritdoc
     * @return array mixed
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => new \yii\db\Expression('NOW()'),
            ],
            'blameable' => [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
        ];
    }


    /**
     * @inheritdoc
     * @return \app\models\StudentDetailsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\StudentDetailsQuery(get_called_class());
    }
}
