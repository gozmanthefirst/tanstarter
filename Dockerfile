FROM node:22-alpine AS base

FROM base AS deps

RUN apk add --no-cache gcompat libc6-compat

# Set up the application directory for the base stage
WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package.json pnpm-lock.yaml* ./
RUN corepack enable pnpm && pnpm i --frozen-lockfile

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN corepack enable pnpm && pnpm run build

# Production stage with only essential files
FROM base AS runner
WORKDIR /app

# Create a non-root user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 tanstack

# Copy files
COPY --from=builder --chown=tanstack:nodejs /app/.output ./

# Set environment variables
ENV NODE_ENV=production \
    HOSTNAME="0.0.0.0" \
    PORT=3000

USER tanstack

EXPOSE 3000

CMD ["node", "server/index.mjs"]
