## BJSS Platform Engineer Tech Test - AWS

We do not expect or require all tasks to be completed. Talk through your work
and changes as much as possible.

## Tasks

The provided configuration should create an autoscaling group with one instance
that is publicly accessible over port 80 and running apache. State files
are stored locally.

There are some problems with the existing code.

1. Resolve any issues with the existing configuration and successfully apply it.
   Verify that the web server is accessible.

2. Scale up the autoscaling group to 2 instances, add a load balancer and
   ensure the service is highly available.

3. Prove the new set up works correctly by showing connections hitting each
   instance.

4. Outline improvements and suggestions for the code and infrastructure.


## Access

A keypair will need generating to be used by Terraform.

The AWS cli is installed and can be used. The default profile has been
configured for use with terraform.

Full internet access including the AWS console is available.
