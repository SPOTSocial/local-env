# Spot Local Environment

Unified local development environment for all Spot services.

## Repos

| Service | Repo | Local Port |
|---------|------|------------|
| spot-backend | [SPOTSocial/spot-backend](https://github.com/SPOTSocial/spot-backend) | 8001 |
| console-backend | [SPOTSocial/console-backend](https://github.com/SPOTSocial/console-backend) | 8000 |
| console-frontend | [SPOTSocial/console-frontend](https://github.com/SPOTSocial/console-frontend) | 3000 |
| spot-web | [SPOTSocial/spot-web](https://github.com/SPOTSocial/spot-web) | 3001 |

## Prerequisites

Clone all repos as siblings in the same parent directory:

```
spot/
├── local-env/          # this repo
├── spot-backend/
├── console-backend/
├── console-frontend/
└── spot-web/
```

## Quick Start

```bash
# Copy env files
cp .env.example .env

# Start everything
docker compose up -d

# View logs
docker compose logs -f

# Stop everything
docker compose down
```

## Services

- **spot-db** — Postgres 15 for spot-backend (port 5433)
- **spot-memcached** — Memcached for spot-backend (port 11211)
- **spot-backend** — Django API (port 8001)
- **console-db** — Postgres 15 for console-backend (port 5434)
- **console-backend** — Django API (port 8000)
- **console-frontend** — Next.js dev server (port 3000)
- **spot-web** — Next.js dev server (port 3001)
