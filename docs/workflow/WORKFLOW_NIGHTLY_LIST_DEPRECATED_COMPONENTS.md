# List Deprecated Components Workflow

## Overview

This GitHub Actions workflow automatically generates and archives a comprehensive mapping of all deprecated Spark components to their recommended replacements. It runs on a schedule, on every push to main, and can be manually triggered to track deprecation status and help guide migration efforts.

## Workflow File

`.github/workflows/nightly-list-deprecated-components.yml`

## Triggers

The workflow runs automatically in three scenarios:

1. **Push to Main Branch**:
   - Trigger: `push` event
   - Branch: `main`
   - Purpose: Update deprecation list after merges

2. **Daily Schedule**:
   - Trigger: `schedule` with cron expression
   - Time: `0 23 * * *` (11:00 PM UTC daily)
   - Purpose: Regular deprecation tracking

3. **Manual Trigger**:
   - Trigger: `workflow_dispatch`
   - Purpose: On-demand deprecation analysis

## Environment Variables

- `GH_TOKEN`: `${{ github.token }}` - GitHub authentication token (automatically provided)

## Jobs

### list-deprecated-components Job

**Runner**: `ubuntu-latest`

**Purpose**: Execute the deprecated component listing script and upload results as a JSON artifact

**Steps**:

1. **Checkout monorepo**
   - Action: `actions/checkout@v6`
   - Purpose: Clone the monorepo to the runner
   - Result: Full repository available for scanning

2. **List Dependencies structure**
   - Command: `ls -la Dependencies/`
   - Purpose: Verify monorepo structure and log component packages
   - Output: Lists all component directories for debugging

3. **Run deprecated component listing script**
   - Script: `.script/list-deprecated-components.sh`
   - Commands:
     - `chmod +x .script/list-deprecated-components.sh` - Make script executable
     - `./.script/list-deprecated-components.sh` - Execute the script
   - Output: Creates `spark-deprecated-components-listing.json` in workspace

4. **Upload component list artifact**
   - Action: `actions/upload-artifact@v6`
   - Artifact name: `spark-deprecated-components-listing`
   - File: `spark-deprecated-components-listing.json`
   - Retention: 90 days
   - Purpose: Preserve deprecation mapping for download and historical tracking

## Artifact Details

**Name**: `spark-deprecated-components-listing`

**Contents**:
- `spark-deprecated-components-listing.json` - JSON file with deprecation mappings

**Format**:
```json
[
  {
    "deprecated": "SparkUIButton",
    "name": "ButtonUIView"
  },
  {
    "deprecated": "BadgeUIView",
    "name": "BadgeView"
  }
]
```

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
Execute list-deprecated-components.sh
    ↓
Generate spark-deprecated-components-listing.json
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

Run ./.script/list-deprecated-components.sh
Scanning Dependencies directories for deprecated views...
✅ Successfully created spark-deprecated-components-listing.json
   Total deprecated components: 36

Upload artifact
Artifact spark-deprecated-components-listing uploaded successfully
```

## Use Cases

1. **Migration Planning**: Identify which deprecated components need replacement
2. **Documentation**: Generate deprecation notices and migration guides
3. **Code Analysis**: Track deprecation status across the design system
4. **Developer Support**: Help developers find replacement components
5. **Analytics**: Monitor adoption of new components over time
6. **Historical Tracking**: 90-day retention enables trend analysis
7. **Automated Warnings**: Feed data into linters or IDE plugins
8. **Release Notes**: Generate deprecation lists for release documentation

## Monorepo-Specific Features

This workflow has been optimized for the monorepo structure:

**Before (Multi-repo)**:
- Required: Cloning 30+ separate repositories using GitHub CLI
- Process: List repos → Clone each → Scan for deprecations
- Duration: Several minutes due to network operations
- Risks: GitHub API rate limits, authentication failures

**After (Monorepo)**:
- Single checkout: One repository clone
- Local scanning: All components in `Dependencies/`
- Duration: Seconds for complete execution
- Reliability: No external API dependencies

**Benefits**:
- 10x faster execution (seconds vs minutes)
- No GitHub API rate limits
- Simplified workflow configuration
- More reliable execution
- Lower costs (less compute time)

## Artifact Access

### Via GitHub UI

1. Navigate to repository Actions tab
2. Click on "📋 Nightly Get all Deprecated Components" workflow
3. Select a workflow run
4. Scroll to "Artifacts" section
5. Download `spark-deprecated-components-listing`
6. Extract ZIP to access JSON file

### Via GitHub CLI

```bash
# List recent workflow runs
gh run list --workflow=nightly-list-deprecated-components.yml

