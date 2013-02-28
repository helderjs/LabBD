<?php

App::uses('AppModel', 'Model');

class VwUserScore extends AppModel
{
    public $name = "VwUserScore";
    public $useTable = "vw_user_score";
    public $displayField = "score";
}
