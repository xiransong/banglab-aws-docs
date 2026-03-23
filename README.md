# BangLab AWS Docs

This repository contains the documentation site for **BangLab AWS usage**, including
account access, onboarding steps, and practical guides for using AWS EC2 and S3
within the lab.

## Local Preview

From the repository root:

```bash
make doctor
make serve
```

Then open:

```text
http://127.0.0.1:8000
```

Useful commands:

- `make help` shows all available targets
- `make serve` starts a local preview server
- `make serve-public` exposes the preview on your local network
- `make build` generates the static site in `site/`
- `make build-strict` builds with warnings treated as errors
- `make dist` builds the site and packages it as `banglab-aws-docs-site.zip`
- `make clean` removes the generated `site/` directory

If `mkdocs` is installed through `pyenv` but not visible to `make`, you can run:

```bash
make MKDOCS="$HOME/.pyenv/shims/mkdocs" serve
```

## Private Distribution Workflow

For private lab distribution, the recommended approach is:

```bash
make dist
```

This creates:

- `banglab-aws-docs-site.zip`

Upload that zip file to Google Drive and let lab mates download it.

## Reader Instructions

For lab mates who only want to read the docs locally:

1. Download and unzip `banglab-aws-docs-site.zip`
2. Open a terminal in the unzipped folder
3. Run:

```bash
python3 -m http.server 8000
```

4. Open:

```text
http://127.0.0.1:8000
```

This is preferred over opening `index.html` directly in the browser because a local server is more reliable for static site navigation.
