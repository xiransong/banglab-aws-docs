# EC2 Workflow Toolbox

BangLab maintains a small command-line toolbox for EC2 and EBS research
workflows:

[https://github.com/xiransong/banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools)

Use that repo for the practical steps. It wraps AWS CLI commands in stable
`make` targets and applies the required BangLab ownership tags.

---

## Supported Workflows

The toolbox currently covers:

- local AWS CLI SSO setup and identity verification
- SSH key pair and security group setup
- EC2 instance launch, status, stop, start, reboot, and terminate
- persistent EBS volume creation, attach, one-time setup, and daily mount
- GitHub SSH key and dotfile persistence on EBS
- micromamba installation on EBS

---

## Suggested Reading Order

After finishing AWS Access Portal login in this docs site, continue in [banglab-aws-tools](https://github.com/xiransong/banglab-aws-tools):

1. `docs/prerequisites.md`
2. `docs/local-machine-setup.md`
3. `docs/ssh-access-setup.md`
4. `docs/ec2-instance-lifecycle.md`
5. `docs/persistent-ebs.md`

---

## CLI and AWS Console

The recommended pattern is:

- use `banglab-aws-tools` commands for reproducible setup and lifecycle actions
- use the AWS Console to review status, inspect tags, copy public IP addresses,
  and perform simple manual actions on resources you own

The Console is useful for checking what exists. The toolbox is the source of
truth for the lab-supported command workflow.
