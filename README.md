# HTTPlug demo application

**This is a demo to show how HTTPlug and PHP HTTP work in a library.**


## How to start

Here is how this package is initialized:


``` bash
$ ./init.sh
```

What really happens:

1. Initialize GIT repository
2. Initialize Composer with HTTPlug [virtual package](http://docs.php-http.org/en/latest/httplug/users.html#background),
`psr/http-message-implementation`, Discovery as a dependencies and Guzzle 6 Adapter as a dev dependency
3. Set `prefer-stable` to true and add some autoloading
4. Install dependencies with composer
5. Ignore Puli and Composer files


This package also contains some demo code to show how HTTPlug can be used with your library.
