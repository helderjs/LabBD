<?php

App::uses('AppModel', 'Model');

class VwMeeting extends AppModel
{
    public $name = "VwMeeting";
    public $useTable = "vw_meetings";
    public $displayField = "met_name";
}
