#!/bin/bash

# Set the root directory explicitly
ROOT_DIR="/users/jbear/dev/universal-framework"

# Navigate to the modules directory
cd "$ROOT_DIR/modules" || exit

# Check if the Tata AI directory exists, if not create it
if [ ! -d "tata-ai" ]; then
  echo "Creating Tata AI directory..."
  mkdir tata-ai
fi

# Navigate to tata-ai directory
cd tata-ai || exit

# Create necessary files and directories
echo "Setting up Tata AI folder structure..."

# Base files
touch README.md
touch package.json
touch tsconfig.json

# Config directory for additional configuration files (only if they don't already exist)
mkdir -p config
touch config/.gitkeep  # Placeholder for future config files in /tata-ai/config

# Source directory and its subdirectories (only if they don't already exist)
mkdir -p src/{core,file-management,integrations,scripts,ui,utils}

# Create key source files (only if they don't already exist)
if [ ! -f "src/core/tata-core.ts" ]; then
cat <<EOT > src/core/tata-core.ts
import { Communication } from '../../shared-core/src/services/communication';
import { DependencyInjector } from '../../shared-core/src/utils/dependency-injection';

export function initialize() {
  const aiService = DependencyInjector.getService('AIService');
  if (aiService) {
    aiService.runModel({ /* your data */ });
  } else {
    console.error('AIService not available');
  }
}

export function processInput(data: any) {
  Communication.sendMessage('bear-project', data);
}
EOT
fi

# Create tests directory (only if they don't already exist)
mkdir -p tests
touch tests/core.test.js

# Initialize package.json if it doesn't already exist
if [ ! -f "package.json" ]; then
    echo "Initializing package.json for Tata AI..."
    npm init -y
fi

# Go back to the root and confirm
cd "$ROOT_DIR" || exit
echo "Tata AI module created successfully."

# Optional: Add to version control (only if necessary)
# git add modules/tata-ai/
# git commit -m "Set up Tata AI module and integration with shared-core"
