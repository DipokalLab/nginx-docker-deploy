docker run --detach \
    --name deploy-nginx-proxy \
    --publish 80:80 \
    --publish 443:443 \
 	  -e HTTP_PORT=80 \
	  -e HTTPS_PORT=443 \
    --volume certs:/etc/nginx/certs \
    --volume vhost:/etc/nginx/vhost.d \
    --volume html:/usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    nginxproxy/nginx-proxy:alpine


docker run --detach \
    --name deploy-nginx-proxy-letsencrypt \
    --volumes-from deploy-nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --volume acme:/etc/acme.sh \
    --env "DEFAULT_EMAIL=hhj@devent.kr" \
    nginxproxy/acme-companion