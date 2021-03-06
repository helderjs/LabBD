<?php

App::uses('AppController', 'Controller');

class UsersController extends AppController {
    public $components = array('RequestHandler');
    public $responseJSON = array('status' => true, 'message' => '', 'data' => null);

    public function index() {
        $this->responseJSON['data'] = $this->User->find('all', array(
            'fields' => array('id', 'name')
        ));

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    public function view($id) {
        $this->responseJSON['data'] = $this->User->findById($id);
        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    public function add() {
        try {
            if ($this->User->save($this->request->data)) {
                $this->responseJSON['data'] = $this->User->find('first');
            } else {
                $this->responseJSON['status'] = false;
                $this->responseJSON['message'] = $this->User->validationErrors;
            }
        } catch(Exception $e) {
            $this->responseJSON['status'] = false;
            $this->responseJSON['message'] = $e->getMessage();
        }

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    public function delete($id) {
        try {
            if ($this->User->delete($id)) {
                $this->responseJSON['status'] = true;
            } else {
                $this->responseJSON['status'] = false;
                $this->responseJSON['message'] = $this->User->validationErrors;
            }
        } catch(Exception $e) {
            $this->responseJSON['status'] = false;
            $this->responseJSON['message'] = $e->getMessage();
        }

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }
}
