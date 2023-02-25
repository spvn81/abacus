<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[\app\models\Classes]].
 *
 * @see \app\models\Classes
 */
class ClassesQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return \app\models\Classes[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \app\models\Classes|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
