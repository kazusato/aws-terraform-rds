#!/usr/bin/env bash
. nogit/env_info.sh
aws ec2 stop-instances --instance-ids ${EC2_INSTANCE_ID} --region ${REGION}
