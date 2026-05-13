# Onboarding

This section explains how to **get started with AWS as a BangLab researcher**.

---

## Prerequisites

Before starting, make sure you have:

- **Sent your email address to an administrator** (current administrator: Xiran Song)
  Note that the email address **must not be linked to an existing AWS account**.  
  Using a `+aws-banglab` alias is recommended, for example:

```
alice+aws-banglab@umontreal.ca
```

- **An MFA app installed on your phone**  
For example: Duo Mobile, Google Authenticator, or similar.

- **AWS CLI v2 installed on your local machine**
(macOS, Linux, or Windows)  
[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

---

## Onboarding Flow

Onboarding consists of three main steps:

1. **Set up AWS access portal login (SSO login)**

    - Create your password 
    - Configure MFA 
    - Log in via the BangLab AWS access portal:  
   [https://banglab-udem-mila.awsapps.com/start](https://banglab-udem-mila.awsapps.com/start)

2. **Set up AWS CLI**

    - Install AWS CLI v2 on your local machine
    - Use [banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools) to configure SSO and verify command-line access

3. **Request vCPU quota (if needed)** 

    - New accounts often start with zero vCPU quota for GPU instances and a small number of vCPU quota for CPU instances
    - An administrator can submit a quota increase request

Each step is described in detail on the following pages.
