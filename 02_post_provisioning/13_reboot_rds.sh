#!/usr/bin/env bash
. nogit/env_info.sh
aws rds reboot-db-instance --db-instance ${RDS_INSTANCE_NAME} --region ${REGION}
