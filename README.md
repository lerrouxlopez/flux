# FLUX

FLUX is a real-time messaging app built for teams and communities that don’t live in one vibe all day.

It combines **chat + files** with **voice/video + screen share**, and introduces a core product concept:
**a one-tap switch between _Work Mode_ and _Game Mode_.**

- **Work Mode**: calm, structured collaboration (threads, pins, search-first UI)
- **Game Mode**: fast, expressive, voice-first comms (quick actions, lightweight flows)

Same account. Same rooms. Same history. Different rhythm.

---

## What makes FLUX different

Most apps pick a lane: workplace collaboration or gamer comms. FLUX is designed for people who move between both.

### Work Mode
- Cleaner UI, reduced noise
- Threads/pins/search surfaced
- Notification defaults optimized for focus

### Game Mode
- Faster navigation and quick actions
- Voice-first defaults for “drop in” comms
- More expressive messaging (reactions, lightweight UX)

Modes change the **experience and defaults**, not the underlying data integrity.

---

## Tech stack

### Client
- **React Native** (TypeScript)

### Realtime (app events)
- **Elixir + Phoenix Channels**
  - Presence, typing, read receipts, realtime message fanout

### Product backend
- **Rust + Rocket** (HTTP API)
- **Postgres** (system of record)
- **Kafka** (durable event stream + ordering)

### Media plane
- **LiveKit** (voice/video + screen share)
- **coturn** (STUN/TURN for NAT traversal)

---

## High-level architecture

- React Native app connects to:
  - Phoenix Channels for realtime chat events (WebSocket)
  - Rocket API for auth/history/files (HTTP)
  - LiveKit for voice/video/screenshare (WebRTC under the hood)
- Kafka is the backbone for durable events across services.
- Postgres persists messages and metadata.
- coturn provides TURN when direct P2P routes fail.

---

## Repo layout

This repository is intended as a monorepo:

/apps
/mobile # React Native client
/services
/realtime # Phoenix Channels gateway
/api # Rust Rocket API (auth, history, files, permissions)
/workers # Rust consumers/producers for Kafka (message persistence, notifications)
/infra
/docker # local dev configs (Postgres, Kafka, LiveKit, coturn)
/k8s # Kubernetes manifests (optional)

yaml
Copy code

---

## Getting started (local dev)

> The exact commands may differ depending on how you structure the repo. The steps below match the stack FLUX is designed for.

### Prerequisites
- Docker + Docker Compose
- Node.js + Yarn (or pnpm)
- Rust toolchain (stable)
- Elixir + Erlang
- (Optional) Android Studio / Xcode for running the mobile app

### 1) Bring up infrastructure
Start local dependencies (Postgres, Kafka, LiveKit, coturn).

```bash
docker compose up -d
2) Start the realtime gateway (Phoenix)
bash
Copy code
cd services/realtime
mix deps.get
mix phx.server
3) Start the API (Rocket)
bash
Copy code
cd services/api
cargo run
4) Start background workers (Kafka consumers)
bash
Copy code
cd services/workers
cargo run
5) Run the React Native app
bash
Copy code
cd apps/mobile
yarn install
yarn start
# in another terminal:
yarn android
# or:
yarn ios
