# Note: commands mentioned here are to be run manually. It's not for automation purposes.
#       It is currently configured to NOT use controller node and run operations locally.

# Register with Redhat for RHEL VMs
subscription-manager register --username nishantkj911
subscription-manager attach --auto

# update machine
dnf -y update

# install ansible
yum install -y ansible

#ansible-playbook playbooks/initial-tasks.yml
ansible-playbook playbooks/new_kubernetes_cluster.yml         # Doesn't work on Windows systems.