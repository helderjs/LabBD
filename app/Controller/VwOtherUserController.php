<?php

App::uses('AppController', 'Controller');

class VwOtherUserController extends AppController {
    public $components = array('RequestHandler');
    public $responseJSON = array('status' => true, 'message' => '', 'data' => null);

    public function index() {
        $this->responseJSON['data'] = $this->VwOtherUser->find('all', array(
            'fields' => array('id', 'name')
        ));

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    public function view($id) {
        $this->responseJSON['data'] = $this->VwOtherUser->findById($id);
        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }
}
