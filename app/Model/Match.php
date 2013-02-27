<?php

App::uses('AppModel', 'Model');

class Match extends AppModel
{
    public $name = "Match";
    public $useTable = "match";
    public $displayField = "date";
    public $validate = array(
        'date' => array(
            'date' => array(
                'rule' => 'date',
                'message' => 'This field must be a valid date.',
                'required' => true
            )
        ),
        'hour' => array(
            'time' => array(
                'rule' => 'time',
                'message' => 'This field must be a valid time.',
                'required' => true
            )
        ),
        'stadium_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.',
                'required' => true
            )
        ),
        'country_a_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.',
                'required' => true
            )
        ),
        'country_b_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.',
                'required' => true
            )
        ),
    );

    public $belongsTo = array(
        'Country_A' => array(
            'className' => 'Country',
            'foreignKey' => 'country_a_id'
        ),
        'Country_B' => array(
            'className' => 'Country',
            'foreignKey' => 'country_b_id'
        ),
        'Stadium' => array(
            'className' => 'Stadium',
            'foreignKey' => 'stadium_id'
        )
    );

    public $hasAndBelongsToMany = array(
        'Users' => array(
            'className' => 'User',
            'joinTable' => 'user_has_match',
            'foreignKey' => 'match_id',
            'associationForeignKey'  => 'user_id',
        )
    );
}
