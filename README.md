# 🚀 Deploy Static Website on AWS S3 using Terraform

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![AWS](https://img.shields.io/badge/AWS-S3-orange.svg)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple.svg)
![GitHub](https://img.shields.io/badge/GitHub-VersionControl-blue.svg)

---

## 📖 Overview

This project demonstrates how to deploy a fully functional **static website** on **AWS S3** using **Terraform** as Infrastructure as Code (IaC).
By automating the provisioning process, the infrastructure is reproducible, scalable, and easy to manage.

---

## 🔧 Tools & Technologies Used

* **Amazon S3** — Static website hosting
* **Amazon IAM** — Identity and Access Management (permissions control)
* **Terraform** — Automating infrastructure deployment
* **AWS CLI** — Command-line interface for AWS
* **GitHub** — Version control system
* **HTML/CSS** — Simple frontend for the website (`index.html`)
* **Git Ignore (.gitignore)** — For excluding unnecessary files during git push

---

## 📂 Project Structure

```bash
.
├── .gitignore              # Excludes files from Git tracking
├── .terraform.lock.hcl     # Terraform lock file
├── founder.jpg             # Image asset used by the website
├── index.html              # Static website homepage
├── main.tf                 # Main Terraform configuration
├── output.tf               # Terraform outputs after apply
└── variable.tf             # Terraform variables
```

---

## 🖼️ Architecture Diagram

Below is the high-level architecture of the system:

\| User | → | Terraform | → | AWS (S3, IAM) | → | Static Website Hosted |


[Architecture Diagram](architecture2.png)

---
## ⚙️ How to Deploy

### 11⃣ Prerequisites

* AWS Account
* AWS CLI installed and configured
* Terraform installed
* Git installed

### 12⃣ Deployment Steps

1. Clone the repository:

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

2. Initialize Terraform:

```bash
terraform init
```

3. Preview the changes:

```bash
terraform plan
```

4. Apply the configuration:

```bash
terraform apply
```

5. After successful deployment, get your website URL from the Terraform output.

---

## 🚩 Challenges Faced

During development, I faced an issue while pushing to GitHub due to large files being included. GitHub push was stuck because of the size of some unnecessary files.

**Solution:**

* Added a `.gitignore` file to exclude large files.
* Removed unwanted files from Git history.
* Successfully pushed a clean repository.

---

## 📈 Future Improvements

* ✅ Add **CloudFront CDN** for global low-latency delivery.
* ✅ Add **SSL Certificates** using AWS Certificate Manager.
* ✅ Add **CI/CD Pipeline** for automatic deployment using GitHub Actions.
* ✅ Implement **Versioning** for better file control.
* ✅ Add **Custom Domain Name** using Route 53.

---

## 👤 Author

**Rebira Adugna**
