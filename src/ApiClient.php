<?php

namespace Http\Demo;

use Http\Client\HttpClient;
use Http\Discovery\HttpClientDiscovery;
use Http\Discovery\MessageFactoryDiscovery;
use Http\Message\MessageFactory;

/**
 * Connect to some API.
 *
 * @author Márk Sági-Kazár <mark.sagikazar@gmail.com>
 */
final class ApiClient
{
    const ENDPOINT='http://api.example.com';

    /**
     * @var HttpClient
     */
    private $httpClient;

    /**
     * @var MessageFactory
     */
    private $messageFactory;

    /**
     * @param HttpClient|null     $httpClient
     * @param MessageFactory|null $messageFactory
     */
    public function __construct(HttpClient $httpClient = null, MessageFactory $messageFactory = null)
    {
        $this->httpClient = $httpClient ?: HttpClientDiscovery::find();
        $this->messageFactory = $messageFactory ?: MessageFactoryDiscovery::find();
    }

    /**
     * Call an API endpoint.
     *
     * @param string $someArgument
     *
     * @return string
     */
    public function someOperation($someArgument)
    {
        $request = $this->messageFactory->createRequest('GET', self::ENDPOINT.'/some_operation?argument='.$someArgument);

        try {
            $response = $this->httpClient->sendRequest($request);
        } catch (\Http\Client\Exception $e) {
            throw new \RuntimeException('Something happened during HTTP request');
        }

        return (string) $response->getBody();
    }
}
