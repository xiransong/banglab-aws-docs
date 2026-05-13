# Recommended AMI and EC2 Instance Types

This guide helps lab members choose the recommended AMI and EC2 instance type. This guide focuses on **On-Demand EC2 instances**. 

For practical launch commands, use the instance recipes in
[`banglab-aws-tools`](https://github.com/xiransong/banglab-aws-tools).

## Recommended AMI

We recommend using the following AMI for both GPU instances and x86 CPU instances:

```text
Deep Learning Base AMI with Single CUDA (Ubuntu 22.04) 20260130
AMI ID: ami-0252d9c82e6b8fa85
```

### Why this AMI?

This AMI provides a convenient Ubuntu 22.04 environment with common deep-learning system dependencies preinstalled, including CUDA, NVIDIA drivers, Docker-related tooling, AWS CLI, and other useful packages.

Although this AMI is mainly intended for GPU instances, it can also be used on x86 CPU instances such as `m7i-flex`, `m7i`, `c7a`, and `r7i`.

On CPU-only instances, GPU commands such as: `nvidia-smi` may fail or show no GPU device. This is expected because no GPU is attached.

### Important: do not use this AMI for ARM/Graviton instances

This AMI is for x86_64 instances. Do not use it with ARM/Graviton instance families such as:

```text
t4g, m7g, m8g, c7g, r7g
```

For simplicity and compatibility with most ML/Docker research workflows, we recommend using x86 instances unless you specifically know that you need ARM64.

---

## Recommended CPU instances

For light CPU-based development, start with `m7i-flex.xlarge`. Move to
`m7i-flex.2xlarge` or larger when your workflow needs more CPU or memory.

`banglab-aws-tools` includes a starter recipe for `m7i-flex.xlarge`.

| Category                               | Recommended instance | vCPUs |     RAM (GiB) | When to use                                                                                        |
| -------------------------------------- | -------------------: | ----: | ------: | -------------------------------------------------------------------------------------------------- |
| **Light CPU/dev instance**             |    `m7i-flex.xlarge` |     4 |  16 | Light VSCode Remote, LaTeX writing, small scripts, quick repo debugging                            |
| **Default CPU/dev instance**           |   `m7i-flex.2xlarge` |     8 |  32 | Recommended default for repo development, Docker builds, LaTeX, small/medium preprocessing         |
| **Heavy all-purpose CPU/dev instance** |   `m7i-flex.4xlarge` |    16 |  64 | Larger Docker builds, heavier dataset processing, running several tools at once                    |
| **Sustained CPU-heavy worker**         |        `c7a.2xlarge` |     8 |  16 | CPU-bound jobs where RAM is not the bottleneck; batch scripts, compression, parallel preprocessing |
| **Larger sustained CPU-heavy worker**  |        `c7a.4xlarge` |    16 |  32 | Longer CPU-heavy jobs; good when many cores matter more than memory                                |
| **Predictable balanced worker**        |        `m7i.4xlarge` |    16 |  64 | Sustained CPU jobs that also need decent RAM; safer than `m7i-flex` for long high-CPU runs         |
| **Memory-heavy preprocessing**         |        `r7i.2xlarge` |     8 |  64 | Large NumPy arrays, dataset loading, preprocessing where RAM is the main bottleneck                |
| **Larger memory-heavy preprocessing**  |        `r7i.4xlarge` |    16 | 128 | Large in-memory datasets, many preprocessing workers, memory-intensive pipelines                   |

For more CPU instance options, see:

[https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cpu-options-supported-instances-values.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/cpu-options-supported-instances-values.html)

---

## Recommended GPU instances

GPU instances should be used only when actual GPU computation is needed, such as model training, GPU inference, rendering, or CUDA-based experiments.

`banglab-aws-tools` includes a starter recipe for `g4dn.xlarge`.

| GPU | instance | vCPUs | CPU RAM (GiB)  | GPU RAM (GB) |
|---|---:|---:|---:|---:|
| 1 × NVIDIA T4 | `g4dn.xlarge` | 4 | 16 | 16 |
| 1 × NVIDIA T4 | `g4dn.2xlarge` | 8 | 32 | 16 |
| 1 × NVIDIA T4 | `g4dn.4xlarge` | 16 | 64 | 16 |
| 1 × NVIDIA L4 | `g6.xlarge` | 4 | 16 | 24 |
| 1 × NVIDIA L4 | `g6.2xlarge` | 8 | 32 | 24 |
| 1 × NVIDIA L4 | `g6.4xlarge` | 16 | 64 | 24 |
| 1 × NVIDIA L40S | `g6e.xlarge` | 4 | 32 | 48 |
| 1 × NVIDIA L40S | `g6e.2xlarge` | 8 | 64 | 48 |
| 1 × NVIDIA L40S | `g6e.4xlarge` | 16 | 128 | 48 |

For more GPU instance options, see:

[https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html](https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html)

---

## EC2 quota requirements

EC2 quotas are counted in **vCPUs**, not just number of instances. For example, launching one `m7i-flex.2xlarge` uses 8 vCPUs.

### CPU instance quota

To run the CPU instances listed above, your account needs quota under:

```text
Quota name: Running On-Demand Standard (A, C, D, H, I, M, R, T, Z) instances
```

For new lab accounts, the default value may be small, often around 5 vCPUs. This is enough for small instances, but not enough for many of the recommended development instances.

If you see a quota error when launching a CPU instance, ask a lab administrator to request a quota increase for `Running On-Demand Standard (A, C, D, H, I, M, R, T, Z) instances`.

### GPU instance quota

To run G-family GPU instances, your account needs quota under:

```text
Quota name: Running On-Demand G and VT instances
```

If you see a quota error when launching a GPU instance, ask a lab administrator to request a quota increase for `Running On-Demand G and VT instances`.
