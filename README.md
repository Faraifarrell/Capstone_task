### WordPress Solution in EC2 (Creating a Resilient and Scalable System)

## Project Overview
This project provides a resilient and scalable WordPress setup on AWS using Terraform for infrastructure provisioning. It ensures high availability, scalability, and efficient resource management by integrating EC2 instances, an Application Load Balancer (ALB), Auto Scaling Group (ASG), and Amazon RDS.

## Purpose
The goal of this project is to create an engaging platform for running enthusiasts to:
- Share reviews and experiences about running gear and events.
- Discuss running events and stay informed about upcoming races.
- Exchange workout recommendations and training tips.

**Benefits of Joining a Running Community:**
- **Motivation and Accountability:** Engage with fellow runners to stay motivated and accountable.
- **Knowledge Sharing:** Gain insights and advice from experienced runners and trainers.
- **Event Awareness:** Stay updated on local and global running events and races.
- **Support Network:** Access a supportive community for encouragement and tips.
- **Improved Performance:** Learn new techniques and strategies to enhance your running performance.

## Key Features
- **Auto-Scaling:** Dynamically adjusts the number of EC2 instances based on CPU utilization.
- **High Availability:** RDS for database management and auto-scaling for web instances.
- **Automated Setup:** EC2 user data script for automatic WordPress installation.
- **SNS Notifications:** Email alerts for CloudTrail events.

## Setup Components
- **VPC:**
  - 2 Public and 2 Private subnets.
  - 1 Internet Gateway (IGW) attached.
  - Route tables for public and private subnets.
- **Security Group:**
  - Allows HTTP (port 80) and SSH (port 22) traffic.
- **EC2 Instance:**
  - Configured with Apache, PHP, and WordPress.
  - Connects to RDS for database storage.
- **ELB (Application Load Balancer):**
  - Includes Target Group and Listener configurations.
- **Auto Scaling:**
  - Minimum 1, desired 2, and maximum 4 instances.
- **User Data:**
  - Automatically configures WordPress upon instance launch.
- **SNS Topic and Subscription:**
  - For email notifications related to CloudTrail events.

## Setup Instructions

### Terraform
1. Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
2. Clone this repository.
3. Navigate to the cloned directory.
4. Initialize Terraform: `terraform init`.
5. Configure AWS credentials in `terraform.tfvars`.
6. Apply Terraform configuration: `terraform apply`.
7. Note output information such as ALB URL, ASG details, and RDS connection info.

### Keyname Change
1. Update `key_name` in `vars.tf`.
2. Reapply Terraform: `terraform apply`.

### IAM Role Change
1. Update `instance_profile` in `vars.tf`.
2. Reapply Terraform: `terraform apply`.

## Additional Considerations
- **Security:** Secure AWS credentials and use IAM policies effectively.
- **Backup & Recovery:** Implement backups and disaster recovery plans for RDS.
- **Scaling:** Monitor and adjust auto-scaling policies based on traffic and performance.
- **Troubleshooting:** Check common issues and solutions for setup problems.
- **Contributions:** Follow guidelines for submitting changes or reporting issues.
- **References:** AWS Documentation, Terraform Guides, WordPress Installation.

## Future Enhancements
1. **Multi-AZ Deployment:**
   - Implement multi-AZ deployment for Amazon RDS to enhance fault tolerance and high availability.
2. **DNS and Route 53:**
   - Utilize AWS Route 53 for DNS management and failover configurations to improve reliability and availability.
3. **CloudWatch Alarms:**
   - Set up additional CloudWatch alarms to monitor and respond to various system metrics and events.
4. **S3 Bucket Notifications:**
   - Configure S3 bucket notifications to trigger alerts or workflows based on relevant events such as object creation or deletion.
5. **Serverless Services:**
   - **Lambda/Fargate:** Replace EC2 instances with AWS Lambda or AWS Fargate to reduce operational overhead and improve scalability.
   - **Amazon RDS Aurora Serverless:** Switch to Amazon Aurora Serverless for the database to automatically adjust capacity based on demand, reducing costs and improving performance.

## Versioning
- **Current Version:** 1.0.0
- **Future Updates:** Check the changelog for upcoming changes.
