# EBS Basics

This page explains how **EBS storage** relates to EC2 instances
and what happens to your data during the instance lifecycle.

---

## What Is EBS?

**EBS (Elastic Block Store)** provides disk storage for EC2 instances.

A simple mental model:

- **EC2 instance** = the machine (CPU / GPU / memory)
- **EBS volume** = the disk attached to that machine

Inside the instance, EBS behaves like a normal Linux disk.

---

## What Happens to EBS Data

- **Stopping an instance**

    - instance is powered off
    - EBS data is **preserved**

- **Starting an instance**

    - the same EBS disk is reattached
    - files are still there

- **Terminating an instance**

    - instance is permanently deleted
    - root EBS volume is **deleted by default**
    - data is lost and cannot be recovered

---

## How EBS Is Configured at Launch

EBS is configured when launching an instance using
`--block-device-mappings`.

Example:

```bash
aws ec2 run-instances \
  --region us-east-1 \
  --image-id ${AMI_ID} \
  --instance-type t3.small \
  --key-name banglab-key \
  --security-groups banglab-ssh \
  --block-device-mappings '[
    {
      "DeviceName": "/dev/sda1",
      "Ebs": {
        "VolumeSize": 30,
        "VolumeType": "gp3",
        "DeleteOnTermination": true
      }
    }
  ]' \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cpu-test}]'
```

Only the storage-related fields are explained below.

---

### `VolumeSize`

```json
"VolumeSize": 30
```

* Disk size in **GB**
* Increase this for datasets, checkpoints, or large models
* This is the most common adjustment users make

---

### `VolumeType`

```json
"VolumeType": "gp3"
```

* General-purpose SSD
* Suitable for almost all research workloads
* Default and recommended

---

### `DeleteOnTermination`

```json
"DeleteOnTermination": true
```

* Controls whether the disk is deleted when the instance is terminated

Behavior:

* `true` → disk is deleted (default)
* `false` → disk is preserved after termination

For temporary experiments, keep this as `true`.

---

## Recommended Usage Pattern

* Use **EBS** for:

    * active experiments
    * datasets in use
    * checkpoints and intermediate results

* Use **S3** for:

    * backups
    * long-term storage
    * sharing data across machines
