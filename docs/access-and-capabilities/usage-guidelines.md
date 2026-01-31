# Lab Usage Guidelines

AWS resources are **shared lab infrastructure**. 

The following guidelines help:

- keep costs under control,
- maintain clarity within each account,
- and ensure smooth operation across the lab.

These are standard expectations for responsible use of cloud resources.

---

## EC2 Usage

- **Terminate instances when you are done**  
  Running instances consume budget and quota.

- **Do not leave idle instances running**  
  If an instance is not actively doing work, stop or terminate it.

- **Use the smallest instance that meets your needs**  
  Larger instances consume more quota and cost more.

---

## Tagging (Optional but recommended)

Even though each lab member has a **separate AWS account**,
tagging EC2 instances is still recommended.

Tags help you:

- distinguish different projects or experiments,
- understand where costs come from within your account.

Recommended minimal tags:

- `Project` (e.g. `LLM-skill`, `HumanMotion`)
- `Purpose` (e.g. `debug`, `training`)

Tags are lightweight and low-risk, but very helpful.

---

## GPU & Quota Awareness

- GPU capacity is limited and shared at the lab level
- vCPU quotas apply per account

---

## S3 Usage

- Use S3 for **datasets and experiment outputs**, not scratch space
- Avoid high-frequency, small-file updates
- Clean up unused buckets and data when no longer needed

---

## Cost Awareness

- You do **not** pay personally for AWS usage
- All usage consumes **shared lab credits**

---

## When in Doubt

If you are unsure whether a workflow is appropriate:
- check the documentation,
- or ask an administrator before proceeding.
