FROM ubuntu:latest

RUN apt update && apt -y install curl git unzip wget openjdk-8-jdk

RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.9-stable.tar.xz

RUN git clone https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/ec2-user/flutter/bin"

RUN flutter create sms
RUN flutter build web
RUN flutter doctor
