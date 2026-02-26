#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/config/peer.env"
source "$ROOT/config/ipfs.env"

cd "$ROOT"

curl -L -o "$AVATAR_FILENAME" "$AVATAR_SOURCE_URL"
CID=$(ipfs add -Q "$AVATAR_FILENAME")

mkdir -p identity

cat > identity/avatar.binding.json << EOF
{
  "peer_id": "$PEER_ID",
  "avatar": {
    "source": "$AVATAR_SOURCE_URL",
    "cid": "$CID",
    "type": "image/png",
    "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  },
  "bindings": {
    "fcc_frn": "$FCC_FRN",
    "capsule_identity": "$CAPSULE_IDENTITY",
    "euid": "$EUID"
  }
}
EOF

BINDING_CID=$(ipfs add -Q identity/avatar.binding.json)
echo "$BINDING_CID" > identity/binding.cid
echo "Binding CID: $BINDING_CID"
