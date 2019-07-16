#!/bin/bash
kubectl apply -f ./root/k8s/irida-db-service.yaml
kubectl apply -f ./root/k8s/irida-pod-external-service.yaml
kubectl apply -f ./root/k8s/irida-db-deployment.yaml
while [[ $(kubectl get pods | grep irida-db- | awk '{print $2}') != '1/1' ]]; do echo "wait for irida-db to start"; sleep 2; done
sleep 5
kubectl apply -f ./root/k8s/irida-pod.yaml
while [[ $(kubectl get pod irida-pod | grep irida-pod | awk '{print $2}') != '2/2' ]]; do echo "wait for irida-pod to start"; sleep 2; done
echo "Irida URL: http://$(kubectl get svc | grep amazonaws.com | awk '{print $4}')/irida"

