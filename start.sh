#!/bin/bash

php artisan migrate

php artisan db:seed

php -S 0.0.0.0:8000 -t public