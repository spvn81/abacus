<?php
use yii\helpers\Url;
?>
<div style="position: relative;text-align: center">
<img  src="<?= Url::base().'/example/bg/abacus_one.jpg' ?>" width="100%">
<h5 style="position:absolute;right:39%;top:54.5%"><b><?= $model->student_name ?></b></h5>
<h5 style="position:absolute;right:7.4%;top:54.5%"><b><?= $model->class->class_name ?></b></h5>
<h5 style="position:absolute;right:40%;top:63%"><b><?= $model->level ?></b></h5>
<h5 style="position:absolute;right:33%;top:71.5%"><b><?= $model->school->school_name ?></b></h5>
<h5 style="position:absolute;right:75%;top:71.5%"><b><?= $model->academic_year ?></b></h5>
</div>



