# CLAUDE.md — Power Apps Projects Folder

This is a **multi-project container** for Microsoft Power Apps code apps. See [README.md](README.md) for user-facing setup instructions.

---

## Folder Structure

```
PowerApp Projects Folder/
├── new-project.ps1     ← scaffold script
├── _template/          ← clean baseline project (no node_modules)
└── <ProjectName>/      ← each project created by new-project.ps1
```

Never put project code at the root. All projects live in named subfolders.

---

## Creating a Project

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\new-project.ps1 -Name "MyAppName"
```

`new-project.ps1` copies `_template/`, sets `appDisplayName` in `power.config.json`, and sets `name` in `package.json` to kebab-case. Run from this folder.

---

## Per-Project Config

Fill in `power.config.json` after scaffolding:

- `environmentId` — from [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) → Environments → Details
- `appId` — leave `null`; populated automatically on first deploy
- `appDisplayName` — set by the scaffold script

---

## NPM Scripts (run from inside the project folder)

| Script | Description |
|---|---|
| `npm run dev` | Local dev server |
| `npm run build` | TypeScript check + Vite build |
| `npm run deploy` | Build then push to Power Apps (`power-apps push`) |
| `npm run preview` | Preview production build locally |

---

## Deployment & Auth

`npm run deploy` runs `tsc -b && vite build && power-apps push`. On first run the CLI opens a browser for Microsoft OAuth sign-in; credentials are cached system-wide after that.

`power-apps push` reads `power.config.json` from the current directory and accepts an optional `--solution-id <name>` flag.

---

## Stack

React 19, TypeScript, Vite, Tailwind CSS 4, shadcn/ui, React Router 7, Zustand, TanStack Query, TanStack Table, Lucide, Recharts, Sonner, `@microsoft/power-apps`.

---

## Updating the Template

Edit files in `_template/` to change what new projects start with. Existing projects are independent copies and are not affected.

---

## Git

The root `.gitignore` commits only `_template/`, `new-project.ps1`, `README.md`, `CLAUDE.md`, and `.gitignore`. Individual project folders are excluded from the public repo.
