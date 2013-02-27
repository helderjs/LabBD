<?php

App::uses('AppController', 'Controller');

class UsersController extends AppController {
    public $components = array('RequestHandler');
    public $responseJSON = array('status' => true, 'message' => '', 'data' => null);

    public function index() {
        /*$this->responseJSON['data'] = $this->User->find('all', array(
            'fields' => array('id', 'name')
        ));

        $this->set(array(
            'responseJSON' => $this->responseJSON,
            '_serialize' => array('responseJSON')
        ));*/

        $us = array();

        for ($i = 0; $i < 10000; $i++) {
            $randomString = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);

            $u = array(
                "User" => array(
                    "name" => $randomString,
                    "birthday" => date("Y-m-d"),
                    "genre" => "M",
                    "username" => $randomString,
                    "password" => sha1($randomString),
                    "confirm_password" => sha1($randomString),
                    "score" => null,
                    "city_id" => "26f446f2-5937-11e2-aa44-705ab6554b97"
                )
            );

            $us[] = $u;
        }

        $ds = $this->User->getDataSource();
        $ds->begin();

        try {
            if (!$this->User->saveAll($us)) {
                throw new Exception("Falhou");
            }

            $ds->commit();
            echo "Ok";
        } catch (Exception $e) {
            $ds->rollback();
            echo $e->getMessage();
        }
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
