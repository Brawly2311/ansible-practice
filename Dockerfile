FROM ubuntu:22.04
RUN apt-get update && apt-get install -y openssh-server sudo
RUN useradd -m -s /bin/bash ansible && echo 'ansible:ansible' | chpasswd
RUN usermod -aG sudo ansible && echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]
