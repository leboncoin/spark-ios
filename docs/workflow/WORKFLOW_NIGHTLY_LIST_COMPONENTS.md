# List Components Workflow

## Overview

This GitHub Actions workflow automatically generates and archives a comprehensive list of all Spark components in the monorepo. It runs on a schedule, on every push to main, and can be manually triggered to track component inventory over time.

## Workflow File

`.github/workflows/nightly-list-components.yml`

## Triggers

The workflow runs automatically in three scenarios:

1. **Push to Main Branch**:
   - Trigger: `push` event
   - Branch: `main`
   - Purpose: Update component list after merges

2. **Daily Schedule**:
   - Trigger: `schedule` with cron expression
   - Time: `0 23 * * *` (11:00 PM UTC daily)
   - Purpose: Regular inventory updates

3. **Manual Trigger**:
   - Trigger: `workflow_dispatch`
   - Purpose: On-demand component listing

## Environment Variables

- `GH_TOKEN`: `${{ github.token }}` - GitHub authentication token (automatically provided)

## Jobs

### list-components Job

**Runner**: `ubuntu-latest`

**Purpose**: Execute the component listing script and upload results as an artifact

**Steps**:

1. **Checkout monorepo**
   - Action: `actions/checkout@v6`
   - Purpose: Clone the monorepo to the runner
   - Result: Full repository available for scanning

2. **List Dependencies structure**
   - Command: `ls -la Dependencies/`
   - Purpose: Verify monorepo structure and log component packages
   - Output: Lists all component directories for debugging

3. **Run component listing script**
   - Script: `.script/list-components.sh`
   - Commands:
     - `chmod +x .script/list-components.sh` - Make script executable
     - `./.script/list-components.sh` - Execute the script
   - Output: Creates `spark-components-listing.txt` in workspace

4. **Upload component list artifact**
   - Action: `actions/upload-artifact@v6`
   - Artifact name: `spark-components-listing`
   - File: `spark-components-listing.txt`
   - Retention: 90 days
   - Purpose: Preserve component list for download and historical tracking

## Artifact Details

**Name**: `spark-components-listing`

**Contents**:
- `spark-components-listing.txt` - Text file with one component name per line

**Retention**: 90 days (configurable)

**Access**: Available in the workflow run summary under "Artifacts"

## Workflow Execution Flow

```
Trigger (push/schedule/manual)
    ↓
Checkout Monorepo
    ↓
Verify Dependencies Structure
    ↓
Execute list-components.sh
    ↓
Generate spark-components-listing.txt
    ↓
Upload as Artifact (90-day retention)
    ↓
Workflow Complete
```

## Output Examples

**Workflow Console Output**:
```
Run ls -la Dependencies/
total 0
drwxr-xr-x  35 runner staff  1120 Dependencies
drwxr-xr-x  18 runner staff   576 Common
drwxr-xr-x  18 runner staff   576 Theming
drwxr-xr-x  18 runner staff   576 ComponentAvatar
...

Run ./.script/list-components.sh
Scanning Dependencies directories for components in Sources/Core...
✅ Successfully created spark-components-listing.txt
   Total components: 120

Upload artifact
Artifact spark-components-listing uploaded successfully
```

## Use Cases

1. **Component Inventory**: Automatic tracking of all components in the design system
2. **Historical Tracking**: 90-day artifact retention enables trend analysis
3. **Documentation**: Generate component lists for external documentation
4. **Validation**: Verify components after major refactors or migrations
5. **Analytics**: Monitor design system growth and component count over time
6. **Auditing**: Regular snapshots of component availability

## Monorepo-Specific Features

This workflow has been optimized for the monorepo structure:

**Before (Multi-repo)**:
- Required: Cloning 30+ separate repositories
- Used: GitHub CLI to list and clone repos
- Duration: Several minutes due to network operations

**After (Monorepo)**:
- Single checkout: One repository clone
- Local scanning: All components in `Dependencies/`
- Duration: Seconds for complete execution

**Benefits**:
- Faster execution (seconds vs minutes)
- No GitHub API rate limits
- No authentication issues with multiple repos
- Simpler workflow configuration

## Artifact Access

### Via GitHub UI

1. Navigate to repository Actions tab
2. Click on "📋 Nightly Get all Components" workflow
3. Select a workflow run
4. Scroll to "Artifacts" section
5. Download `spark-components-listing`

### Via GitHub CLI

```bash
# List recent workflow runs
gh run list --workflow=nightly-list-components.yml

# Download artifact from specific run
gh run download <run-id> -n spark-components-listing
```

### Via API

```bash
# Get workflow runs
curl -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/org/spark-ios/actions/workflows/nightly-list-components.yml/runs

# Download artifact
curl -L -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/org/spark-ios/actions/artifacts/<artifact-id>/zip
```

## Schedule Details

**Cron Expression**: `0 23 * * *`

**Breakdown**:
- `0` - Minute: 0 (on the hour)
- `23` - Hour: 23 (11 PM UTC)
- `*` - Day of month: Every day
- `*` - Month: Every month
- `*` - Day of week: Every day of the week

**Time Zones**:
- UTC: 11:00 PM
- PST: 3:00 PM
- EST: 6:00 PM
- CET: 12:00 AM (midnight, next day)

## Performance

**Typical Execution Time**: 15-30 seconds

**Breakdown**:
- Checkout: 5-10 seconds
- Listing: 2-5 seconds
- Script execution: 5-10 seconds
- Upload: 2-5 seconds

## Notes

- The workflow runs on Linux (Ubuntu) for faster execution and cost efficiency
- Swift/Xcode not required as the script uses standard Unix tools
- Artifact retention of 90 days balances storage costs with historical tracking needs
- The workflow does not require any secrets beyond the default `GITHUB_TOKEN`
- Multiple concurrent runs are allowed (no concurrency limits)

## Related Files

- `.script/list-components.sh` - The script executed by this workflow
- `docs/script/SCRIPT_LIST_COMPONENTS.md` - Documentation for the script
- `.github/workflows/nightly-list-deprecated-components.yml` - Related workflow for deprecated components

## Troubleshooting

**Issue**: Workflow fails with "Permission denied"
- **Cause**: Script not executable
- **Solution**: The workflow includes `chmod +x` to fix this automatically

**Issue**: No components found
- **Cause**: Incorrect directory structure
- **Solution**: Verify `Dependencies/*/Sources/Core` exists with the "List Dependencies structure" step

**Issue**: Artifact not uploaded
- **Cause**: Script didn't generate output file
- **Solution**: Check script logs for errors in the "Run component listing script" step

## Continuous Improvement

The workflow can be enhanced with:
- Comparison with previous runs to detect additions/removals
- Automatic PR creation when component count changes significantly
- Integration with documentation generation workflows
- Notifications on component inventory changes
