FROM centos:7
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all
COPY ./sample_program.sh /tmp
RUN chmod +x /tmp/sample_program.sh
ENTRYPOINT ["/sample_program.sh"]
CMD echo "Copying sample_program.sh to docker...."
