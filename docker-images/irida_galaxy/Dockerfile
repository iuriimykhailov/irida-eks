FROM centos:centos7

ENV SHELL=/bin/bash
ENV PATH="/root/miniconda3/bin:${PATH}"

COPY run.sh /temp_config/run.sh
COPY galaxy.ini /temp_config/galaxy.ini
COPY tool_sheds_conf.xml /temp_config/tool_sheds_conf.xml
COPY local_env.sh /temp_config/local_env.sh
COPY env.sh /temp_config/env.sh
COPY requirements.txt /temp_config/requirements.txt
COPY tools-list.yml /temp_config/tools-list.yml
COPY install_image.sh /install_image.sh

RUN yum groupinstall -y "Development tools" && \
yum install -y db4-devel expat-devel java && \
yum install -y wget && \
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3 && \
conda config --add channels conda-forge && \
conda config --add channels defaults && \
conda config --add channels r && \
conda config --add channels bioconda && \
conda create --name galaxy python=2.7 samtools && \
source activate galaxy && \
conda install -y perl-xml-simple perl-time-piece perl-bioperl openjdk gnuplot libjpeg-turbo paste && \
wget https://github.com/galaxyproject/galaxy/archive/v17.01.tar.gz && \
tar -zxvf v17.01.tar.gz && \
rm -f v17.01.tar.gz && mv galaxy-17.01 galaxy && cd galaxy && mkdir database/dependencies && \
mv /temp_config/run.sh run.sh && \
mv /temp_config/galaxy.ini config/galaxy.ini && \
mv /temp_config/tool_sheds_conf.xml config/tool_sheds_conf.xml && \
mv /temp_config/local_env.sh config/local_env.sh && \
mv /temp_config/env.sh env.sh && \
mv /temp_config/requirements.txt requirements.txt && \
mv /temp_config/tools-list.yml tools-list.yml && \
rm -rf /tmp_config && \
rpm -Uvh https://yum.postgresql.org/11/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm && \
yum install -y postgresql11-server sudo

RUN [ "/bin/bash", "-c", "./install_image.sh" ]

ENTRYPOINT sudo -u postgres ./usr/pgsql-11/bin/pg_ctl -D /var/lib/pgsql/data -l /var/lib/pgsql/logfile start && \
          source activate galaxy && \
           ./galaxy/run.sh


