<?php

require_once __DIR__.'/vendor/autoload_runtime.php';

class MyHandler implements \Bref\Event\Handler
{
    public function handle($event, \Bref\Context\Context $context)
    {
        return 'Hello World!';
    }

}

return function () {
    return new MyHandler();
};
