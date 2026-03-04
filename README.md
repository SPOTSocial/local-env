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

## Dev Phone Verification Bypass

For local development, backend auth can accept any 6-digit verification code if this env var is enabled:

- `SPOT_ALLOW_ANY_6_DIGIT_PHONE_VERIFICATION_CODE=1`

When enabled, `/api/v1/auth/` will accept requests with:

- `phone` (or `phoneNumber`)
- `code` (or `verificationCode`/`smsCode`/`otp`) set to any 6 digits

This bypass is intended only for local/dev environments.

## Contact Connection Polling

Background polling can periodically re-check imported contacts against current Spot users
to discover new matches without requiring a manual re-import.

- `SPOT_CONTACT_CONNECTION_POLLING_ENABLED=1`
- `SPOT_CELERY_BEAT_POLL_CONTACT_CONNECTION_UPDATES=120` (seconds)
- `SPOT_CONTACT_CONNECTION_POLL_BATCH_SIZE=500`
- `SPOT_CONTACT_CONNECTION_POLL_MAX_SNAPSHOT_AGE_HOURS=0` (`0` = no age limit)

Notes:
- Polling is executed by Celery Beat/Worker (`spot.contacts.tasks.poll_contact_connection_updates`).
- This `docker-compose.yml` does not run Beat/Worker services by default.
- If Beat/Worker are not running, this periodic poll will not execute.
