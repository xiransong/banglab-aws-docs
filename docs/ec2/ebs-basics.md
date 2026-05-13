# EBS Basics

This page explains how **EBS storage** relates to EC2 instances and what
happens to your data during the instance lifecycle.

For practical persistent EBS commands, use:

[banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools)

---

## What Is EBS?

**EBS (Elastic Block Store)** provides disk storage for EC2 instances.

A simple mental model:

- **EC2 instance** = the machine
- **EBS volume** = the disk attached to that machine

Inside the instance, EBS behaves like a normal Linux disk.

---

## Root EBS vs Persistent EBS

Every EC2 instance has a **root EBS volume**. It contains the operating system
and files stored on the instance's normal filesystem.

BangLab workflows may also use a separate **persistent EBS volume** mounted at:

```text
~/scratch
```

Recommended pattern:

- keep EC2 instances disposable
- store long-lived research state on persistent EBS at `~/scratch`
- do not mount persistent EBS directly at `~/`

---

## What Happens to EBS Data

- **Stopping an instance**
  - the instance is powered off
  - root EBS data is preserved
  - compute billing stops, but EBS storage can still cost money

- **Starting an instance**
  - the same root EBS volume is reattached
  - files on the root volume are still there
  - the public IP address may change

- **Terminating an instance**
  - the instance is permanently deleted
  - the root EBS volume is usually deleted
  - data on the root volume is lost

A separate persistent EBS volume survives instance termination unless it is
explicitly deleted.

---

## Ownership Rules

In BangLab shared AWS accounts, EBS volumes are owner-protected.

User-created volumes must have:

```text
Owner=<username>
Name=<volume name>
```

With the `EC2-GPU-Operator` permission set, you can manage only volumes whose
`Owner` tag matches your username.

---

## Practical Workflow

Use `banglab-aws-tools` for:

- listing your volumes
- creating a persistent EBS volume
- attaching it to a running instance
- initializing a new scratch volume once
- mounting an existing scratch volume during daily work

The toolbox docs explain how to avoid common mistakes, such as accidentally
passing a root EBS volume ID when you meant to mount your persistent scratch
volume.

---

## EBS and S3

Use **EBS** for:

- active experiments
- datasets currently in use
- checkpoints and intermediate results

Use **S3** for:

- backups
- long-term storage
- sharing data across machines
