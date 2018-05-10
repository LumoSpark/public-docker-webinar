<?php
require 'vendor/autoload.php';

$dotenv = new Dotenv\Dotenv(dirname(__DIR__));
$dotenv->load();
$f3 = \Base::instance();

$db=new DB\SQL(
'mysql:host='.getenv('DB_HOST').';port='.getenv('DB_PORT').';dbname='.getenv('DB_NAME'),
getenv('DB_USER'),
getenv('DB_PASS')
);
global $db;

$f3->route('GET /',
    function() {
        echo 'Hello Docker webinar attendees :)';
    }
);

$f3->route('GET /create_db',
    function() {
        $sql='CREATE TABLE People (
	    LastName varchar(255),
	    FirstName varchar(255)
		);';
		$GLOBALS['db']->exec($sql);
		echo $GLOBALS['db']->log();
    }
);


$f3->route('GET /insert_db',
    function() {
        $sql='INSERT INTO People VALUES ("Wick", "John")';
		$GLOBALS['db']->exec($sql);
		echo $GLOBALS['db']->log();
    }
);

$f3->route('GET /read_db',
    function() {
        $sql='SELECT * from People';
		var_dump($GLOBALS['db']->exec($sql));
		echo $GLOBALS['db']->log();
    }
);

$f3->route('GET /delete_db',
    function() {
        $sql='DELETE from People';
		$GLOBALS['db']->exec($sql);
		echo $GLOBALS['db']->log();
    }
);


$f3->run();