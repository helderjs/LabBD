<?php

App::uses('AppModel', 'Model');

class City extends AppModel
{
    public $name = "City";
    public $useTable = "city";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 2, 100),
                'message' => 'This field must be betwen 2 and 100 characters.'
            )
        ),
        'country_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.'
            )
        )
    );

    public $belongsTo = array(
        'Country' => array(
            'className' => 'Country',
            'foreignKey' => 'country_id'
        ),
    );

    public $hasMany = array(
        'Users' => array(
            'className' => 'User',
            'foreignKey' => 'city_id'
        ),
        'Stadiums' => array(
            'className' => 'Stadium',
            'foreignKey' => 'city_id'
        )
    );
}
