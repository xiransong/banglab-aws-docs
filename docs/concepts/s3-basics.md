# S3 Basics

This page introduces **what S3 is and how BangLab uses it**.
It focuses on the core ideas needed to avoid confusion,
not on commands or detailed usage.

---

## 1. What S3 Is

S3 (Simple Storage Service) is **object storage**.

S3 is used to store:

- datasets
- experiment outputs
- model checkpoints
- logs and artifacts

You can think of S3 as:
> “A durable place to store files, not a machine you log into.”

---

## 2. S3 Is *Not* a Filesystem

S3 does **not** behave like a traditional filesystem.

Key differences:

- There is no real directory tree
- Files are stored as **objects**
- “Folders” are just **name prefixes**

---

## 3. Buckets and Objects

S3 data lives inside **buckets**.

Important points about buckets:

- A bucket is a top-level container
- Bucket names must be globally unique
- Buckets belong to a specific AWS account

Inside a bucket:

- Each file is an **object**
- Objects are identified by a **key**
- Keys often look like file paths, but they are just strings

Example:

```
s3://my-bucket/datasets/humanml3d/train.npy
```

---

## Summary

- S3 is **object storage**, not a filesystem
- Data is stored in **buckets** as **objects**
