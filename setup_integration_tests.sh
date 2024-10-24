#!/bin/bash

# Set the root directory explicitly (adjust if necessary)
ROOT_DIR="/users/jbear/dev/universal-framework"

# Path to the existing tests folder
TESTS_DIR="$ROOT_DIR/tests"

# Step 1: Use the existing tests folder and subfolder for integration tests
echo "Placing integration tests in the existing tests folder..."
mkdir -p "$TESTS_DIR/integration"

# Step 2: Create a sample integration test for Tata AI -> Backend communication
echo "Creating a sample integration test (Tata AI -> Backend communication)..."
cat <<EOT > "$TESTS_DIR/integration/tata-ai-integration.test.js"
import { initialize } from '../../modules/tata-ai/src/core/tata-core';
import { Communication } from '../../shared/adapters/communication';

test('Tata AI -> Backend Communication Test', () => {
  const data = { test: 'sample-data' };
  
  // Initialize Tata AI and process the input data
  initialize();
  
  // Simulate sending data to another module via Communication service
  const consoleSpy = jest.spyOn(console, 'log');
  Communication.sendMessage('backend-module', data);
  
  // Check that the message was sent
  expect(consoleSpy).toHaveBeenCalledWith('Sending message to backend-module: ', data);
});
EOT

# Step 3: Update Jest config to include the integration tests
JEST_CONFIG="$ROOT_DIR/config/jest.config.js"

echo "Updating Jest config to include the integration tests folder..."
if grep -q "roots" "$JEST_CONFIG"; then
  # If 'roots' is already present in jest.config.js, ensure the tests folder is included
  sed -i '' '/roots/s/\(.*\)/\1, "<rootDir>\/tests\/integration"/' "$JEST_CONFIG"
else
  # If 'roots' is not present, add it with the integration folder
  cat <<EOT >> "$JEST_CONFIG"
module.exports = {
  roots: ['<rootDir>/modules', '<rootDir>/tests/integration'],
  testMatch: ['**/tests/**/*.test.js'],
  transform: {
    '^.+\\.tsx?$': 'ts-jest',
  },
};
EOT
fi

# Final Step: Confirmation
echo "Integration test setup complete! You can now run the integration tests with 'npm run test'."
