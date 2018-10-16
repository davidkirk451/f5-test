# f5-test
## BigIP Appliance Setup
1. Register for a free trial account and licenses at https://downloads.f5.com/trial/.
2. Download BIGIP-11.6.3.2.0.0.2.LTM_1SLOT-ide-updated.ova appliance image from
https://downloads.f5.com/esd/serveDownload.jsp?path=/big-ip/big-ip_v11.x/11.6.3/english/11.6.3.2_virtual-edition/&sw=BIG-IP&pro=big-ip_v11.x&ver=11.6.3&container=11.6.3.2_Virtual-Edition&file=BIGIP-11.6.3.2.0.0.2.LTM_1SLOT-ide-updated.ova
3. Import into Virtualbox, adjust a few settings:
  1. Adapter 1: Bridged Adapter
  2. Adapter 2: Paravirtualized Network (Bridged Adapter)
  3. Video memory > 8MB.
  4. Power on the imported appliance.
  5. Login to the appliance on the console u:root p:admin.
  6. Obtain the IP address adapter one / eth0 was assigned.
  7. Go to https://IP using the IP from step 6 and run through the setup, configuring a static IP.

## Vagrant Setup
1. Install Vagrant from https://www.vagrantup.com/downloads.html
2. Install Vagrant Virtualbox Guest Plugin
```bash 
vagrant plugin install vagrant-vbguest
```
This was tested with Vagrant version 2.0.1.
3. Bring the vagrants up:
  1. 
  ```bash
  vagrant up salt-master
  vagrant up '/webserver-.*/'
  ```
  
4. Note: To finish setting up the Windows webserver-C for ssl, you will need to login to the console with vagrant as the password.
  1. Go to computer management.
  2. Internet Information Services-> Expand WEBSERVER-C-> Sites-? Default Web Site.
  3. On the right side, click on Bindings, go to 443 and change the dropdown for SSL certificate to "WMSVC" to use the self-signed one. I considered getting this fully automated outside the scope of the test. (The thumbprint of this cert. changes for each "vagrant up".)

Using node names for pool members caused issues with the salt.states.bigip, perhaps because of some bugs in the module, so I stuck with IP addresses.
