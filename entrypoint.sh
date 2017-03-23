#!/bin/bash
composer install -no --prefer-source

for i in "$@"
do
php bin/console rabbitmq:multiple-consumer $i -w &
done

php bin/console server:start 0.0.0.0:8000
