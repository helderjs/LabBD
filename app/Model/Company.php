<?php

App::uses('AppModel', 'Model');

class Company extends AppModel
{
    public $name = "Company";
    public $useTable = "company";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 3, 150),
                'message' => 'This field must be betwen 3 and 150 characters.'
            )
        )
    );

    public $hasMany = array(
        'Attendant' => array(
            'className' => 'Attendant',
            'foreignKey' => 'company_id'
        )
    );
}
