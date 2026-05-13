# How to deploy with github pages

make build-strict

mkdocs gh-deploy --strict --clean --remote-name origin --remote-branch gh-pages

What this does:

- builds the MkDocs site locally
- commits the generated static HTML to gh-pages
- pushes gh-pages to GitHub
- leaves your main branch as the source/docs branch

After that, check GitHub repo settings once:

GitHub repo -> Settings -> Pages

Use:

- Source: Deploy from a branch
- Branch: gh-pages
- Folder: / root

Then the site should be available at:

https://xiransong.github.io/banglab-aws-docs/
