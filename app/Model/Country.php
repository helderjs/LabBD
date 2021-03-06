<?php

App::uses('AppModel', 'Model');

class Country extends AppModel
{
    public $name = "Country";
    public $useTable = "country";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 3, 100),
                'message' => 'This field must be betwen 3 and 100 characters.'
            )
        ),
    );

    public $belongsTo = array(
        'Country' => array(
            'className' => 'Country',
            'foreignKey' => 'country_id'
        ),
    );

/*    public $hasOne = array(
        'Match' => array(
            'className' => 'Match',
            'foreignKey' => ''
        )
    );*/

    public $hasMany = array(
        'Cities' => array(
            'className' => 'City',
            'foreignKey' => 'country_id'
        )
    );
}
