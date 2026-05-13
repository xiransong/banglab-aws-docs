# BangLab AWS Guide

Welcome! This site documents how **BangLab** uses AWS to support research workloads, 
with a focus on **GPU compute (EC2)** and **object storage (S3)**.

This is **not** a general AWS tutorial.  
It is a **lab-specific guide** describing:

- what resources are available to you, and 
- how to use AWS safely and efficiently in our research environment.

This tutorial uses a practical toolbox for AWS workflows: [`banglab-aws-tools`](https://github.com/xiransong/banglab-aws-tools)

---

## 🎯 Who This Guide Is For

This documentation is intended for:

- PhD students, MSc students, and researchers in BangLab
- Lab members who need **on-demand GPU compute**
- Anyone storing datasets, checkpoints, or experiment outputs on **S3**

**No prior AWS experience is assumed.**

---

## 🚀 New Here? Start This Way

If this is your first time using AWS in the lab, **follow this order**:

1. **Concepts**  
   Understand the basic ideas behind AWS, EC2, S3, and SSO.

2. **Access & Capabilities**  
   Learn what your permission set allows you to do.

3. **Onboarding**  
   Set up login, MFA, and the AWS CLI correctly.

4. **EC2 Guidance**
   Learn the EC2 model, recommended AMIs and instance types, and then use
   [`banglab-aws-tools`](https://github.com/xiransong/banglab-aws-tools) for
   day-to-day instance and EBS workflows.

5. **S3 Tutorials**  
   Store and manage data.
