<?php

App::uses('AppModel', 'Model');

class Stadium extends AppModel
{
    public $name = "Stadium";
    public $useTable = "stadium";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 2, 100),
                'message' => 'This field must be betwen 2 and 100 characters.',
                'required' => true
            )
        ),
        'city_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.',
                'required' => true
            )
        )
    );

    public $hasOne = array(
        'Match' => array(
            'className' => 'Match',
            'foreignKey' => 'stadium_id'
        )
    );

    public $belongsTo = array(
        'City' => array(
            'className' => 'City',
            'foreignKey' => 'city_id'
        )
    );
}
