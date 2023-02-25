<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[\app\models\Sections]].
 *
 * @see \app\models\Sections
 */
class SectionsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return \app\models\Sections[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \app\models\Sections|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
