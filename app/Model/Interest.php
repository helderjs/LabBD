<?php

App::uses('AppModel', 'Model');

class Interest extends AppModel
{
    public $name = "Interest";
    public $useTable = "interest";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 3, 100),
                'message' => 'This field must be betwen 3 and 100 characters.',
                'required' => true
            )
        )
    );

    public $hasAndBelongsToMany = array(
        'Users' => array(
            'className' => 'User',
            'joinTable' => 'user_has_interest',
            'foreignKey' => 'interest_id',
            'associationForeignKey'  => 'user_id',
        )
    );
}
