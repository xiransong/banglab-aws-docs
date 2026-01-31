# EC2-GPU-Operator

**EC2-GPU-Operator** is the primary permission set for BangLab researchers.
It is designed to support **GPU-based research workflows**. 

This page describes **what this role allows and does not allow**.

---

## What You Can Do

### 1. Manage EC2 Instances

You can:

- view EC2 resources and instance details
- launch new EC2 instances
- start, stop, and terminate instances you launched
- use GPU-backed instance types (subject to vCPU quota)

This covers the full lifecycle needed for research experiments.

---

### 2. Tag EC2 Resources

You can:

- create and delete EC2 tags

Tags are used for:

- tracking projects
- organizing resources

You are recommended to tag instances you create. 

---

### 3. Use S3 for Data Storage

You can:

- create and delete S3 buckets
- list buckets you have access to
- upload, download, and delete objects
- manage **encryption** and **versioning** settings on your own buckets

This supports:

- storing datasets
- saving experiment outputs
- sharing artifacts across machines

Some S3 settings may be enforced automatically as guardrails.

---

### 4. View Cost and Usage Information

You can:

- view limited billing and usage information
- inspect cost breakdowns related to your usage

You **cannot**:

- modify billing settings
- manage credits
- access organization-wide financial controls

This allows cost awareness without billing risk.

---

## Important Constraints to Be Aware Of

- **vCPU quotas** apply at the account level  
  A new account may initially have zero GPU vCPU quota. 

- **Quota increases** must be requested by an administrator.

- **Resource availability** depends on region and capacity (we are primarily using us-east-1 region).

---

## Summary

The **EC2-GPU-Operator** permission set allows you to:

- run GPU EC2 instances for research,
- store and manage data in S3,
- monitor your own AWS usage.
