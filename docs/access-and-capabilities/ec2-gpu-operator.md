# EC2-GPU-Operator

**EC2-GPU-Operator** is the primary permission set for BangLab researchers.
It is designed to support **GPU-based research workflows**. 

This page describes **what this role allows and does not allow**.

The permission set uses owner-based access control. In shared AWS accounts,
you can manage only resources that match your BangLab username.

---

## What You Can Do

### 1. Manage EC2 Instances

You can:

- view EC2 resources and instance details
- launch new EC2 instances
- start, stop, reboot, and terminate EC2 instances whose `Owner` tag matches
  your username
- use GPU instance types (subject to vCPU quota)

This covers the full lifecycle needed for research experiments.

---

### 2. Manage Your EBS Volumes

You can:

- create EBS volumes with your own `Owner` tag
- attach and detach your own EBS volumes
- modify, snapshot, and delete your own EBS volumes

This supports persistent datasets, checkpoints, and experiment workspaces.

---

### 3. Manage Your Security Groups

You can:

- create security groups with your own `Owner` tag
- edit inbound and outbound rules on your own security groups
- delete your own security groups

This lets you manage SSH access without changing another user's firewall rules.

---

### 4. Use S3 for Data Storage

You can:

- create and delete S3 buckets named `banglab-<username>-*`
- upload, download, and delete objects in your own buckets

This supports:

- storing datasets and saving experiment outputs
- sharing artifacts across machines

---

### 5. View Cost and Usage Information

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

- **Owner tags are required** for user-created EC2 instances, EBS volumes, and
  security groups.

- **S3 buckets must use the `banglab-<username>-*` naming pattern**.

- **vCPU quotas** apply at the account level. A new account may initially have zero GPU vCPU quota. 

- **Quota increases** must be requested by an administrator.

- **Resource availability** depends on region and capacity (we are primarily using us-east-1 region).

---

## What This Means in Practice

You can manage:

- EC2 instances with `Owner=<your username>`
- EBS volumes with `Owner=<your username>`
- security groups with `Owner=<your username>`
- S3 buckets named `banglab-<your username>-*`

You cannot manage another user's EC2 instances, EBS volumes, security groups, or
S3 buckets.

If a resource is created without the correct `Owner` tag, you may not be able
to manage it. Ask an administrator to add or correct the tag.
