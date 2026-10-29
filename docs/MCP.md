# Spark MCP (Context7)

The Spark iOS documentation is available to AI assistants (Claude, Cursor, VS Code Copilot, ...) through the **[Context7](https://context7.com/leboncoin/spark-ios)** MCP server.

Once installed, you can ask your assistant questions about Spark iOS (components, theming, icons, ...) and it answers from the **up-to-date** Spark documentation instead of guessing the APIs.

## Table of Contents

- [What is an MCP?](#what-is-an-mcp)
- [Who is it for?](#who-is-it-for)
- [Installation](#installation)
  - [Claude Desktop / claude.ai](#claude-desktop--claudeai)
  - [Claude Code](#claude-code)
  - [Cursor](#cursor)
  - [VS Code (Copilot)](#vs-code-copilot)
- [Usage](#usage)
- [Example prompts](#example-prompts)
- [Troubleshooting](#troubleshooting)

---

## What is an MCP?

An **MCP** (Model Context Protocol) server gives tools to an AI assistant. The Context7 MCP server gives two tools:

| Tool | Role |
|---|---|
| `resolve-library-id` | Finds the Context7 library matching a name (e.g. "Spark iOS" → `/leboncoin/spark-ios`). |
| `query-docs` | Returns the documentation and code examples of a library for a question. |

Nothing is installed in your project: the assistant calls Context7 when it needs the Spark documentation.

The Spark iOS library ID is **`/leboncoin/spark-ios`**.

## Who is it for?

| Profile | Use cases |
|---|---|
| **App developers** | Implement a screen with the Spark components, find the right `sparkXXX` modifier, use the theme values and the icons. |
| **Product managers** | Know which components exist, their variants (intents, sizes, states) and their behaviors. |
| **Designers** | Check what is available on iOS, the tokens (colors, typography, spacing, ...) and the Figma / Zeroheight links of a component. |

---

## Installation

### API key (optional, recommended)

Context7 works without an account, with a lower rate limit. To get a free API key:

1. Sign in on [context7.com/dashboard](https://context7.com/dashboard).
2. Create an API key and replace `YOUR_API_KEY` in the configurations below.

> Do not commit your API key in a project file. Use the user-level configurations (`--scope user`, `~/.cursor/mcp.json`, ...).

> **Easiest way (developers):** with Node.js 22.13+, run `npx ctx7 setup` (add `--claude` or `--cursor` to target an assistant). It signs you in, creates the API key and installs the configuration automatically.

### Claude Desktop / claude.ai

Recommended for **product managers and designers**: no terminal needed.

1. Open **Settings** > **Connectors** > **Add Custom Connector**.
2. Name: `Context7`
3. URL: `https://mcp.context7.com/mcp`
4. Save, then enable the connector in a conversation.

<details>
<summary>Local alternative (needs Node.js)</summary>

Edit `claude_desktop_config.json` (**Settings** > **Developer** > **Edit Config**):

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp", "--api-key", "YOUR_API_KEY"]
    }
  }
}
```

Restart Claude Desktop.
</details>

### Claude Code

```sh
claude mcp add --scope user --header "Authorization: Bearer YOUR_API_KEY" --transport http context7 https://mcp.context7.com/mcp
```

Check the installation with `claude mcp list` (or `/mcp` inside Claude Code).

### Cursor

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "context7": {
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

### VS Code (Copilot)

Add to `.vscode/mcp.json` (or install the **Context7** VS Code extension):

```json
{
  "servers": {
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

---

## Usage

Mention the Spark iOS library in your prompt so the assistant uses it:

```
How do I display a main button with an icon? use library /leboncoin/spark-ios
```

or, shorter:

```
How do I display a main button with an icon in Spark iOS? use context7
```

### Use it automatically (developers)

To avoid writing `use library /leboncoin/spark-ios` each time, add this rule in your app's `CLAUDE.md` (Claude Code) or in **Cursor Settings** > **Rules**:

```markdown
When the code uses Spark iOS (`import Spark`, `SparkXXX` views, `sparkXXX` modifiers, `SparkTheme`), always use the Context7 MCP with the library `/leboncoin/spark-ios` to get the up-to-date documentation and examples.
```

---

## Example prompts

### App developers

- `Implement a login form with two Spark text inputs and a main button. use library /leboncoin/spark-ios`
- `How do I display a 4-digit InputOTP with an error state? use library /leboncoin/spark-ios`
- `Which sparkXXX modifiers can I use on SparkButton? use library /leboncoin/spark-ios`
- `How do I build a custom view with the InputOTP colors using theme.component? use library /leboncoin/spark-ios`
- `How do I display the Spark icon "copyOutline" in SwiftUI? use library /leboncoin/spark-ios`

### Product managers

- `List all the Spark iOS components with a short description. use library /leboncoin/spark-ios`
- `What are the states and variants of the Chip component on iOS? use library /leboncoin/spark-ios`
- `Is a Snackbar component available on iOS, and is it compatible with UIKit? use library /leboncoin/spark-ios`

### Designers

- `Which typography tokens does Spark iOS provide? use library /leboncoin/spark-ios`
- `Give me the Figma and Zeroheight links of the Button component. use library /leboncoin/spark-ios`
- `Which colors are used by the InputOTP in error state? use library /leboncoin/spark-ios`

---

## Troubleshooting

| Problem | Solution |
|---|---|
| The assistant doesn't use Context7 | Check the MCP is enabled (`/mcp` in Claude Code, the connectors toggle in Claude Desktop) and add `use library /leboncoin/spark-ios` to the prompt. |
| "Rate limit" errors | Add an API key (see [API key](#api-key-optional-recommended)). |
| The answer is outdated | Context7 refreshes the documentation regularly from the `main` branch. Check the last update on [context7.com/leboncoin/spark-ios](https://context7.com/leboncoin/spark-ios). |
| `npx` not found | Install [Node.js](https://nodejs.org) (22.13+), or use the remote configuration (URL) instead of the local one. |

> For the Spark team: the indexed content and the rules given to the assistants are configured in [`context7.json`](../context7.json) at the root of the repository.
