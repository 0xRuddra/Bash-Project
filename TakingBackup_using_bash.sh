#!/bin/bash

filename="backup_$(date +%d_%m_%y).tar"

tar -cvf   /home/kali/Documents/$filename  /home/kali/Exprmnt/python

#this will create a backup file. now time to save it to the remote server
#For this first you have to create  your public ssh rsa key
#type ssh-keygen in the console . it will create a .ssh folder in your 
#home  : /home/username/.ssh

#go to the folder . you will find id_rsa.pub 
#copy it to the remote server where you want to store your backups

#for this type: ssh-copy-id -i  id_rsa.pub  rmhostname@ip 
# then id_rsa.pub will be copied in the remote server 

scp /home/kali/Documents/$filename   remoteserverhostname@id

#now time to set the file in the crontab.
#type crontab -e  . then open it with nano
#  type  01 02 * * *
 
