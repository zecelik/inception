#!/bin/bash

CERTIFICATES_OUT=${CERTIFICATES_OUT:-/etc/ssl/certs/inception.crt}              
CERTIFICATES_KEYOUT=${CERTIFICATES_KEYOUT:-/etc/ssl/private/inception.key}    
DOMAIN_NAME=${DOMAIN_NAME:-localhost}   

if [ ! -f "$CERTIFICATES_OUT" ]; then   
    echo "SSL sertifikası bulunamadı. Yeni sertifika oluşturuluyor..."      
    openssl req \               
        -newkey rsa:2048 \         
        -nodes \                    
        -keyout "$CERTIFICATES_KEYOUT" \           
        -x509 \                                
        -days 365 \   
        -out "$CERTIFICATES_OUT" \             
        -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME"       
    echo "SSL sertifikası başarıyla oluşturuldu."
else
    echo "SSL sertifikası mevcut, yeni sertifika oluşturulmasına gerek yok."
fi

exec "$@"

