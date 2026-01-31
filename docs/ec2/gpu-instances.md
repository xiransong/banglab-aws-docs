# GPU Instances

This page explains how launching a **GPU EC2 instance** differs from
launching a CPU instance.

If you have completed the CPU instance lifecycle tutorial,
this page should feel very familiar.

---

## What Is Different from CPU Instances?

Compared to CPU instances, GPU instances differ mainly in:

- **Instance type** (GPU-enabled families)
- **vCPU quota requirement**
- **Cost**

The overall workflow (key pair, AMI, security group, SSH, lifecycle)
is the same.

---

## Instance Type

To use GPUs, you must choose a **GPU-enabled instance type**.

Which instance types are available depends on:

- your AWS region (we use `us-east-1`),
- your approved vCPU quota.

Refer to the official AWS documentation for supported GPU instances:
https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html

---

## vCPU Quota

GPU instances require non-zero vCPU quotas.

If you don't have vCPU quotas yet, ask an administrator for quota increase. 

---

## Launching a GPU Instance

Launching a GPU instance is identical to launching a CPU instance,
except for the instance type.

Example (replace `<GPU_INSTANCE_TYPE>`):

```bash
aws ec2 run-instances \
  --region us-east-1 \
  --image-id ${AMI_ID} \
  --instance-type <GPU_INSTANCE_TYPE> \
  --key-name banglab-key \
  --security-groups banglab-ssh \
  --block-device-mappings '[
    {
      "DeviceName": "/dev/sda1",
      "Ebs": {
        "VolumeSize": 100,
        "VolumeType": "gp3",
        "DeleteOnTermination": true
      }
    }
  ]' \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=gpu-test}]'
```

---

## Instance Price Calculation

Before launching a GPU instance, it is strongly recommended to
**check the hourly price** using the AWS Pricing Calculator.

AWS provides an official pricing tool for this purpose:
[https://calculator.aws](https://calculator.aws)

---

### How to Estimate GPU Instance Cost

Follow these steps in the browser:

1. Open **AWS Pricing Calculator**
2. Click **Create estimate**
3. Choose **Region**: `us-east-1`

4. Click **Find service** → select **Amazon EC2**
5. Click **Configure**
6. Search for the instance type you plan to use
   (for example: `g6e.2xlarge`)
7. Keep all other options at their default values
8. Check the **On-Demand hourly cost**

This gives you a reliable estimate of the **per-hour price**
for the instance type.

---

### Notes

* Prices vary significantly between instance types
* GPU instances are billed **per second** while running
* Stopped instances do not incur compute charges
* Storage (EBS) is billed separately

You do not need to memorize prices.
The goal is simply to be **aware of the cost scale**
before launching an instance.
