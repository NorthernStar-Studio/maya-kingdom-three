# Northern Star Studio - GitHub Access Control

## Repository Structure

```
northern-star-studio/
├── src/              → Game source code
├── assets/           → Art, audio, media assets
├── docs/
│   ├── gdd/          → Game Design Documents
│   ├── roadmap/      → Project roadmap, milestones
│   ├── meetings/     → Meeting notes, decisions
│   └── marketing/    → Marketing materials, analytics
├── tests/            → QA tests, bug reports
└── .github/workflows/ → CI/CD pipelines
```

## Role-Based Access

| Account | Roles | Access Level | Paths |
|---------|-------|--------------|-------|
| `nss-admin` | Bin, Macs | Admin | Full repository |
| `nss-producer` | Shig | Write + Merge | All paths, can merge to main |
| `nss-dev` | John | Write | `/src` (write), `/tests` (read) |
| `nss-art` | Yoshi | Write | `/assets` (write), `/src` (read) |
| `nss-design` | Hideo, Gabe, Sakura | Write | `/docs` (write), `/src` (read) |

## Branch Strategy

- **`main`** → Production branch, protected
  - Requires 1 review (Shig or Macs)
  - No direct pushes
  - CI must pass

- **`develop`** → Integration branch
  - Team merges feature branches here
  - CI must pass

- **Feature branches** → Individual work
  - Naming: `feature/<name>` or `fix/<name>`
  - No restrictions

## CI/CD

- **Build**: Triggered on PRs and pushes to `develop`
- **Deploy**: Only Macs/Shig can deploy to production
- **Secrets**: Managed by `nss-admin`

## Getting Started

1. Clone the repository
2. Create a feature branch from `develop`
3. Make your changes
4. Open a PR to `develop`
5. After review, merge to `develop`
6. Shig/Macs will merge to `main` for releases

## Questions?

Contact Macs or Shig for access issues.
