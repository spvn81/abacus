<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[\app\models\StudentDetails]].
 *
 * @see \app\models\StudentDetails
 */
class StudentDetailsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return \app\models\StudentDetails[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \app\models\StudentDetails|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
