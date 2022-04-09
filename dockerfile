FROM ubuntu:focal

#SHELL
SHELL ["/bin/bash", "-c"]

#WORKDIR
WORKDIR /root

COPY script/install_basic_env.sh .
COPY requirements/requirements.txt .
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY authorized_keys /root/.ssh/authorized_keys

RUN chmod 755 install_basic_env.sh
RUN bash install_basic_env.sh
RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/usr/sbin/sshd", "-D"]