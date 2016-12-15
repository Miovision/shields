#!/bin/bash

`aws ecr get-login --region us-east-1`

docker push 425548863806.dkr.ecr.us-east-1.amazonaws.com/shields
