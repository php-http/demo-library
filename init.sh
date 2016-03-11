#!/bin/bash

git init
composer init --name=php-http/demo-library --description="This is a demo to show how HTTPlug and PHP HTTP work in a library" --author="Márk Sági-Kazár <mark.sagikazar@gmail.com>" --require="php-http/client-implementation:^1.0" --require="psr/http-message-implementation:^1.0" --require="php-http/discovery:^0.8" --require-dev="php-http/guzzle6-adapter:^1.0" --require-dev="php-http/message:^1.0" --require-dev="puli/composer-plugin:^1.0@beta,>=1.0.0-beta9" --stability=beta --license=MIT --no-interaction
php -r '$f=getcwd()."/composer.json";$j=json_decode(file_get_contents($f), true);$j["prefer-stable"]=true;$j["autoload"]["psr-4"]=["Http\\Demo\\"=>"src/"];file_put_contents($f,json_encode($j,JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES));'
composer install
echo -e ".puli/\nvendor/\ncomposer.lock" | tee .gitignore
