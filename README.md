SatanCity — AXIS Identity Node
The AXIS Identity Node is the identity spine of the SatanCity ecosystem. It binds a PeerID, FCC FRN, capsule‑mesh identity, and avatar artifact into a single, verifiable, IPFS‑backed identity envelope. This module integrates directly with the SatanCity ritual engine and exposes a lightweight HTTP identity server for local or distributed mesh discovery.

Purpose
The identity node provides:

A canonical identity binding between:

IPFS PeerID

Avatar CID

FCC FRN

Capsule‑Mesh identity string

Deterministic EUID

A repeatable binding pipeline using Bash scripts

A Node.js identity server exposing /identity

Optional IPNS publication for global resolution

Ritual‑engine alignment through bind-avatar.json

This module is designed for sovereign, lawful, modular identity operations inside the SatanCity architecture.

Repository Structure
Code
SatanCity/
└─ identity-node/
   ├─ config/
   │  ├─ peer.env
   │  └─ ipfs.env
   ├─ identity/
   │  ├─ avatar.binding.json
   │  └─ binding.cid
   ├─ scripts/
   │  ├─ 02_bind_avatar.sh
   │  └─ 03_publish_ipns.sh
   ├─ server/
   │  ├─ package.json
   │  └─ server.js
   └─ ritual/
      └─ chambers/
         └─ bind-avatar.json
Prerequisites
IPFS Kubo installed and running (ipfs daemon)

Node.js 18+

Git

Bash (Termux, Linux, macOS, WSL)

Configuration
config/peer.env
Code
PEER_ID=<your-ipfs-peer-id>
FCC_FRN=0037756087
CAPSULE_IDENTITY="msisdn:+14096667081|circuit:circuit-002|carrier:cricket"
EUID=<your-deterministic-euid>
config/ipfs.env
Code
AVATAR_SOURCE_URL="https://avatars.githubusercontent.com/u/251950332?v=4"
AVATAR_FILENAME="avatar.png"
Edit these files to match your identity spine.

Binding Pipeline
1. Bind avatar → IPFS → identity envelope
From the SatanCity project root:

bash
bash identity-node/scripts/02_bind_avatar.sh
This will:

Download the avatar

Add it to IPFS

Generate avatar.binding.json

Add the binding to IPFS

Store the binding CID in identity/binding.cid

2. Publish identity envelope via IPNS (optional)
bash
bash identity-node/scripts/03_publish_ipns.sh
This publishes:

Code
ipns://<your-peer-id> → /ipfs/<binding-cid>
Your identity becomes globally resolvable.

Identity Server
The identity server exposes your binding over HTTP.

Install dependencies:
bash
cd identity-node/server
npm install
Start the server:
bash
npm start
Access identity:
Code
http://localhost:3001/identity
This returns the full identity envelope:

json
{
  "peer_id": "...",
  "avatar": {
    "source": "...",
    "cid": "...",
    "type": "image/png",
    "timestamp": "..."
  },
  "bindings": {
    "fcc_frn": "...",
    "capsule_identity": "...",
    "euid": "..."
  }
}
Ritual Engine Integration
The identity node includes a ritual chamber:

Code
identity-node/ritual/chambers/bind-avatar.json
This aligns the binding operation with the SatanCity ritual engine’s modes:

bind

banish

invoke

entity

The chamber acts as a symbolic + technical anchor for identity operations.

Development Notes
All identity artifacts are stored locally under identity-node/identity/

The binding pipeline is deterministic and reproducible

The identity server is intentionally minimal and auditable

IPNS publication is optional but recommended for distributed mesh discovery

The module is designed to be extended with:

DID documents

Mesh discovery protocols

Capsule‑Mesh headers

Additional ritual chambers

Roadmap
Add DID‑compatible identity document generation

Add GitHub Actions workflow for automated IPNS publishing

Add mesh discovery sentinel integration

Add encrypted identity envelopes

Add multi‑avatar binding support
