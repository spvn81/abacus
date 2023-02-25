<?php

namespace app\modules\admin\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;

/**
 * This is the base model class for table "student_details_stac".
 *
 * @property integer $id
 * @property string $school_name
 * @property string $class
 * @property string $section
 * @property string $course
 * @property string $student_name
 * @property string $academic_year
 * @property string $level
 * @property integer $status
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property \app\modules\admin\models\User $updatedBy
 * @property \app\modules\admin\models\User $createdBy
 */
class StudentDetailsStac extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;

    public $excel_sheet;
    public $file;


    /**
    * This function helps \mootensai\relation\RelationTrait runs faster
    * @return array relation names of this model
    */
    public function relationNames()
    {
        return [
            'updatedBy',
            'createdBy'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['school_name', 'class', 'course', 'student_name', 'academic_year'], 'required'],
            [['status', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['school_name', 'class', 'section', 'course', 'student_name', 'level'], 'string', 'max' => 255],
            [['academic_year'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'student_details_stac';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'school_name' => Yii::t('app', 'School Name'),
            'class' => Yii::t('app', 'Class'),
            'section' => Yii::t('app', 'Section'),
            'course' => Yii::t('app', 'Course'),
            'student_name' => Yii::t('app', 'Student Name'),
            'academic_year' => Yii::t('app', 'Academic Year'),
            'level' => Yii::t('app', 'Level'),
            'status' => Yii::t('app', 'Status'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(\app\models\User::className(), ['id' => 'updated_by']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(\app\models\User::className(), ['id' => 'created_by']);
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
     * @return \app\models\StudentDetailsStacQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\StudentDetailsStacQuery(get_called_class());
    }
}
