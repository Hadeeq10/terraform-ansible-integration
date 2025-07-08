# Overview
This repository contains the Terraform and Ansible code for my Automation Project, a practical implementation of infrastructure and configuration automation on Microsoft Azure. The project showcases the use of Infrastructure as Code (IaC) and Configuration Management to build a highly available, scalable, and secure cloud environment.

This project involves:

- Codifying infrastructure using Terraform to create Azure resources.

- Automating configuration tasks with Ansible roles.

- Integrating Terraform with Ansible for seamless provisioning.

- Implementing and validating a load-balanced web application across Azure VMs.

# Technologies Used
Cloud Platform: Microsoft Azure

Infrastructure as Code: Terraform

Configuration Management: Ansible

Operating System: Linux (Ubuntu) WSL

# Key Features

Infrastructure Automation (Terraform):

- Deployment of Azure resources (VMs, network, storage).

- Parameterization for flexibility and scalability.

- Use of a remote backend for state management.

Configuration Management (Ansible):

- User and group creation with SSH key generation.

- Disk partitioning and mounting.

- Web server setup with Apache and load balancer integration.

- File and system configuration.

Integration:

- Automated execution of Ansible playbooks via Terraform provisioners.

# Setup
Clone this repository:
- git clone https://github.com/Hadeeq10/terraform-ansible-integration.git
- cd terraform-ansible-integration/project

Initialize Terraform:
- terraform init

Validate Terraform configuration:
- terraform validate

Apply Terraform configuration:
- terraform apply --auto-approve

Run Ansible playbook (if not integrated):
- ansible-playbook ansible/ID-playbook.yml

(Note: You should use the same ID everywhere to stop the confusion between IDs)

# Validation Steps

Pre-Provisioning Validation:
- Confirm Terraform initialization, validation, and plan steps.

Post-Provisioning Validation:

Log in to the VMs and verify:
- User setup.
- Disk partitioning.
- Apache server functionality with load balancer.

Final Validation:
- Enter the load balancer's FQDN in a browser to confirm the round-robin functionality of the web servers.
