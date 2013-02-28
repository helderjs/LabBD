<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Config
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/View/Pages/home.ctp)...
 */
	Router::connect('/', array('controller' => 'dashboard', 'action' => 'index'));
/**
 * ...and connect the rest of 'Pages' controller's urls.
 */
	//Router::connect('/pages/*', array('controller' => 'pages', 'action' => 'display'));
	//Router::connect('/login', array('controller' => 'auth', 'action' => 'login'));
	//Router::connect('/logout', array('controller' => 'auth', 'action' => 'logout'));
    //Router::connect('/register', array('controller' => 'auth', 'action' => 'register'));

//    Router::connect('/:controller/:id', array('action' => 'view'), array('id' => '[0-9]+'));
//    Router::connect('/users/:user_id/meetings', array('controller' => 'meetings'), array('user_id' => '[0-9]+'));

    Router::connect('/users', array('controller' => 'users', 'action' => 'index'));
    Router::connect(
        '/users/:user_id',
        array('controller' => 'users', 'action' => 'view'),
        array('pass' => array('user_id')),
        array("user_id" => "[0-9]+")
    );
    Router::connect(
        '/users/:user_id/meetings',
        array('controller' => 'meetings', 'action' => 'index')
    );
    Router::connect(
        '/users/:user_id/meetings/:id',
        array('controller' => 'meetings', 'action' => 'view'),
        array('pass' => array('id')),
        array('user_id' => "[0-9]+", "id" => "[0-9]+")
    );
    Router::mapResources('users');
    Router::mapResources('meetings');
    Router::parseExtensions();

/**
 * Load all plugin routes.  See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

/**
 * Load the CakePHP default routes. Only remove this if you do not want to use
 * the built-in default routes.
 */
	require CAKE . 'Config' . DS . 'routes.php';
