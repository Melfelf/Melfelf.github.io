#!/usr/bin/env bash
set -euo pipefail

# Installs a pinned Zola binary into ./bin for local builds/tests.
ZOLA_VERSION="${ZOLA_VERSION:-0.22.0}"
INSTALL_DIR="${ZOLA_BIN_DIR:-./bin}"

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Linux) PLATFORM_SUFFIX="unknown-linux-gnu" ;;
  Darwin) PLATFORM_SUFFIX="apple-darwin" ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

case "$ARCH" in
  x86_64|amd64) ARCH_SUFFIX="x86_64" ;;
  arm64|aarch64) ARCH_SUFFIX="aarch64" ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

ARCHIVE_EXT="tar.gz"
ASSET="zola-v${ZOLA_VERSION}-${ARCH_SUFFIX}-${PLATFORM_SUFFIX}.${ARCHIVE_EXT}"
DOWNLOAD_URL="https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/${ASSET}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading Zola v${ZOLA_VERSION} from ${DOWNLOAD_URL}"
if curl -sSfL "$DOWNLOAD_URL" -o "${TMP_DIR}/${ASSET}"; then
  mkdir -p "$INSTALL_DIR"
  tar -xzf "${TMP_DIR}/${ASSET}" -C "$TMP_DIR"
  mv "${TMP_DIR}/zola" "${INSTALL_DIR}/zola"
  chmod +x "${INSTALL_DIR}/zola"
  echo "Zola installed to ${INSTALL_DIR}/zola"
  exit 0
fi

echo "Binary download failed, attempting cargo install (this may take a while)..."
if ! command -v cargo >/dev/null 2>&1; then
  echo "Cargo is required for the fallback install but was not found."
  exit 1
fi

if ! cargo install --locked --version "$ZOLA_VERSION" zola --root "$TMP_DIR/cargo-root"; then
  echo "Cargo install failed. Please check your network/proxy access to crates.io and GitHub releases."
  exit 1
fi
mkdir -p "$INSTALL_DIR"
mv "$TMP_DIR/cargo-root/bin/zola" "${INSTALL_DIR}/zola"
chmod +x "${INSTALL_DIR}/zola"

echo "Zola built from source and installed to ${INSTALL_DIR}/zola"
