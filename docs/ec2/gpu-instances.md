# GPU Instances

GPU instances are EC2 instances with attached GPUs. They are useful for model
training, GPU inference, rendering, and CUDA-based experiments.

The day-to-day launch workflow is handled by:

[banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools)

Use this page to understand what changes when you choose a GPU instance.

---

## What Is Different from CPU Instances?

Compared to CPU instances, GPU instances differ mainly in:

- **instance type**: use GPU families such as `g4dn`, `g6`, or `g6e`
- **quota**: GPU instances require quota under `Running On-Demand G and VT instances`
- **cost**: GPU instances cost more per hour than CPU development instances
- **drivers**: use a Deep Learning AMI when you want CUDA/NVIDIA tooling ready

The ownership rule is the same: the instance and its root EBS volume must use
`Owner=<username>`.

---

## Recommended Starting Point

For a first GPU instance, start small:

```text
Instance type: g4dn.xlarge
GPU: 1 x NVIDIA T4
GPU memory: 16 GB
```

For the recommended AMI and a broader instance table, see:

[Recommended AMI and EC2 Instance Types](recommended-ami-and-instance.md)

---

## Launch Workflow

Use the GPU recipe in `banglab-aws-tools`:

```bash
make launch-instance INSTANCE_NAME=gpu INSTANCE_CONFIG=instances/g4dn-xlarge.env
make configure-ssh INSTANCE_NAME=gpu
ssh ec2
```

The toolbox applies the required `Owner` and `Name` tags to the instance and
root EBS volume, and reuses your owner-tagged key pair and security group.

---

## Quota Awareness

If launch fails with a quota error, ask a lab administrator to request a quota
increase for:

```text
Running On-Demand G and VT instances
```

EC2 quotas are counted in vCPUs. For example, `g4dn.xlarge` uses 4 vCPUs.

---

## Cost Awareness

Before launching larger GPU instances, estimate the hourly cost using the AWS
Pricing Calculator:

[https://calculator.aws](https://calculator.aws)

GPU instances are billed while running. Stop or terminate idle instances, and
remember that EBS storage can continue to cost money after an instance stops.
