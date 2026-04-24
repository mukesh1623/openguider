# OpenGuider -- claudebot fork

Fork of [mo-tunn/OpenGuider](https://github.com/mo-tunn/OpenGuider) (Apache 2.0).

## What This Is

Cross-platform AI desktop companion (Electron). Screen capture + voice I/O + pointer hints + multi-LLM chat. Windows-primary for this fork.

## Quick Start

```bash
npm install
npm run start        # launch app
npm test             # 19 tests
npm run dist:win     # build Windows installer
```

## Architecture

- **Stack:** Electron + Node.js (CommonJS), vanilla HTML/CSS/JS renderer
- **Entry:** `main.js` (main process), `preload.js` (IPC bridge), `renderer/` (UI)
- **AI providers:** `src/ai/` -- Claude, OpenAI, Gemini, Groq, OpenRouter, Ollama
- **Agent/planning:** `src/agent/` -- task orchestration, step tracking, replanning
- **Voice:** `src/tts/` (Google/ElevenLabs/OpenAI TTS), STT (AssemblyAI/Whisper)
- **Secrets:** `src/secure-store.js` -- keytar (OS keychain) with encrypted fallback
- **Settings:** `src/store.js` -- electron-store with schema validation

## API Keys

All keys are entered through the **Settings UI** in the app (gear icon). Stored securely via OS keychain (keytar) or Electron safeStorage fallback. No `.env` file needed.

| Key | Provider | Required? |
|-----|----------|-----------|
| `claudeApiKey` | Anthropic | If using Claude |
| `openaiApiKey` | OpenAI | If using GPT |
| `geminiApiKey` | Google | If using Gemini |
| `groqApiKey` | Groq | If using Groq |
| `openrouterApiKey` | OpenRouter | If using OpenRouter |
| `assemblyaiApiKey` | AssemblyAI | If using AssemblyAI STT |
| `whisperApiKey` | Whisper endpoint | If using Whisper STT |
| `elevenlabsApiKey` | ElevenLabs | If using ElevenLabs TTS |
| `openaiTtsApiKey` | OpenAI | If using OpenAI TTS |

## Git Remotes

- `origin` -> `claudebot/openguider` (this fork)
- `upstream` -> `mo-tunn/OpenGuider` (original)

## Conventions

See `AGENTS.md` for full contributor/agent guidelines. Key points:
- Minimal surgical changes over broad rewrites
- Do not commit secrets or personal data
- Run `npm test` after changes
- Keep existing naming and style conventions
