FROM centos:7

MAINTAINER Chris Probert <cprobert@stanford.edu>

RUN yum -y install wget curl make rpmlib ; yum -y update && yum clean all

RUN wget https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v2-19-1-linux.zip && \
unzip bcl2fastq2-v2-19-1-linux.zip && \
yum -y --nogpgcheck localinstall bcl2fastq2-v2.19.1.403-Linux-x86_64.rpm && \
yum clean all && \
rm -rf bcl2fastq2-v2.19.1.403-Linux-x86_64.rpm bcl2fastq2-v2-19-1-linux.zip

VOLUME /run
WORKDIR /run

ADD run_bcl2fastq.sh /
RUN chmod 755 /run_bcl2fastq.sh
CMD /run_bcl2fastq.sh
