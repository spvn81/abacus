<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<style>
    .certificate{
    background-image: url("http://localhost/abacus/public/example/bg/abacus_one.jpg");
    width: 960px;
    height: 720px;
    background-repeat: no-repeat;
    position: fixed;
    }


</style>

<div class="certificate">
<div style="margin-top: 395px;"><b style="margin-left: 330px;position:fixed"><?= $model->student_name ?>
 </b><b style="margin-left: 816px;position:fixed" ><?= $model->class->class_name ?></b></div>
<div style="margin-top: 62px;margin-left: 550px;position:fixed"><b><?= $model->level ?></b></div>
<div style="margin-top: 122px;margin-left: 290px;position:fixed"><b><?= $model->school->school_name ?></b></div>
<div style="margin-top: 124px;margin-left: 172px;position:fixed"><b><?= $model->academic_year ?></b></div>
</div> 

</body>
</html>





