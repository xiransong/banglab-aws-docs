# S3 Workflow

This page walks through a **typical S3 workflow in BangLab**.

We use:

- the **AWS console** for one-time setup (bucket creation),
- the **AWS CLI** for day-to-day data transfer.

The same CLI commands work on:

- your local laptop,
- EC2 instances.

---

## Prerequisites

Before starting, make sure you have:

- completed **Onboarding**,
- authenticated to AWS console and AWS CLI (as EC2-GPU-Operator)

All examples assume:

- region: `us-east-1`.

---

## Step 1 — Create a Bucket (Browser, One-Time)

Buckets are typically created **once**, using the AWS console.

### Create a Bucket

1. Open the AWS console
2. Choose **Region**: `us-east-1`
3. Go to **S3**
4. Click **Create bucket**
5. Choose a **globally unique bucket name**, for example: `<your name>-scratch`
6. It is recommend to enable Bucket Versioning
6. Leave other settings at their default values
7. Click **Create bucket**

---

## Step 2 — Transfer Data Between Laptop and S3

Day-to-day S3 usage is done via the **AWS CLI**.

### List Buckets

```bash
aws s3 ls
```

### Upload a File (Laptop → S3)

```bash
aws s3 cp local_file.txt s3://your-bucket-name/path-you-defined/
```

You can upload files to any path in a bucket; S3 will create the path automatically since directories are logical prefixes, not real folders.

### Upload a Directory (Recursive)

```bash
aws s3 cp local_folder/ s3://your-bucket-name/local_folder/ --recursive
```

### Download a File (S3 → Laptop)

```bash
aws s3 cp s3://your-bucket-name/local_file.txt .
```

### Sync a Directory

```bash
aws s3 sync local_folder/ s3://your-bucket-name/local_folder/
```

`sync` is useful when:

* updating datasets,
* resuming interrupted transfers,
* avoiding unnecessary re-uploads.

---

## Step 3 — Transfer Data Between EC2 and S3

### AWS CLI on EC2 (Required)

To access S3 from an EC2 instance, the **AWS CLI must be installed on that instance**.

On many official AMIs, the AWS CLI is already installed.
You can check by running:

```bash
aws --version
```

If the command is not found, install the AWS CLI before continuing.

For Ubuntu-based instances (e.g. Ubuntu 22.04):

```bash
sudo apt update
sudo apt install -y awscli
```

Once the AWS CLI is available, you can use the same
`aws s3` commands on EC2 as on your local machine.
The **same AWS CLI commands** work on EC2 instances.

### On the EC2 Instance

After SSH-ing into your EC2 instance:

```bash
aws s3 ls
```

If this works, the instance has access to S3.

### Download Data (S3 → EC2)

```bash
aws s3 sync s3://your-bucket-name/datasets/ ~/datasets/
```

### Upload Results (EC2 → S3)

```bash
aws s3 sync ~/experiments/ s3://your-bucket-name/experiments/
```

This pattern is commonly used to:

* download datasets before training,
* upload results after experiments finish.

---

## Recommended Usage Pattern

A common and safe workflow is:

1. Run experiments **on EC2**
2. Write logs and outputs to **EBS (EC2 disk)**
3. Upload finalized results to **S3**
4. Download data elsewhere when needed

Avoid writing to S3 at very high frequency during training.
