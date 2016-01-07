#!/bin/bash

git init
composer init --name=php-http/demo-library --description="This is a demo to show how HTTPlug and PHP HTTP work in a library" --author="Márk Sági-Kazár <mark.sagikazar@gmail.com>" --require="php-http/client-implementation:^1.0" --require="psr/http-message-implementation:^1.0" --require="php-http/discovery:^0.6.4" --require-dev="php-http/guzzle6-adapter:^0.3" --require-dev="php-http/message:^0.2" --stability=dev --license=MIT --no-interaction
php -r '$f=getcwd()."/composer.json";$j=json_decode(file_get_contents($f), true);$j["prefer-stable"]=true;$j["autoload"]=["Http\\Demo\\"=>"src/"];file_put_contents($f,json_encode($j,JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES));'
composer install
echo -e ".puli/\nvendor/\ncomposer.lock" | tee .gitignore
