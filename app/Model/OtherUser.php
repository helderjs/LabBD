<?php

App::uses('AppModel', 'Model');

class VwOtherUser extends AppModel
{
    public $name = "VwOtherUser";
    public $useTable = "vw_other_user";
    public $displayField = "username";
}
