<?php

App::uses('AppController', 'Controller');

class MatchesController extends AppController {
    public $components = array('RequestHandler');
    public $responseJSON = array('status' => true, 'message' => '', 'data' => null);

    public function index() {
        $this->responseJSON['data'] = $this->Match->find('all');

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    /*
    public function view($id) {
        $this->responseJSON['data'] = $this->Meeting->find('all', array(
            'conditions' => array(
                "Meeting.user_a_id" => $this->request->params['user_id'],
                "Meeting.user_b_id" => $id
            )
        ));
        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));
    }

    public function add() {
        try {
            $data = array(
                'Meeting' => array(
                    'user_a_id' => $this->request->params['user_id'],
                    'user_b_id' => $this->request->data['id'],
                    'date_time' => date('Y-m-d H:m:s')
                )
            );

            if ($this->Meeting->save($data)) {
                $this->responseJSON['data'] = $this->Meeting->find('all', array(
                    "Meeting.user_a_id" => $this->request->params['user_id'],
                ));
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
    }*/
}
