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

