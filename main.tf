/*
This is an application template used for deploying, you guessed it, your app leveraging
standardized, reuseable infrastructure.

What this means is that you only need to worry about what your app does and how it should
work as opposed to builing infrastructure over and over and having to maintain the same
components in N places.

You can pick any architecture blueprints from https://github.com/sfell77 (repos that are
prefixed with "arch_") and include them as modules, providing your own variables or override
values, as needed.

App-specific fields (which need to be provided per app) are available at the top of each
module -- copy these values to your app template and provide the desired values.
*/

provider = "aws" {
    version = "~> 3.37"
}

# This is an example of how to leverage blueprints; all of the required fields can be found in the remote repo in the README.  In the below case, I want to deploy my app into elastic compute cloud (EC2) instances managed by an autoscaling group (ASG) with an elastic load balancer (ELB) as an entry point/traffic manager.

module "arch_ec2_asg_elb" {
    source = "git::https://github.com/sfell77/arch_ec2_asg_elb"
    app_name                = var.app_name                      # Your app name; use [a-zA-Z0-9_-] for best results
    aws_region              = var.aws_region                    # The AWS region you're deploying to.  For example, us-east-1
    ami_id                  = var.ami_id                        # The ID of the AMI you're using
    deploy_env              = var.deploy_env                    # The environment (dev/qa/prod/...) you're deploying to
    asg_max_size            = var.asg_max_size                  # Max number of instances in your autoscaling group
    asg_min_size            = var.asg_min_size                  # Min number of instances in your autoscaling group
    asg_desired_size        = var.asg_desired_size              # The desired (BAU) number of instances in your autoscaling group
    instance_type           = var.instance_type                 # The AWS instance type (such a "t2.micro") for your instances
    volume_type             = var.ebs_volume_type               # The type of disk your EC2 will use, suggest "gp2"
    volume_size             = var.ebs_volume_size               # The size (in GB) of your EC2 disk space (int type -- no quotes)
    s3_bucket_name          = var.s3_bucket_name                # You need a pre-existing S3 bucket for statefiles
    tag_owner_contact       = var.tag_owner_contact             # Email/identifier of group supporting the application
    tag_deployment_owner    = var.tag_deployment_owner          # Email/identifier of the person deploying this asset
    security_groups         = var.security_groups               # These should be created/exported from your app configuration
}

module "some_other_blueprint" {
    source = "..."
    ...
}

resource "aws_whatever_else_you_need" "resource_identifier" {
    ...
}
