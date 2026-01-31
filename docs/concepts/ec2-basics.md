# EC2 Basics

This page provides a **minimal mental model** of EC2 as used in BangLab.
Details and tutorials are covered later.

---

## 1. What EC2 Is

Amazon EC2 provides **virtual machines**, called **instances**.

An EC2 instance is:

- a server running in the cloud
- accessed via SSH
- where you have **root access**

## 2. Storage: EBS (Elastic Block Store)

EC2 instances use **EBS (Elastic Block Store)** for disk storage.

You can think of:

- EC2 = the computer
- EBS = the hard drive

---

## 3. GPU Instances

Some EC2 instances include **GPUs**. 
GPU availability depends on the **instance type** and **region**. 

For an up-to-date list of supported GPU instances and drivers, see:
[https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html](https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html)

---

## 4. Regions and Availability

AWS resources are created in **regions**.

BangLab primarily uses the **us-east-1** region. 
Unless stated otherwise, all documentation assumes **us-east-1**.

---

## 5. vCPU Quotas (Very Important)

EC2 usage is limited by **vCPU quotas** at the **account level**.

Key points: 

- Every EC2 instance requires a certain number of vCPUs
- Different instance types require different vCPU counts
- A new AWS account typically starts with **0 vCPU quota**

vCPU quotas can be increased by an administrator submitting a request to AWS.

---

## 6. EC2 Pricing

EC2 instances are billed based on:

- instance type
- whether the instance is running
- usage duration

Pricing varies significantly between instance types.

For cost estimation and comparison, use the official AWS Pricing Calculator:
[https://calculator.aws/](https://calculator.aws/)

Understanding pricing helps avoid surprises, but you do not need to memorize prices.
