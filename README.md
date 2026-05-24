# Power Apps Projects Starter

An opinionated **Vite + TypeScript + React** starter for building Microsoft Power Apps code apps. Scaffold new projects instantly and deploy directly to your Power Platform environment.

---

## Prerequisites

- [Node.js 18+](https://nodejs.org/)
- A Microsoft 365 / Power Platform account
- A Power Platform environment ID — find yours at [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) under **Environments → your environment → Details**

---

## Creating a new project

From this folder, run:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\new-project.ps1 -Name "MyAppName"
```

This copies the template into a new `MyAppName/` folder and sets the app name automatically.

---

## Setup

1. Open `MyAppName/power.config.json` and paste your environment ID:

```json
{
  "environmentId": "your-environment-id-here"
}
```

2. Install dependencies:

```bash
cd MyAppName
npm install
```

---

## Deploying

```bash
npm run deploy
```

The first time you run this, a browser window will open for Microsoft sign-in. After authenticating once, your credentials are cached and subsequent deploys run without prompts.

---

## Other commands

| Command | Description |
|---|---|
| `npm run dev` | Start local dev server |
| `npm run build` | Build for production |
| `npm run preview` | Preview the production build locally |
| `npm run deploy` | Build and push to your Power Apps environment |
