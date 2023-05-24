#!/bin/bash

useradd $FTP_USER -p $FTP_PASS

echo $FTP_USER >> /etc/vsftpd.userlist

chown $FTP_USER:$FTP_USER /ftp

vsftpd /etc/vsftpd.conf
