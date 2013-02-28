<?php

App::uses('AppModel', 'Model');

class VwSelfUser extends AppModel
{
    public $name = "VwSelfUser";
    public $useTable = "vw_self_user";
    public $displayField = "name";
}
