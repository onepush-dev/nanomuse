# nanoMuse on Railway

[nanoMuse](https://github.com/nano-muse/nanoMuse) (GPL-3.0-or-later) — an open-source personal AI agent with long-term memory, goals, a credential vault and a phone-friendly web app. Deploy it on Railway with one click (no inputs), then bring your own LLM key.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/ioOZAz)

## What this template runs

- **nanomuse**: `ghcr.io/onepush-dev/nanomuse:1.0.9`, the official `ghcr.io/nano-muse/nanomuse:1.0.9` image (code unmodified) running `nanomuse serve` on port 8080. One volume at `/data` holds memory, goals, vault, threads, the audit log and the agent's workspace (`/data/workspace`). A small start script fixes volume ownership and drops to the image's `muse` user. Healthcheck `/api/health`.

## Variables

| Variable | Value | Notes |
|---|---|---|
| `NANOMUSE_SERVER_TOKEN` | generated secret | Access token for the web app and API. Open `https://<your-domain>/#token=<value>` once to pair a browser. |

Baked into the image (override by adding the variable): `NANOMUSE_LLM_PROVIDER=openai` (OpenAI-compatible Chat Completions), `NANOMUSE_LLM_BASE_URL=https://api.deepseek.com`, `NANOMUSE_LLM_MODEL=deepseek-flash`, `NANOMUSE_DATA_DIR=/data`, `NANOMUSE_WORKSPACE=/data/workspace`, `NANOMUSE_SERVER_HOST=0.0.0.0`, `NANOMUSE_SERVER_PORT=8080`.

To use OpenAI, OpenRouter or Anthropic instead, set `NANOMUSE_LLM_BASE_URL` (e.g. `https://api.openai.com/v1`, `https://openrouter.ai/api/v1`, `https://api.anthropic.com/v1`) and `NANOMUSE_LLM_MODEL`. Optional: `NANOMUSE_VAULT_KEY` (a base64 Fernet key; by default a key file is kept on the volume).

## How to use

1. Deploy, then copy `NANOMUSE_SERVER_TOKEN` from the service variables.
2. Open `https://<your-domain>/#token=<NANOMUSE_SERVER_TOKEN>` on your phone or desktop.
3. Paste your model key under **Connections** in the app (it is stored in the encrypted vault on the volume), or add `NANOMUSE_LLM_API_KEY` as a service variable. The defaults target DeepSeek (`https://api.deepseek.com`, `deepseek-flash`).

Not affiliated with nanoMuse (which itself is not affiliated with Meta).
