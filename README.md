# f5-test
vagrant plugin install vagrant-vbguest
vagrant Vagrant 2.0.1
Install Vagrant from https://www.vagrantup.com/downloads.html
Register for a free trial account and licenses at https://downloads.f5.com/trial/.
Download BIGIP-11.6.3.2.0.0.2.LTM_1SLOT-ide-updated.ova appliance image from
https://downloads.f5.com/esd/serveDownload.jsp?path=/big-ip/big-ip_v11.x/11.6.3/english/11.6.3.2_virtual-edition/&sw=BIG-IP&pro=big-ip_v11.x&ver=11.6.3&container=11.6.3.2_Virtual-Edition&file=BIGIP-11.6.3.2.0.0.2.LTM_1SLOT-ide-updated.ova
Import into Virtualbox, adjust a few settings:
Adapter 1: Bridged Adapter
Adapter 2: Paravirtualized Network (Bridged Adapter)
Video memory > 8MB.
Power on the imported appliance.
Login to the appliance on the console u:root p:admin.
Obtain the IP address adapter one / eth0 was assigned.
Go to https://IP and run through the setup, configuring a static IP.

To finish setting up the Windows webserver-C, you will need to login to the console with vagrant as the password and go to computer management. Internet Information Services-> Expand WEBSERVER-C-> Sites-? Default Web Site.
On the right side, click on Bindings, go to 443 and change the dropdown for SSL certificate to "WMSVC" to use the self-signed on. I considered getting this fully automated outside the scope of the test. The thumbprint of this cert. changes for each "vagrant up".

If the reactors don't fire, salt-master may need to be restarted after the minions come online.

Using node names for caused issues
