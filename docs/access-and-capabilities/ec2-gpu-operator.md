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
- use GPU instance types (subject to vCPU quota)

This covers the full lifecycle needed for research experiments.

---

### 2. Use S3 for Data Storage

You can:

- create and delete S3 buckets
- upload, download, and delete objects

This supports:

- storing datasets and saving experiment outputs
- sharing artifacts across machines

---

### 3. View Cost and Usage Information

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

- **vCPU quotas** apply at the account level. A new account may initially have zero GPU vCPU quota. 

- **Quota increases** must be requested by an administrator.

- **Resource availability** depends on region and capacity (we are primarily using us-east-1 region).
