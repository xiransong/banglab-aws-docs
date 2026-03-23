# AWS CLI Setup

This page explains how to **set up and use the AWS CLI**
with BangLab’s **SSO-based AWS access**.

The AWS CLI allows you to interact with AWS services (EC2, S3, etc.)
from the command line and is required for most research workflows.

---

## What You Need Before Starting

Make sure you have already:

- completed password and MFA setup in the previous step,
- successfully logged in to the AWS access portal,
- installed the AWS CLI on your machine [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

---

## Step 1 — Verify AWS CLI Installation

Open a terminal and run:

```bash
aws --version
```

You should see output similar to:

```
aws-cli/2.x.x Python/3.x ...
```

If the command is not found, install **AWS CLI v2** before continuing.

---

## Step 2 — Configure AWS CLI with SSO

BangLab uses **SSO-based authentication**.

Run:

```bash
aws configure sso
```

You will be prompted for several values.

For some optional prompts, you can press Enter to accept the defaults.

Please set these values: 

* **SSO start URL**: `https://banglab-udem-mila.awsapps.com/start`

* **SSO Region**: `us-east-1`

* **Account**: Select your assigned AWS account

* **Role**: Select `EC2-GPU-Operator`

* **Profile name**: choose a simple name, for example: `banglab`

This profile name will be used in later AWS CLI commands.

The configuration will be stored in `~/.aws/config`.

---

## Step 3 — Authenticate

After configuration, the AWS CLI will prompt you to authenticate.

Typically:

* a browser window will open automatically,
* you will log in using your AWS access portal credentials,
* you may be asked to complete MFA.

Once authentication succeeds, the CLI session becomes active.

---

## Step 4 — Verify CLI Access

After login, run:

```bash
aws sts get-caller-identity --profile banglab
```

You should see output similar to:

```json
{
  "Account": "...",
  "Arn": "arn:aws:sts::...:assumed-role/EC2-GPU-Operator/..."
}
```

This confirms that:

* the CLI is authenticated,
* SSO is working correctly,
* the correct role is assumed.

---

## Common Notes

* CLI credentials are **temporary** (8 hours for EC2-GPU-Operator).
  You may need to re-authenticate periodically.

* You do **not** need to manage access keys.
  SSO handles credential generation and rotation automatically.

* If authentication expires, simply run any AWS CLI command. 
  and follow the login prompt again.

---

Once this step is complete, you are ready to use:

* EC2 from the command line,
* S3 for data transfer,
* automation scripts.

Continue to the next page to handle **vCPU quota requests**, if needed.
