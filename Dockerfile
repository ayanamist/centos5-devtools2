FROM centos:centos5
RUN rm -f /etc/yum.repos.d/*.repo
ADD CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo
RUN touch /var/lib/rpm/* &&\
  yum install -y wget
RUN cd /tmp &&\
  wget -T 30 -nv -O /etc/yum.repos.d/devtools-2.repo https://people.centos.org/tru/devtools-2/devtools-2.repo &&\
  wget -T 30 -nv https://packages.endpoint.com/endpoint-rpmsign.pub &&\
  rpm --import endpoint-rpmsign.pub &&\
  wget -T 30 -nv https://packages.endpoint.com/rhel/5/os/x86_64/endpoint-repo-1.0-2.x86_64.rpm &&\
  yum localinstall -y endpoint-repo-1.0-2.x86_64.rpm &&\
  rm -f endpoint-rpmsign.pub endpoint-repo-1.0-2.x86_64.rpm
RUN yum install -y devtoolset-2 make binutils automake autoconf libtool pkgconfig file local-perl
