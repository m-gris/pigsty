#!/bin/bash

# Exit on error
set -e

echo "Fixing LLVM version for PostgreSQL installation..."

if [ "$1" == "--full" ]; then
    echo "Performing full update including system packages..."
    # Remove existing LLVM and system packages
    dnf remove -y llvm-libs llvm annobin gcc-plugin-annobin || true

    # Install LLVM 18 with force
    dnf install -y --allowerasing llvm-libs-18.1.8-3.el9 llvm-18.1.8-3.el9

    # Reinstall system packages
    dnf install -y annobin gcc-plugin-annobin
else
    # Basic LLVM update only
    dnf remove -y llvm-libs llvm || true
    dnf install -y --allowerasing llvm-libs-18.1.8-3.el9 llvm-18.1.8-3.el9
fi

echo "LLVM update completed."
