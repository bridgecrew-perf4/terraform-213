# Register with Redhat for RHEL VMs
subscription-manager register --username nishantkj911
subscription-manager attach --auto

# update machine
dnf -y update

# install ansible
yum install -y ansible

ansible-playbook playbooks/initial-tasks.yml
ansible-playbook playbook/install-master.yml