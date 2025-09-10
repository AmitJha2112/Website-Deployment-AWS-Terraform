# Website Deployment on AWS using Terraform and Custom VPC

## Project Overview
This project demonstrates how to deploy a **scalable and highly available website** on AWS using **Terraform**. It includes:

- Creation of a **Custom VPC** with public and private subnets  
- **Internet Gateway** and **NAT Gateway** for connectivity  
- **Security Groups** for safe access  
- **Auto Scaling** and **Application Load Balancer (ALB)**  
- **CloudWatch monitoring** with alarms and dashboards  
- **SNS notifications** for real-time alerts  
- Secure **database deployment** in a private subnet  

This setup ensures your website is highly available, scalable, and monitored.

---

## Features
- Custom VPC for isolated networking  
- Auto Scaling for traffic handling  
- Application Load Balancer for distributing requests  
- CloudWatch monitoring and dashboards  
- SNS notifications for critical alerts  
- Secure database in a private subnet  

---

## Prerequisites

Before running this project, ensure you have:

1. **Terraform v1.5+** installed  
   [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  

2. **AWS CLI** installed and configured:  
   ```bash
   aws configure

   Enter your AWS credentials, default region, and output format.

Steps to Deploy the Website on AWS

Clone the repository

git clone https://github.com/AmitJha2112/Website-Deployment-AWS-Terraform.git
cd Website-Deployment-AWS-Terraform


Set AWS credentials

Either via AWS CLI:

aws configure


Or using environment variables:

export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"


Initialize Terraform

terraform init


Validate Terraform configuration

terraform validate


Create an execution plan

terraform plan


Apply the configuration

terraform apply


Terraform will ask for confirmation. Type yes to proceed.

Verify deployment

Check AWS Console for created resources.

Open the Application Load Balancer DNS in a browser to see your website.

Destroy resources (optional)

terraform destroy


Type yes to remove all resources and avoid charges.

Website-Deployment-AWS-Terraform/
│
├── images/                Screenshots for README
├── provider.tf            AWS provider configuration
├── variables.tf           Terraform variables
├── main.tf                VPC, Subnets, Security Groups
├── alb.tf                 Application Load Balancer
├── autoscaling.tf         Auto Scaling configuration
├── sns.tf                 SNS notifications
├── cloudwatch.tf          CloudWatch alarms & dashboards
└── README.md              Project documentation


## 🛠 Project Implementation Steps

### 1. Create a Custom VPC
![Custom VPC Creation](images/Screenshot1.png)

### 2. Create Subnets (Public & Private)
![Subnet Configuration](images/Screenshot2.png)

### 3. Create an Internet Gateway
![Internet Gateway Setup](images/Screenshot3.png)

### 4. Create a NAT Gateway
![NAT Gateway Setup](images/Screenshot4.png)

### 5. Create Route Tables (Public & Private)
![Route Tables Setup](images/Screenshot5.png)

### 6. Create Security Group (Ports 22, 80)
![Security Group Rules](images/Screenshot6.png)

### 7. Create an SNS Topic
![SNS Topic Creation](images/Screenshot7.png)

### 8. Create an Empty Target Group
![Target Group Setup](images/Screenshot8.png)

### 9. Create an Application Load Balancer
![ALB Creation](images/Screenshot9.png)

### 10. Create Launch Template
![Launch Template Setup](images/Screenshot10.png)

### 11. Create an Auto Scaling Group
![Auto Scaling Group](images/Screenshot11.png)

### 12. Create CloudWatch Alarms
![CloudWatch Alarms](images/Screenshot12.png)

### 13. Create CloudWatch Dashboard
![Monitoring Dashboard](images/Screenshot13.png)

### 14. Attach Domain to Load Balancer
![DNS Mapping](images/Screenshot14.png)

### 15. Launch Database in Private Subnet
![DB Instance Setup](images/Screenshot15.png)
---

##  Website Outputs


### Public IP Outputs
- **Webserver 1 Output**  
  ![My_Project_Webserver1](images/screenshot20.png)

### Load Balancer & Domain Outputs
- **Application Output via Load Balancer DNS**  
  ![Load Balancer Output](images/screenshot21.png)
- **Final Deployed Website Home Page with Domain**  
  ![Home Page](images/screenshot22.png)
- **About Page via Domain**  
  ![About Page](images/screenshot23.png)
- **Our Menu Section**  
  ![Our Menu](images/screenshot24.png)
- **Customer Reviews Section**  
  ![Customer Reviews](images/screenshot25.png)
- **Contact Page**  
  ![Contact Page](images/screenshot26.png)

---

##  Project Architecture
![AWS Project Architecture](images/screenshot27.png)

---

##  Summary
- Hosted a **scalable & highly available website** on AWS using a **Custom VPC**  
- Implemented **Auto Scaling** and **Application Load Balancer** for traffic management  
- Enabled **CloudWatch Monitoring** with alarms and dashboards  
- Integrated **SNS Notifications** for real-time alerts  
- Secured the architecture by placing the **database in a private subnet**  
✨🚀 Scalable Website Deployment on AWS with Custom VPC, Load Balancing & Monitoring ✨

I recently worked on a cloud project that demonstrates hosting a highly available and secure website on AWS, leveraging Custom VPC, Auto Scaling, Application Load Balancer, and CloudWatch Monitoring.

🔹 What it does:
The project deploys a multi-tier website architecture where traffic is distributed via an Application Load Balancer, instances scale automatically based on demand, and system health is monitored in real time using CloudWatch with alerts sent via SNS. A database is securely hosted in a private subnet, ensuring data protection.

🔹 Prerequisites to try this project:
• Basic knowledge of AWS EC2, VPC, and networking concepts
• AWS account with access to EC2, VPC, ALB, Auto Scaling, CloudWatch, SNS, Route 53
• Understanding of Linux commands and Apache web server setup
• Domain name for integration with Route 53 (optional)

🔹 Project Workflow:
1️⃣ VPC & Subnets – Designed a custom VPC with public & private subnets for secure network segmentation.
2️⃣ Gateways & Routing – Configured Internet & NAT Gateways with route tables for controlled connectivity.
3️⃣ Security Groups – Allowed necessary inbound traffic (HTTP/SSH) while maintaining tight security rules.
4️⃣ Application Load Balancer – Distributed incoming traffic evenly across EC2 instances.
5️⃣ Launch Template & Auto Scaling – Automated provisioning and scaling of web servers using user data scripts.
6️⃣ CloudWatch Monitoring & SNS Alerts – Set up alarms for CPU thresholds with email notifications.
7️⃣ Database in Private Subnet – Isolated backend database for secure access via a bastion host.
8️⃣ Domain Integration – Mapped custom domain to ALB for a professional user experience.

🔹 Benefits:
✅ Highly available and fault-tolerant architecture
✅ Real-time performance monitoring and alerting
✅ Secure isolation of application and database layers
✅ Automated scaling to handle varying traffic loads

---  

---
## Final Note

> [!Important]
>
> _If you find this repository useful for learning, please give it a star on GitHub. Thank you!_

---

## 🛠️ Author & Community  

This project is crafted by **[Amit Kumar Jha](https://github.com/amitjha2112)** 💡.  
I’d love to hear your feedback! Feel free to share your thoughts.  

📧 **Connect with me:**

- **GitHub**: [amitjha2112](https://github.com/amitjha2112)   
- **LinkedIn**: [Amit Kumar Jha](https://www.linkedin.com/in/amit-kumar-jha-55b112216/)  

---

⭐ Support the Project
If you found this helpful, consider starring ⭐ the repository and sharing it with your network! 🚀
