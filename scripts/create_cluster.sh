#!/bin/bash
eksctl create cluster \
--name $K8S_CLUSTER_NAME \
--version 1.13 \
--nodegroup-name standard-workers \
--node-type t2.medium \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto

