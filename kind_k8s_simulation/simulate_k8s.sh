#!/bin/bash
kind create cluster --config cluster.yaml
kubectl get nodes # should show one master and two nodes as defined in cluster.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml #create kind ingress under ingress-nginx namespace
kubectl get pods --namespace ingress-nginx --watch #should show nginx ingress pods, wait 'til it's completed
# unfortunately, it ends up in pending state for nginx controller pod :) and there's no errors when i check the logs
