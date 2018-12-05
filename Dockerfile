FROM centos
RUN yum -y update && \
    yum -y install wget rsync libunwind icu && \
    wget -O azcopy.tar.gz https://aka.ms/downloadazcopylinux64 && \
    tar -xf azcopy.tar.gz && \
    ./install.sh && \
    rm -Rf azcopy*

ENTRYPOINT ["/usr/bin/azcopy"]
CMD ["--version"]
