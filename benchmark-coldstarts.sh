#!/usr/bin/env bash

set -e

# Before running this script make sure the lambdas were deployed (to ensure we get cold starts)

# Launch many invocations in parallel to trigger as many cold starts as possible

for value in {1..20}
do
    aws lambda invoke --invocation-type Event --region us-east-2 --function-name bref-benchmark-php-function-128 /dev/null &
done
wait # Wait for all invocations to finish
for value in {1..20}
do
    aws lambda invoke --invocation-type Event --region us-east-2 --function-name bref-benchmark-php-function-512 /dev/null &
done
wait # Wait for all invocations to finish
for value in {1..20}
do
    aws lambda invoke --invocation-type Event --region us-east-2 --function-name bref-benchmark-php-function-1024 /dev/null &
done
wait # Wait for all invocations to finish
for value in {1..20}
do
    aws lambda invoke --invocation-type Event --region us-east-2 --function-name bref-benchmark-php-function-2048 /dev/null &
done
wait # Wait for all invocations to finish

# HTTP application
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/128
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/512
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/1024
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/2048

# Symfony
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/128
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/512
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/1024
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony/2048

# Symfony runtime
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/128
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/512
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/1024
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/symfony-runtime/2048

# Http runtime
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/128
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/512
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/1024
ab -c 20 -n 20 https://sg45xxu0p2.execute-api.us-east-2.amazonaws.com/Prod/http-runtime/2048
