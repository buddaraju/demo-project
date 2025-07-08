# Setup Ansible

1. Install ansibe

   ```sh
   sudo apt update
   sudo apt install software-properties-common
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   sudo apt install ansible
   ```

2. Add Jenkins master and slave as hosts
   Add jenkins master and slave private IPs in the inventory file
   in this case, we are using /opt is our working directory for Ansible.

   ```
   cd /opt
   vi hosts
    [jenkins-master]
    need to give Private IPv4 addresses
    10.1.1.89
    [jenkins-master:vars]
    ansible_user=ubuntu
    ansible_ssh_private_key_file=/opt/Terraformkey.pem
    [jenkins-slave]
    need to give Private IPv4 addresses
    10.1.1.193
    [jenkins-slave:vars]
    ansible_user=ubuntu
    ansible_ssh_private_key_file=/opt/Terraformkey.pem
   ```

   cat hosts
   need to open cd /home/ubuntu/
   need to drop pem file in /home/ubuntu/
   mv pem file to /opt ->mv file.pem /opt
   cd /opt
   ls -l
   pem file need to be only read permission
   chmod 400 file.pem

3. Test the connection
   ```sh
   ansible -i hosts all -m ping
   ```
