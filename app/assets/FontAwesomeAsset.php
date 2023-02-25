<?php

namespace app\assets;

use yii\bootstrap4\BootstrapAsset;
use yii\web\YiiAsset;

class FontAwesomeAsset extends \yii\web\AssetBundle
{
	public $sourcePath = '@vendor/almasaeed2010/adminlte/plugins/fontawesome-free/';

	public $css = [
		'css/all.min.css',
	];

	public $js = [
		'https://cdn.jsdelivr.net/npm/sweetalert2@11'
	];

	public $depends = [
	];
}
