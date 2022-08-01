FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y curl
#RUN apt-get install -y iputils-ping
COPY ./sitetest.sh ./sitetest.sh
CMD ["./sitetest.sh"]
#CMD ["/bin/bash"]
