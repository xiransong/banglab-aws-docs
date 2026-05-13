# Resource Ownership Rules

Some BangLab AWS member accounts are shared by multiple researchers.
To prevent one user from accidentally changing another user's resources,
BangLab uses owner-based resource isolation.

Each researcher has a canonical username based on their full name, for example:

```text
xiransong
alicezhang
bobchen
```

**Important: Please use this same username consistently in EC2 tags, EBS tags,
security group tags, EC2 key pair tags, and S3 bucket names.**

---

## Required Owner Tag

EC2 instances, EBS volumes, security groups, and EC2 key pairs must be tagged
with:

```text
Owner=<username>
```

For example:

```text
Owner=xiransong
Name=xiransong-gpu-dev
```

The `Owner` tag controls who can manage the resource. The `Name` tag is a
human-readable label that helps you identify the resource in the AWS console.

---

## EC2 Instances

When you launch an EC2 instance, include both tags:

```text
Owner=<username>
Name=<username>-<purpose>
```

Examples:

```text
Owner=xiransong
Name=xiransong-cpu-test
```

```text
Owner=xiransong
Name=xiransong-gpu-dev
```

With the `EC2-GPU-Operator` permission set, you can start, stop, reboot, and
terminate only instances whose `Owner` tag matches your username.

---

## EBS Volumes

EBS volumes also need the same owner tag:

```text
Owner=<username>
Name=<username>-<purpose>
```

For a persistent EBS volume, use a clear name such as:

```text
Owner=xiransong
Name=xiransong-persistent-ebs
```

You can attach, detach, modify, snapshot, and delete only EBS volumes whose
`Owner` tag matches your username.

---

## Security Groups

Security groups should also be username-scoped and tagged at creation time:

```text
Owner=<username>
Name=<username>-ssh
```

This keeps SSH firewall rules separate when several researchers use the same
AWS account.

---

## EC2 Key Pairs

EC2 key pairs should also be username-scoped and tagged at creation time:

```text
Owner=<username>
Name=<username>-key
```

The private key stays on your laptop. AWS receives only the public key.

---

## S3 Buckets

S3 bucket ownership is based on the bucket name. Create buckets using this
pattern:

```text
banglab-<username>-*
```

Examples:

```text
banglab-xiransong-data
banglab-xiransong-scratch
banglab-alicezhang-data
```

With the `EC2-GPU-Operator` permission set, a user can access only buckets that
match their own prefix. For example, `xiransong` can access:

```text
s3://banglab-xiransong-data
```

but not:

```text
s3://banglab-alicezhang-data
```

---

## If a Resource Is Mistagged

If a resource is created without the correct `Owner` tag, the normal user may
not be able to manage it. In that case, ask an administrator to add or correct
the `Owner` tag.

The intended rule is:

```text
Resource Owner tag == IAM Identity Center Owner attribute
```

For S3, the intended rule is:

```text
Bucket name starts with banglab-<Owner>-
```
