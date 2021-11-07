Installing Parrot Hub on a Raspberry Pi

Become root to use the install script:

```sudo su```

run the following command to install Parrot Hub

```bash <(curl -s https://raw.githubusercontent.com/parrot-ha/scripts/main/rpi/installParrotHub.sh)```

A new user will be created and you will be asked to enter a password for the user.  Choose something you can remember.
After that you will be prompted to enter information for the user such as Full Name, you can just hit enter for all these values.

Example output from command:

```
pi@raspberrypi:~ $ sudo su
root@raspberrypi:/home/pi# bash <(curl -s https://raw.githubusercontent.com/parrot-ha/scripts/main/rpi/installParrotHub.sh)
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
...
Do you want to continue? [Y/n] Y
Get:1 ...
Adding user `parrot-hub' ...
Adding new group `parrot-hub' (1001) ...
Adding new user `parrot-hub' (1001) with group `parrot-hub' ...
Creating home directory `/home/parrot-hub' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for parrot-hub
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] Y
Adding user `parrot-hub' to group `dialout' ...
Adding user parrot-hub to group dialout
Done.
...
Created symlink /etc/systemd/system/multi-user.target.wants/parrot-hub.service → /lib/systemd/system/parrot-hub.service.
root@raspberrypi:/home/pi# exit
exit
pi@raspberrypi:~ $ 
```

Once the script is done running you can find the ui running on port 7000 at the IP address of your raspberry pi.
