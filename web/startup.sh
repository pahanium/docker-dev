#!/usr/bin/env bash
set -e

echo "Waiting for mysql"
TERM=dumb php -- <<'EOPHP'
<?php
error_reporting(E_ERROR | E_PARSE);
$host = 'database';
$user = getenv('MYSQL_USER');
$pass = getenv('MYSQL_PASSWORD');
$dbName = getenv('MYSQL_DATABASE');
$maxTries = 100;
do {
    $mysql = new mysqli($host, $user, $pass);
    if ($mysql->connect_error) {
        //echo('MySQL Connection Error: (' . $mysql->connect_errno . ') ' . $mysql->connect_error . "\n");
        $maxTries--;
        if ($maxTries <= 0) {
            echo("Reached max retries\n");
            exit(1);
        }
        sleep(10);
    }
} while ($mysql->connect_error);
$mysql->close();
EOPHP
