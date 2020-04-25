#!/bin/bash

#Update S.O
sudo zypper dup

#Config repo
sudo zypper addrepo https://download.opensuse.org/repositories/home:olh/openSUSE_15.1/home:olh.repo
sudo zypper addrepo --refresh --priority 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_15.1/packman.repo
sudo zypper --gpg-auto-import-keys refresh 
sudo zypper refresh

# User resource (codec, editor)
sudo zypper dist-upgrade --from packman --allow-downgrade --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-bad gstreamer-plugins-libav gstreamer-plugins-ugly libavcodec58 libavdevice58 libavfilter7 libavformat58 libavresample4 libavutil56 vlc-codecs hplip rclone 

#Devops Tools
sudo zypper install git ansible docker docker-compose patterns-server-kvm_server patterns-server-kvm_tools vagrant vagrant-bash-completion vagrant-emacs vagrant-vim 
sudo gpasswd -a $(whoamin) docker

systemctl enable docker
systemctl start docker
docker pull jenkins/jenkins:2.233
docker pull alpine:3.9
docker pull ubuntu:18.04
docker pull sonarqube:8.2-community
docker pull sonatype/nexus3:3.22.1
docker pull owasp/zap2docker-stable:2.9.0
docker pull portainer/portainer:1.23.2

#Office Tools
sudo zypper install libreoffice vlc libreoffice-l10n-pt_BR cups keepassxc kmail
sudo zypper install zoom_openSUSE_x86_64.rpm google-chrome-stable_current_x86_64.rpm teams-1.3.00.5153-1.x86_64.rpm 
sudo zypper install libwebkitgtk-1_0-0 
sudo zypper install megasync-openSUSE_Leap_15.0.x86_64.rpm
sudo zyyper install --no-gpgp-checks  dolphin-megasync-openSUSE_Leap_15.0.x86_64.rpm


#Sysadmin and Developer
sudo zypper install patterns-devel-java-devel_java
wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm -O dbeaver-ce-latest-stable.x86_64.rpm
sudo zypper install dbeaver-ce-latest-stable.x86_64.rpm
sudo zypper install code-1.44.2-1587059974.el7.x86_64.rpm ICAClient-suse-13.8.0.10299729-0.x86_64.rpm  
sudo zypper install teamviewer-suse_15.4.4445.x86_64.rpm  



mkdir -p ~/Workspace/{GitHub,Lab}
sudo mv /opt/Citrix/ICAClient/keystore/cacerts /opt/Citrix/ICAClient/keystore/cacerts-backup
sudo ln -s /etc/ssl/certs /opt/Citrix/ICAClient/keystore/cacerts
