DISPLAY_NAME=Evolution API
DESCRIPTION=API for WhatsApp and AI integrations.
VERSION=recommended
RUNTIME=nodejs
START=npx prisma generate --schema prisma/postgresql-schema.prisma && npm run build && npm run start:prod
MEMORY=3072
SUBDOMAIN={random-hash}-evoapi
AUTORESTART=true
