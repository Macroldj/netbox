FROM python:3.8.12-slim-buster
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
RUN sed -i 's/http\:\/\/deb.debian.org/https\:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
 && sed -i 's/http\:\/\/security.debian.org/https\:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y curl gcc vim libpq-dev \
 && apt-get install -y snmptt openssh-client iperf3 scanssh mtr \
 && rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]
