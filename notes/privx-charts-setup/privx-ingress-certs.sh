#!/bin/bash

openssl req -x509 -newkey rsa:4096 -keyout ksaminat-ingress-key.pem -out ksaminat-ingress-cert.pem \
  -days 365 -nodes \
  -subj "/CN=privx.ksaminat.com/O=R&D/C=FI"
