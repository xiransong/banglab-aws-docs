# Lab Usage Guidelines

AWS resources are **shared lab infrastructure**. 

The following guidelines help:

- keep costs under control,
- maintain clarity within each account,
- and ensure smooth operation across the lab.

---

## EC2 Usage

- **Tag every EC2 resource with your owner value**  
  Instances, EBS volumes, security groups, and EC2 key pairs must use
  `Owner=<username>`, for example `Owner=xiransong`.

- **Terminate instances when you are done**  
  Running instances consume budget and quota.

- **Do not leave idle instances running**  
  If an instance is not actively doing work, stop or terminate it.

- **Use the smallest instance that meets your needs**  
  Larger instances consume more quota and cost more.

---

## Owner Tagging

Some AWS accounts are shared by multiple lab members. Owner tags are required
so users can manage their own resources without affecting someone else's work.

Use your full-name-style BangLab username consistently:

```text
Owner=xiransong
Name=xiransong-gpu-dev
```

Recommended `Name` tag pattern:

```text
Name=<username>-<purpose>
```

Examples:

```text
Name=xiransong-cpu-test
Name=xiransong-gpu-dev
Name=xiransong-persistent-ebs
Name=xiransong-ssh
Name=xiransong-key
```

---

## GPU & Quota Awareness

- GPU capacity is limited at the account level, since vCPU quotas apply per account

---

## S3 Usage

- Name S3 buckets using the required `banglab-<username>-*` pattern
- Use S3 for **datasets and experiment outputs**, not scratch space
- Avoid high-frequency, small-file updates
- Clean up unused buckets and data when no longer needed

Examples:

```text
banglab-xiransong-data
banglab-xiransong-scratch
```

---

## Cost Awareness

- You do **not** pay personally for AWS usage
- All usage consumes **shared lab credits**
