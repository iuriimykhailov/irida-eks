#!/bin/bash
kubectl delete svc --all
kubectl delete deployment --all
kubectl delete pods --all
eksctl delete cluster --name $K8S_CLUSTER_NAME
