# Spark Tokens Bridge Setup

This document describes how to set up the bridge between the [spark-tokens](https://github.com/leboncoin/spark-tokens/) repository and the spark-ios repository using SSH deploy keys.

## Overview

The spark-tokens repository contains a GitHub Actions workflow (`deliver-icons-to-spark-ios.yml`) that automatically pushes icon updates to the spark-ios repository. This requires proper SSH authentication to be configured.

## Prerequisites

- Admin access to both spark-tokens and spark-ios repositories
- SSH key generation tools (ssh-keygen)
- Access to GitHub repository settings

## Setup Options

### SSH key

#### Option 1: Regenerate the SSH Deploy Key (Recommended)

This is the recommended approach when setting up a new bridge or if the existing key has been compromised or lost.

##### Step 1: Generate a New SSH Key Pair

```bash
$ ssh-keygen -t ed25519 -f spark-ios-deploy-key -C "spark-tokens-deploy"
```

This will create two files:
- `spark-ios-deploy-key` (private key)
- `spark-ios-deploy-key.pub` (public key)

**Note:** Do not set a passphrase when prompted, as this key will be used by automated processes.

##### Step 2: Add the Public Key as a Deploy Key to spark-ios

1. Navigate to the spark-ios repository on GitHub
2. Go to **Settings** → **Deploy keys**
3. Click **Add deploy key**
4. Set a title (e.g., "spark-tokens deploy key")
5. Paste the contents of `spark-ios-deploy-key.pub`
6. **Important:** Enable "Allow write access" checkbox
7. Click **Add key**

##### Step 3: Add the Private Key as a Secret to spark-tokens

1. Navigate to the spark-tokens repository on GitHub
2. Go to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Set the name to `SSH_DEPLOY_KEY_SPARK_IOS`
5. Paste the entire contents of `spark-ios-deploy-key` (private key)
   - The content should start with `-----BEGIN OPENSSH PRIVATE KEY-----`
6. Click **Add secret**

##### Step 4: Clean Up Local Keys

```bash
$ rm spark-ios-deploy-key spark-ios-deploy-key.pub
```

Remove the local key files after adding them to GitHub for security.

#### Option 2: Verify Existing Secret

If you already have an SSH key set up, you may need to verify the configuration instead of regenerating.

##### Verification Checklist

1. **Verify the secret exists in spark-tokens:**
   - Go to spark-tokens → **Settings** → **Secrets and variables** → **Actions**
   - Confirm `SSH_DEPLOY_KEY_SPARK_IOS` exists
   - The value should contain a valid private key starting with `-----BEGIN OPENSSH PRIVATE KEY-----` or `-----BEGIN RSA PRIVATE KEY-----`

2. **Verify the deploy key in spark-ios:**
   - Go to spark-ios → **Settings** → **Deploy keys**
   - Look for a deploy key with the corresponding public key
   - Confirm "Allow write access" is enabled
   - Check the last usage date to ensure it's active

3. **Verify the key hasn't been revoked:**
   - Ensure the deploy key appears in the active keys list
   - If it shows as unused or has been removed, regenerate using Option 1

### Create a Fine-Grained Personal Access Token (PAT)

If you need to create pull requests automatically via GitHub Actions, you'll need a Personal Access Token with appropriate permissions.

#### Step 1: Navigate to GitHub Token Settings

1. Go to **GitHub Settings** → **Developer Settings** → **Personal access tokens** → **Fine-grained tokens**
2. Click **Generate new token**

#### Step 2: Configure the Token

Set the following parameters:

- **Token name:** `Spark Token to Spark iOS`
- **Expiration:** Choose appropriate duration (recommended: 90 days or 1 year)
- **Resource owner:** Select your organization or account
- **Repository access:** Select "Only select repositories" → choose `spark-ios`

#### Step 3: Set Repository Permissions

Under "Repository permissions", configure:

- **Contents:** Read and write (needed for pushing changes)
- **Pull requests:** Read and write (for PR operations)

#### Step 4: Generate and Copy the Token

1. Click **Generate token**
2. **Important:** Copy the token immediately - you won't be able to see it again

#### Step 5: Add Token as a Repository Secret

1. Go to your repository → **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Name it `PAT_SPARK`
4. Paste the token value
5. Click **Add secret**

#### Step 6: Update Workflow Configuration

Ensure your workflow file uses the token for authentication:

```yaml
- name: Create Pull Request
  uses: peter-evans/create-pull-request@v5
  with:
    token: ${{ secrets.PAT_SPARK }}
```

#### Token Management

- **Renewal:** Set a calendar reminder to renew the token before expiration
- **Rotation:** Rotate tokens regularly for security
- **Revocation:** If compromised, immediately revoke the token in GitHub settings and generate a new one

## Troubleshooting

### Authentication Failures

If the workflow fails with authentication errors:
- Verify that "Allow write access" is enabled on the deploy key
- Check that the secret name is exactly `SSH_DEPLOY_KEY_SPARK_IOS`
- Ensure the private key in the secret matches the public key in deploy keys
- Try regenerating the key pair using Option 1

### Key Format Issues

If you see errors about invalid key format:
- Ensure the private key includes the full header and footer
- Verify there are no extra spaces or line breaks
- The key should be in OpenSSH format (ed25519 or RSA)

### Workflow Not Triggering

If icon updates aren't being pushed to spark-ios:
- Check the workflow file exists: `.github/workflows/deliver-icons-to-spark-ios.yml`
- Verify the workflow has the correct permissions
- Check the workflow run logs in spark-tokens Actions tab

## Related Files

- Workflow file in spark-tokens: `.github/workflows/deliver-icons-to-spark-ios.yml`
- Icon update workflow in spark-ios: `.github/workflows/pr-icon-updates.yml`

## Security Considerations

- Never commit private keys to the repository
- Use deploy keys instead of personal access tokens when possible
- Limit deploy key access to only the repositories that need it
- Enable "Allow write access" only when necessary
- Regularly rotate deploy keys (recommended: annually)
- Remove unused deploy keys promptly

## Additional Resources

- [GitHub Deploy Keys Documentation](https://docs.github.com/en/developers/overview/managing-deploy-keys)
- [GitHub Actions Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
