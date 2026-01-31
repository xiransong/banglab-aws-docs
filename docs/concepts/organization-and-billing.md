# Organization and Billing

This page explains **how billing and ownership work in BangLab’s AWS setup**.
You do **not** need to manage billing yourself, but understanding the structure
will help everything make more sense. 

---

## AWS Organization

BangLab uses an **AWS Organization** to manage cloud resources centrally.

An AWS Organization:

- groups multiple AWS accounts together
- centralizes billing and credits
- allows consistent access control across accounts

---

## Management Account vs. Member Accounts

Within an AWS Organization, there are two kinds of accounts.

### Management Account

The **management account** (bangliu):

- is owned by the advisor
- holds the **AWS credits**
- receives the consolidated bill
- controls organization-wide settings

Only administrators operate directly in this account.

---

### Member Accounts (Research Accounts)

Most lab users work in **member accounts**.

These accounts:

- **do not require personal payment methods**
- **inherit billing and credits from the management account**
- do not see full organization-wide billing details
- contain EC2 instances, S3 buckets, and other research resources

As a researcher, this is where you will run experiments.
