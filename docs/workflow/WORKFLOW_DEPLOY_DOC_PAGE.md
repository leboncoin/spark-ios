# Deploy DocC on GitHub Pages Workflow

## Overview

This GitHub Actions workflow generates and deploys DocC documentation for the entire Spark iOS monorepo to GitHub Pages, making the documentation publicly accessible online. It consolidates documentation from all components in the `Modules/` folder into a single unified documentation site.

## Workflow File

`.github/workflows/deploy-doc-page.yml`

## Triggers

This workflow runs automatically and manually:

1. **Release Published**: `release` (`types: [published]`)
   - Trigger: Automatically runs when a GitHub release is published
   - Purpose: Keep the public documentation aligned with the latest released version
   - Pushes to `main` no longer deploy the documentation

2. **Manual Trigger**: `workflow_dispatch`
   - Can be manually triggered from the GitHub Actions tab
   - Navigate to Actions → "📑 Deploy Documentation" → "Run workflow"
   - Useful for deploying documentation without publishing a release
   - Requires appropriate repository permissions

## Environment Variables

- `repo_name`: `${{ github.event.repository.name }}` - Repository name (automatically set)
- `doc_path`: `docs` - Output path for generated documentation

## Permissions

The workflow requires specific GitHub token permissions:
- `contents: read` - Read repository contents
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Write ID tokens for deployment

## Concurrency

- **Group**: `pages` - Only one deployment can run at a time
- **Cancel in progress**: `true` - New deployments cancel ongoing ones

## Jobs

### Deploy Job

**Name**: deploy
**Runner**: macos-26
**Environment**: github-pages

**Steps**:

1. **Package names** - Logs the repository name
2. **Checkout Action** - Checks out the repository using `actions/checkout@v6`
3. **Get sourcery** - Installs Sourcery via `brew install sourcery` (required to generate code before building the documentation)
4. **Create docs directory** - Creates the output directory for documentation
5. **Build DocC** - Executes `make docc` with:
   - `DOCC_OUTPUT_PATH=${{ env.doc_path }}` - Output directory
   - `HOSTING_BASE_PATH=${{ env.repo_name }}` - Base path for hosted documentation
6. **Setup Pages** - Configures GitHub Pages using `actions/configure-pages@v5`
7. **Upload artifact** - Uploads the documentation as an artifact using `actions/upload-pages-artifact@v3`
8. **Deploy to GitHub Pages** - Deploys the artifact to GitHub Pages using `actions/deploy-pages@v5`

**Output**:
- `page_url` - The URL where the documentation is deployed (available via `${{ steps.deployment.outputs.page_url }}`)

## Notes

- Only one deployment can run at a time due to concurrency settings
- New deployments will automatically cancel any in-progress deployments
- The documentation will be accessible at the GitHub Pages URL after successful deployment
- The workflow uses macOS runners as DocC is an Apple technology requiring Xcode
- Documentation is built from all components in `Modules/` folder

## Usage

This workflow runs on each published release. Trigger it manually when you want to deploy between releases, for example to:
- Update the public documentation after significant changes
- Publish new component documentation
- Refresh the DocC documentation website
- Deploy documentation after component additions or updates
- Update documentation after API changes across components

## Related Files

- `Makefile` - Contains the `docc` target for building documentation

## GitHub Pages Setup

For this workflow to function, GitHub Pages must be configured in the repository settings:
1. Go to repository Settings > Pages
2. Set Source to "GitHub Actions"
3. The workflow will handle the deployment automatically
