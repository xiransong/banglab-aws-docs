# AWS Access Portal Login

This page explains how to **log in to AWS for the first time** using
BangLab’s AWS access portal:

[https://banglab-udem-mila.awsapps.com/start](https://banglab-udem-mila.awsapps.com/start)

This step sets up:

- your password,
- multi-factor authentication (MFA),
- and access to the AWS console.

You only need to do this once.

---

## Step 1 — Accept Invitation and Set Up Password & MFA

You will receive an email titled:

**“Invitation to join AWS IAM Identity Center”**

Click **“Accept Invitation”**, then:

- use the username shown in the email,
- set your password,
- configure MFA using your authenticator app.

---

## Step 2 — Log In to the AWS Console

Once password and MFA are set up:

1. Log in to the AWS access portal:  
   https://banglab-udem-mila.awsapps.com/start
2. You will see your **AWS account**
3. Click the **EC2-GPU-Operator** permission set

You will then be redirected to the **AWS Management Console**.

---

## Using the AWS Console

The AWS console is a **general-purpose web interface**
for managing AWS services.

By default, the console does **not** show all services prominently.
The most important tool is the **search bar** at the top of the page.

### Finding Services

Use the search bar to find services by name, for example:

- type `EC2` → open the EC2 dashboard
- type `S3` → open the S3 dashboard

This is the recommended way to navigate the console.

You do not need to memorize where services are located.

### What to Expect

- The console shows only actions allowed by your permission set
- Some buttons or options may be missing or disabled
- This is expected and intentional

At this point, your **web-based AWS access is ready**.
You can view and monitor resources using the console.

---

Once you can log in to the AWS console successfully,
continue to the next page to set up the AWS CLI.
