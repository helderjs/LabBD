<?php

App::uses('AppModel', 'Model');

class User extends AppModel
{
    public $name = "User";
    public $useTable = "user";
    public $displayField = "name";
    public $validate = array(
        'name' => array(
            'between' => array(
                'rule'    => array('between', 2, 100),
                'message' => 'This field must be betwen 2 and 100 characters.',
                'required' => true
            )
        ),
        'birthday' => array(
            'date' => array(
                'rule' => 'date',
                'message' => 'This field must be a valid date.',
                'required' => true
            )
        ),
        'city_id' => array(
            'uuid' => array(
                'rule' => 'uuid',
                'message' => 'This field must be a valid uuid.',
                'required' => true
            )
        ),
        'genre' => array(
            'inList' => array(
                'rule' => array('inList', array('M', 'F')),
                'message' => 'This field must be either Male or Female.',
                'required' => true
            )
        ),
        'username' => array(
            'between' => array(
                'rule'    => array('between', 5, 50),
                'message' => 'This field must be betwen 5 and 50 characters.',
                'required' => true
            )
        ),
        'password' => array(
            'minLength' => array(
                'rule'    => array('minLength', '8'),
                'message' => 'This field must be minimum 8 characters',
                'required' => true
            ),
            'confirmField' => array(
                'rule' => array('confirmField', 'confirm_password'),
                'message' => 'Please re-enter your password twice so that the values match',
                'required' => true
            )
        )
    );

    public $belongsTo = array(
        'City' => array(
            'className' => 'City',
            'foreignKey' => 'city_id'
        )
    );

    public $hasAndBelongsToMany = array(
        'Matches' => array(
            'className' => 'Match',
            'joinTable' => 'user_has_match',
            'foreignKey' => 'user_id',
            'associationForeignKey'  => 'match_id',
        ),
        'Interests' => array(
            'className' => 'Interest',
            'joinTable' => 'user_has_interest',
            'foreignKey' => 'user_id',
            'associationForeignKey'  => 'interest_id',
        )
    );

    function confirmField($field = array(), $compare_field = null)
    {
        foreach($field as $key => $value){
            $v1 = $value;
            $v2 = $this->data[$this->name][$compare_field];
            if($v1 !== $v2) {
                return FALSE;
            } else {
                continue;
            }
        }
        return TRUE;
    }
}
