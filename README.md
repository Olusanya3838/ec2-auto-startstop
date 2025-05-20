# 🚀 EC2 Auto Start/Stop Using AWS Lambda & Terraform

This project automates the **start and stop of EC2 instances** on a schedule using:
- 🛠️ AWS Lambda
- ⏰ Amazon EventBridge (CloudWatch Events)
- 🔐 IAM Roles and Policies
- 💻 Terraform (Infrastructure as Code)

It’s designed to reduce AWS costs by stopping instances during off-hours and restarting them when needed.

---

## 🧰 Tech Stack

- **Terraform** – Infrastructure as Code
- **AWS Lambda** – Python-based automation
- **Amazon EventBridge** – Scheduled triggers
- **IAM** – Role-based security
- **Amazon EC2** – Virtual servers
- **GitHub** – Version control

---

## 📦 Features

✅ Automatically starts EC2 instances at **12:00PM WAT** 
✅ Automatically stops EC2 instances at **12:30 PM WAT**  
✅ Filters EC2 instances based on tag: `AutoStartStop = true`  
✅ Serverless and cost-saving  
✅ Fully repeatable via Terraform

---

## 📂 Folder Structure

![logs](https://github.com/user-attachments/assets/3f4cb400-ffcf-451d-a07a-ea788fcf23fd)
![terrrafom](https://github.com/user-attachments/assets/eb00da57-e2b7-437b-a2d9-00984b37951b)
![terraform4](https://github.com/user-attachments/assets/9d8e0bc2-a24c-4b42-899a-74604208cc4c)
![ec21](https://github.com/user-attachments/assets/b18effb5-3d1a-4b51-807d-2bd843094a06)
![ec2](https://github.com/user-attachments/assets/fcff9eca-5f67-4511-be88-95eda2cd48d3)
![log2](https://github.com/user-attachments/assets/8604dcaf-a578-4209-a597-a7fa5be19936)


