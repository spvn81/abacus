<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[\app\models\Schools]].
 *
 * @see \app\models\Schools
 */
class SchoolsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return \app\models\Schools[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \app\models\Schools|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
