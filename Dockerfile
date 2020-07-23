FROM amazonlinux:2
# COPY user_data.sh ~/

RUN yum update -y
RUN yum install java-11-amazon-corretto -y
RUN yum install wget -y
RUN wget https://services.gradle.org/distributions/gradle-6.5.1-bin.zip -P /tmp
RUN yum install unzip -y
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
RUN echo "export GRADLE_HOME=/opt/gradle/gradle-6.5.1" > /etc/profile.d/script.sh
RUN echo "export PATH=$PATH:$GRADLE_HOME/bin" >> /etc/profile.d/script.sh
# RUN chmod +x /etc/profile.d/script.sh
COPY sudoers /etc/
RUN yum install curl -y
RUN yum install git -y
RUN yum install openssh -y
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs
ENV GRADLE_HOME=/opt/gradle/gradle-6.5.1
ENV PATH=$PATH:/opt/gradle/gradle-6.5.1/bin
ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64
# RUN echo "export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64" >> /etc/profile.d/script.sh
# RUN echo "export PATH=$PATH:/opt/gradle/gradle-6.5.1/bin" >> /etc/profile.d/script.sh
# RUN echo "export PATH=$PATH:/opt/gradle/gradle-6.5.1/bin" >> /etc/profile.d/script.sh
COPY bkp/sudoers /etc/
RUN npm install -g yarn
# RUN cat /etc/sudoers
# RUN echo $PATH
# RUN whoami
# RUN gradle

CMD ["/bin/bash"]