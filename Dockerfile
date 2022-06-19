FROM amazonlinux:2

# update yum packages
RUN yum -y update; yum clean all

# change timezone
RUN rm -rf /etc/localtime && ln -fs /usr/share/zoneinfo/GMT /etc/localtime && date +%Z

# clean yum cache
RUN rm -rf /var/cache/yum/*

# install generic packages \
RUN yum install -y glibc-devel wget tar xz gzip make gcc file sudo unzip curl

# install shell scrip compiler
RUN wget -O /usr/src/shc-3.8.9.tgz http://www.datsi.fi.upm.es/~frosal/sources/shc-3.8.9.tgz && \
mkdir /usr/src/shc-3.8.9 && \
sudo tar xzf /usr/src/shc-3.8.9.tgz -C /usr/src/ && \
cd /usr/src/shc-3.8.9/ && make && \
mkdir -p /usr/local/man/man1/ && \
cd /usr/src/shc-3.8.9/ && echo "y" | make install && \
rm -rf /usr/src/shc-3.8.9.tgz /usr/src/shc-3.8.9/

# aws cli
RUN wget -O /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip  && \
mkdir /tmp/aws && unzip /tmp/awscliv2.zip -d /tmp/ && \
sudo /tmp/aws/install && \
rm -rf /tmp/awscliv2.zip /tmp/aws/
