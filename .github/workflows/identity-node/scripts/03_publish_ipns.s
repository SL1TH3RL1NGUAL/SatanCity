#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CID=$(cat identity/binding.cid)
ipfs name publish "/ipfs/$CID"
