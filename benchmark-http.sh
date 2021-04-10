#!/usr/bin/env bash

set -e

for value in {1..1200}
do
    # HTTP application
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/128 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/512 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/1024 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/2048 > /dev/null &
    wait
    # Symfony
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/128 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/512 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/1024 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/2048 > /dev/null &
    wait
    # Symfony Runtime
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/128 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/512 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/1024 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/2048 > /dev/null &
    wait
    # Http Runtime
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/128 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/512 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/1024 > /dev/null &
    curl --silent https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/2048 > /dev/null &
    wait
    sleep 1
done
