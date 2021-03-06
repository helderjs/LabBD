<?php

App::uses('AppModel', 'Model');

class Attendant extends AppModel
{
    public $name = "Attendant";
    public $useTable = "attendant";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 3, 20),
                'message' => 'This field must be betwen 3 and 20 characters.'
            )
        ),
        'company_id' => array(
            'uuid' => array(
                'rule'    => 'uuid',
                'message' => 'This field must be a valid uuid.'
            )
        ),
        'user_id' => array(
            'uuid' => array(
                'rule'    => 'uuid',
                'message' => 'This field must be a valid uuid.'
            )
        )
    );

    public $belongsTo = array(
        'User' => array(
            'className' => 'User',
            'foreignKey' => 'user_id'
        ),
        'Company' => array(
            'className' => 'Company',
            'foreignKey' => 'company_id'
        )
    );
}
