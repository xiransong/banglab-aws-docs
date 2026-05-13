# EC2 Guidance

This section explains how BangLab uses **EC2 instances** for research
workflows.

The practical command workflow lives in the companion toolbox:

[banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools)

Use this docs site for concepts, recommended choices, and policy expectations.
Use the tools repo for repeatable commands.

---

## Recommended Workflow

For most lab members:

1. Complete onboarding in this docs site.
2. Read the resource ownership rules.
3. Review the recommended AMI and instance types.
4. Use `banglab-aws-tools` for:
   - local AWS CLI setup
   - SSH key pair and security group setup
   - EC2 launch, status, stop, start, reboot, and terminate
   - persistent EBS create, attach, setup, and mount

---

## What This Section Covers

- [Recommended AMI and EC2 Instance Types](recommended-ami-and-instance.md)
- [EC2 Workflow Toolbox](cpu-instance-lifecycle.md)
- [EBS Basics](ebs-basics.md)
- [GPU Instances](gpu-instances.md)

The older raw AWS CLI examples have been retired from this section. The
toolbox is easier to follow and applies the required BangLab tags consistently.
