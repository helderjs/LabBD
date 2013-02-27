<?php

App::uses('AppController', 'Controller');

class AuthController extends AppController {
    public $uses = array("User", "Company", "Attendant");

    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->Auth->allowedActions = array('login', 'logout', 'password_recover', 'register');
    }

    public function beforeRender()
    {
        parent::beforeRender();
        $this->set('display', 'login');
    }

    public function register()
    {
        if (!empty($this->data)) {
            $ds = $this->Attendant->getDataSource();
            $ds->begin();

            try {
                if (!$this->Attendant->saveAssociated($this->data))
                    throw new Exception(__("Fail"));

                $ds->commit();
            } catch(Exception $e) {
                $ds->rollback();

                print_r($e->getMessage());
            }
        }

        $this->render('login');
    }
}

