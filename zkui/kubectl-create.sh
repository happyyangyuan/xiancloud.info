#!/bin/bash
kubectl -n publicservice-dev create -f configmap.yaml 
kubectl -n publicservice-dev create -f deployment.yaml 
kubectl -n publicservice-dev create -f zkui-service.yaml 
kubectl -n publicservice-dev create -f zkui-service-nodeport.yaml 
