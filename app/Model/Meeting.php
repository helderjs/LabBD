<?php

App::uses('AppModel', 'Model');

class Meeting extends AppModel
{
    public $name = "Meeting";
    public $useTable = "user_has_user";
    public $displayField = "date_time";

    public $belongsTo = array(
        'UserA' => array(
            'className' => 'User',
            'foreignKey' => 'user_a_id'
        ),
        'UserB' => array(
            'className' => 'User',
            'foreignKey' => 'user_b_id'
        )
    );
}
