# S3 Overview

This section introduces how BangLab uses S3 for data storage.

S3 is used as **long-term, durable storage** for:

- datasets,
- experiment outputs,
- checkpoints and artifacts.

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

---

## What Comes Next

The next page walks through a **typical S3 workflow**:

- creating a bucket,
- transferring data between S3 and your laptop,
- transferring data between S3 and EC2 instances.

Once you understand this workflow, 
you will be able to use S3 effectively for most research tasks.
