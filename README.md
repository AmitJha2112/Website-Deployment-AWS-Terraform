# Website Deployment on AWS using Custom VPC and Monitoring

## Project Overview
This project demonstrates hosting a scalable and highly available website on **AWS** by creating a **Custom VPC** with **Auto Scaling**, **Application Load Balancer**, and monitoring via **CloudWatch**. It also integrates **Simple Notification Service (SNS)** for real-time alerts and notifications, ensuring continuous availability, scalability, and operational visibility.

🔗 **GitHub Repository:** [Website_Deployment_on_AWS](https://github.com/AmitJha2112/Website-Deployment-AWS-Terraform)

---

## Features
- **Custom VPC** for secure and isolated networking
- **Auto Scaling** for handling varying traffic loads
- **Application Load Balancer** for distributing requests
- **CloudWatch Monitoring** with alarms and dashboards
- **AWS SNS** for instant notifications
- **Secure Database Deployment** in private subnet

---

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

---

##  Summary
- Hosted a **scalable & highly available website** on AWS using a **Custom VPC**  
- Implemented **Auto Scaling** and **Application Load Balancer** for traffic management  
- Enabled **CloudWatch Monitoring** with alarms and dashboards  
- Integrated **SNS Notifications** for real-time alerts  
- Secured the architecture by placing the **database in a private subnet**  

---
