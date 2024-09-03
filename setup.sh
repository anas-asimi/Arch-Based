#!/bin/bash

# Perform a system update
echo "🔁 Updating system..."
sudo pacman -Syu --noconfirm

# Check if apps.txt exists
if [[ ! -f apps.txt ]]; then
    echo "❌ File apps.txt not found!"
    exit 1
fi

# Read each line from apps.txt and install the package
while IFS= read -r app; do
    # Ignore lines starting with #
    [[ "$app" =~ ^#.*$ ]] && continue
    sudo pacman -S --noconfirm "$app"
done <apps.txt

echo "✅ All packages installed successfully."
