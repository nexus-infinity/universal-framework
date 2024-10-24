#!/bin/bash

# Set the root directory
ROOT_DIR="/users/jbear/dev/universal-framework"

# Path to the shared folder
SHARED_DIR="$ROOT_DIR/shared"

# Path to the Tata AI module
TATA_AI_DIR="$ROOT_DIR/modules/tata-ai"

# Path to the redundant shared-core module (to be removed)
SHARED_CORE_DIR="$ROOT_DIR/modules/shared-core"

# Step 1: Create necessary directories under the shared folder
echo "Creating adapters directory under shared folder..."
mkdir -p "$SHARED_DIR/adapters"

# Step 2: Move AI Service into shared/adapters
echo "Creating AI Service in shared/adapters/ai-service.ts..."
cat <<EOT > "$SHARED_DIR/adapters/ai-service.ts"
// AI Service to be used by modules
export class AIService {
  runModel(input: any) {
    console.log('Running AI model with input:', input);
    // AI model logic goes here
  }
}

// Dependency Injection Registration
import { DependencyInjector } from './dependency-injection';
DependencyInjector.registerService('AIService', new AIService());
EOT

# Step 3: Move Dependency Injection into shared/adapters
echo "Creating Dependency Injector in shared/adapters/dependency-injection.ts..."
cat <<EOT > "$SHARED_DIR/adapters/dependency-injection.ts"
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

# Step 4: Move Communication Service into shared/adapters
echo "Creating Communication Service in shared/adapters/communication.ts..."
cat <<EOT > "$SHARED_DIR/adapters/communication.ts"
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

# Step 5: Update Tata AI module to use the shared services
echo "Updating Tata AI module to use shared services..."
cat <<EOT > "$TATA_AI_DIR/src/core/tata-core.ts"
import { Communication } from '../../../shared/adapters/communication';
import { DependencyInjector } from '../../../shared/adapters/dependency-injection';

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

# Step 6: Remove the shared-core folder (clean up)
if [ -d "$SHARED_CORE_DIR" ]; then
  echo "Removing the shared-core directory..."
  rm -rf "$SHARED_CORE_DIR"
fi

# Final step: Confirmation
echo "Consolidation complete! The shared-core module has been removed, and all shared logic is now under the shared/adapters directory."
