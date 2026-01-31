# vCPU Quota

This page explains how **vCPU quota** works in BangLab
and how to request an increase when needed.

---

## Initial vCPU Quota

For a newly created AWS account:

- The initial **GPU-related vCPU quota is 0**
- This means GPU EC2 instances cannot be launched immediately
- This is expected and normal

---

## How to Request a vCPU Quota Increase

To request a quota increase:

1. **Researcher**  
   Write a few sentences describing:

   - your research project,
   - why GPU instances are needed,
   - the type of workload you plan to run.

   Send this description to a lab administrator.

2. **Administrator**  
   The administrator will submit a vCPU quota increase request to AWS on your behalf.

   - The **initial request is typically for 8 vCPUs**
   - Larger initial requests are often rejected by AWS

---

## After the Quota Is Approved

Once the initial vCPU quota increase is approved (It may take 1-2 days): 

- Begin using the allocated quota for real workloads
- Run experiments and demonstrate active usage
- Avoid immediately requesting large additional increases

AWS expects **gradual ramp-up** in usage.
Demonstrating steady utilization improves the success
of future quota increase requests.

---

## Summary

- New accounts start with **0 GPU vCPU quota**
- Researchers provide a short justification to an administrator
- Administrators submit quota requests (initially ~8 vCPUs)
- Use the granted quota before requesting more
