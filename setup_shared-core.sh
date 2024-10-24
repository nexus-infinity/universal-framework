#!/bin/bash

# Set the root directory explicitly (correct username and path)
ROOT_DIR="/users/jbear/dev/universal-framework"

# Navigate to the modules directory within the correct path
cd "$ROOT_DIR/modules" || exit

# Check if the shared-core directory exists, if not create it
if [ ! -d "shared-core" ]; then
  echo "Creating shared-core directory..."
  mkdir shared-core
fi

# Navigate to shared-core directory
cd shared-core || exit

# Create necessary files and directories without disrupting existing structure
echo "Setting up shared-core module structure..."

# Base files
touch README.md
touch package.json
touch tsconfig.json

# Source directory and services subdirectories (only if they don't already exist)
mkdir -p src/{interfaces,services,utils}

# Add core interfaces and services
if [ ! -f "src/interfaces/module-interfaces.ts" ]; then
cat <<EOT > src/interfaces/module-interfaces.ts
// Shared interfaces for cross-module usage
export interface AIInterface {
  runModel(input: any): any;
}

export interface FileManagerInterface {
  saveFile(path: string, data: any): void;
}
EOT
fi

if [ ! -f "src/services/communication.ts" ]; then
cat <<EOT > src/services/communication.ts
// Communication service for cross-module messaging
export class Communication {
  static sendMessage(moduleName: string, message: any): void {
    console.log(\`Sending message to \${moduleName}: \`, message);
    // Add logic to send message between modules
  }

  static receiveMessage(moduleName: string): void {
    console.log(\`Receiving message from \${moduleName}\`);
    // Add logic to receive and process messages
  }
}
EOT
fi

if [ ! -f "src/utils/dependency-injection.ts" ]; then
cat <<EOT > src/utils/dependency-injection.ts
// Dependency Injection service for decoupling modules
export class DependencyInjector {
  private static services = new Map<string, any>();

  static registerService(name: string, service: any) {
    DependencyInjector.services.set(name, service);
  }

  static getService(name: string) {
    return DependencyInjector.services.get(name);
  }
}
EOT
fi

# Initialize package.json if it doesn't already exist
if [ ! -f "package.json" ]; then
    echo "Initializing package.json for shared-core..."
    npm init -y
fi

# Go back to the root and confirm
cd "$ROOT_DIR" || exit
echo "shared-core module created successfully."

# Optional: Add to version control (only if necessary)
# git add modules/shared-core/
# git commit -m "Set up shared-core module and core services"
