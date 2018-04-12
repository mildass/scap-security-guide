#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_common

yum install -y audit

MAX_LOG_FILE_ACTION="^max_log_file_action[[:space:]]*=.*$"
if grep -q "$MAX_LOG_FILE_ACTION" /etc/audit/auditd.conf; then
        sed -i "s/$MAX_LOG_FILE_ACTION/max_log_file_action = suspend/" /etc/audit/auditd.conf
else
        echo "max_log_file_action = suspend" >> /etc/audit/auditd.conf
fi
