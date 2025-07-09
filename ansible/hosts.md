[jenkins-master]
10.1.1.43
[jenkins-master:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/Terraformkey.pem
[jenkins-slave]
10.1.1.17
[jenkins-slave:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/Terraformkey.pem
need to copy jenkins-master-setup.yaml code and go to ansible terminal open cd /opt create vi jenkins-master-setup.yaml and past code
next run ansible-playbook -i hosts jenkins-master-setup.yaml --check in ansible terminal
next run ansible-playbook -i hosts jenkins-master-setup.yaml in ansible terminal
need to copy jenkins-slave-setup.yaml code and go to ansible terminal open cd /opt create vi jenkins-slave-setup.yaml and past code
next run ansible-playbook -i hosts jenkins-slave-setup.yaml --check in ansible terminal
next run ansible-playbook -i hosts jenkins-slave-setup.yaml in ansible terminal
