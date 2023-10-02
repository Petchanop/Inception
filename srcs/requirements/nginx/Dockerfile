FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y nginx \
	openssl \
	systemctl \
	net-tools

RUN mkdir -p /etc/nginx/cert

RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
	-out /etc/nginx/cert/npiya-is.42.crt \
	-keyout /etc/nginx/cert/npiya-is.42.key \
	-subj "/C=TH/ST=BK/L=BKK/O=42 Bangkok/CN=npiya-is.42.fr/"

COPY ./conf/nginx.conf /etc/nginx/conf.d
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]