# Download artifact from specific run
gh run download <run-id> -n spark-deprecated-components-listing

# View JSON content
cat spark-deprecated-components-listing.json | jq .
```

### Via API

```bash
# Get workflow runs
curl -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/org/spark-ios/actions/workflows/nightly-list-deprecated-components.yml/runs

# Download artifact
curl -L -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/org/spark-ios/actions/artifacts/<artifact-id>/zip
```

## JSON Processing Examples

### Using jq

```bash
# Count deprecated components
cat spark-deprecated-components-listing.json | jq 'length'

# List all deprecated component names
cat spark-deprecated-components-listing.json | jq '.[].deprecated'

# Find replacement for specific component
cat spark-deprecated-components-listing.json | \
  jq '.[] | select(.deprecated == "SparkUIButton") | .name'

# Group by replacement component
cat spark-deprecated-components-listing.json | \
  jq 'group_by(.name) | map({name: .[0].name, deprecated: map(.deprecated)})'
```

### Using Python

```python
import json

with open('spark-deprecated-components-listing.json') as f:
    deprecations = json.load(f)

# Find what replaces a deprecated component
for item in deprecations:
    if item['deprecated'] == 'SparkUIButton':
        print(f"Replace with: {item['name']}")

# Create migration map
migration_map = {d['deprecated']: d['name'] for d in deprecations}
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

**Rationale**: Daily execution ensures deprecation tracking stays current as new deprecations are added or old ones are removed.

## Performance

**Typical Execution Time**: 20-35 seconds

**Breakdown**:
- Checkout: 5-10 seconds
- Listing: 2-5 seconds
- Script execution: 8-15 seconds (more complex than component listing)
- Upload: 2-5 seconds

## Integration Opportunities

The JSON output can be integrated with:

1. **Documentation Sites**: Auto-generate migration guides
2. **IDE Plugins**: Show inline deprecation warnings with replacements
3. **Linters**: Add custom rules to flag deprecated component usage
4. **CI/CD**: Fail builds that introduce new usage of deprecated components
5. **Migration Tools**: Automated code refactoring scripts
6. **Dashboards**: Visualize deprecation trends over time

## Notes

- The workflow runs on Linux (Ubuntu) for faster execution and cost efficiency
- Swift/Xcode not required as the script uses standard Unix tools (grep, sed)
- JSON format enables easy parsing and integration with other tools
- Artifact retention of 90 days balances storage costs with historical tracking needs
- The workflow does not require any secrets beyond the default `GITHUB_TOKEN`
- Multiple concurrent runs are allowed (no concurrency limits)
- Empty deprecation list (no deprecated components) produces valid empty JSON array: `[]`

## Related Files

- `.script/list-deprecated-components.sh` - The script executed by this workflow
- `docs/script/SCRIPT_LIST_DEPRECATED_COMPONENTS.md` - Documentation for the script
- `.github/workflows/nightly-list-components.yml` - Related workflow for all components

## Troubleshooting

**Issue**: Workflow fails with "Permission denied"
- **Cause**: Script not executable
- **Solution**: The workflow includes `chmod +x` to fix this automatically

**Issue**: Invalid JSON generated
- **Cause**: Script error or no deprecations found
- **Solution**: Check script logs; empty array `[]` is valid JSON

**Issue**: Missing deprecations
- **Cause**: Incorrect `@available` annotation format
- **Solution**: Verify deprecation messages follow "Use ComponentName" pattern

**Issue**: Artifact not uploaded
- **Cause**: Script didn't generate output file
- **Solution**: Check script logs for errors in the "Run deprecated component listing script" step

## Best Practices

1. **Regular Review**: Weekly review of the JSON file to prioritize migration work
2. **Communication**: Share artifact with team to coordinate deprecation removals
3. **Documentation**: Keep migration guides in sync with the JSON mappings
4. **Cleanup**: Plan removal of deprecated components based on usage analytics
5. **Testing**: Verify replacement components before deprecating old ones

## Continuous Improvement

The workflow can be enhanced with:
- Comparison with previous runs to detect newly deprecated or removed components
- Automatic PR creation when deprecation count exceeds threshold
- Slack/email notifications when new deprecations are added
- Integration with usage analytics to prioritize migration efforts
- Generation of migration guides from the JSON data
- Automated testing to ensure all replacements work correctly
