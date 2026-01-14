#!/bin/sh

kubectl create ns privx

kubectl apply -f privx-pv.yaml 
kubectl apply -f privx-pvc.yaml

kubectl create secret tls privx-tls --cert ksaminat-ingress-server-cert.pem --key ksaminat-ingress-server-key.pem --namespace privx

kubectl create secret generic privx-ca-secret --from-file ksaminat-ingress-ca-cert.pem --namespace privx

helm install haproxy-ingress haproxytech/kubernetes-ingress \
  --namespace haproxy-controller \
  --create-namespace

kubectl config set-context --current --namespace privx

