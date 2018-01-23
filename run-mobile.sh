#!/bin/sh
cd ansible

TARGET_HOST="vagrant1"
OCP_USERNAME="cvicensa-redhat.com"
WORKLOAD="mobile-storage"
ENV_TYPE="mobile"
GUID=0cbe

# a TARGET_HOST is specified in the command line, without using an inventory file
ansible-playbook -vvv -i ../mobile.hosts ./software_playbooks/mobile.yml \
                -e "ansible_ssh_private_key_file=.vagrant/machines/default/virtualbox/private_key" \
                -e "ansible_ssh_user=vagrant" \
                -e "env_type=${ENV_TYPE}" \
                -e "ANSIBLE_REPO_PATH=`pwd`" \
                -e "ocp_username=${OCP_USERNAME}" \
                -e "ocp_workload=${WORKLOAD}" \
                -e "guid=${GUID}" \
                -e "ocp_user_needs_quota=true" \
                -e "ocp_apps_domain=apps.rhpds.openshift.opentlc.com" \
                -e "ACTION=create"