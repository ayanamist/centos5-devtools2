FROM centos:centos5
RUN rm -f /etc/yum.repos.d/*.repo
ADD CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo
RUN wget -T 30 -nv -O devtools-2.repo https://people.centos.org/tru/devtools-2/devtools-2.repo
RUN touch /var/lib/rpm/* &&\
  yum install -y devtoolset-2 make binutils automake autoconf libtool pkgconfig file
