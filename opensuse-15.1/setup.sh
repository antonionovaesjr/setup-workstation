#!/bin/bash

zypper addrepo https://download.opensuse.org/repositories/home:jfita:Virtualization/openSUSE_Leap_15.1/home:jfita:Virtualization.repo
zypper addrepo https://download.opensuse.org/repositories/home:olh/openSUSE_15.1/home:olh.repo

zypper refresh

zypper install libwebkitgtk-1_0-0


zypper install git ansible docker docker-compose libreoffice libreoffice-l10n-pt_BR cups keepassxc cockpit -y
systemctl enable cockpit
systemctl start cockpit

systemctl enable docker
systemc start docker
docker pull jenkins/jenkins:2.233
docker pull alpine:3.9
docker pull ubuntu:18.04
docker pull sonarqube:8.2-community
docker pull sonatype/nexus3:3.22.1
docker pull owasp/zap2docker-stable:2.9.0
docker pull portainer/portainer:1.23.2



zypper install code-1.44.2-1587059974.el7.x86_64.rpm ICAClient-suse-13.8.0.10299729-0.x86_64.rpm google-chrome-stable_current_x86_64.rpm teams-1.3.00.5153-1.x86_64.rpm teamviewer-suse_15.4.4445.x86_64.rpm zoom_openSUSE_x86_64.rpm -7y
