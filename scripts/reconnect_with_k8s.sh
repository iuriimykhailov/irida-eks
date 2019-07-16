#!/bin/bash
aws eks --region us-west-2 update-kubeconfig --name $K8S_CLUSTER_NAME || true
