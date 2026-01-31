# S3 Basics

This page introduces **what S3 is and how BangLab uses it**.
It focuses on the core ideas needed to avoid confusion. 

---

## What S3 Is

S3 (Simple Storage Service) is **object storage**.

Key characteristics:

- data is stored as **objects**, not files,
- objects live inside **buckets**,
- “Folders” are just **name prefixes**

---

## What S3 Is *Not*

S3 is **not a filesystem**.

In particular:

- there is no true directory hierarchy,
- objects cannot be appended to (an upload replaces the object),
- latency is higher than EC2 disks.

Because of this, S3 is **not suitable for**:

- frequent small writes,
- line-by-line logging,
- scratch space during training.

