# Access & Capabilities

This section describes **what you are allowed to do on AWS as a BangLab user**.

Access is **role-based**: each user is assigned a **permission set**
that defines which actions are supported in a given AWS account.

---

## Primary Permission Set

Most lab members are assigned the **EC2-GPU-Operator** permission set.

This role enables:

- managing your own EC2 instances, including GPU instances,
- managing your own EBS volumes and security groups,
- storing and managing data in your own S3 buckets,
- viewing limited cost and usage information.

Details are described on the next page.

---

## Resource Ownership

Some AWS member accounts are shared by multiple researchers. To keep resources
separate inside a shared account, BangLab uses an `Owner` value for each user.

EC2 instances, EBS volumes, and security groups are separated by `Owner` tags.
S3 buckets are separated by bucket name.

Read the resource ownership rules before creating resources.

---

## Shared Responsibility

AWS resources are **shared lab infrastructure**.

Lab members are expected
to follow a small set of **usage guidelines** that help:

- control costs,
- ensure fair access,
- avoid accidental resource waste.

These expectations are documented explicitly.

---

The pages in this section describe:

- what each permission set allows,
- what workflows are supported,
- and the usage guidelines that apply to all users.
