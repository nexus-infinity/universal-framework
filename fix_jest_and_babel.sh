#!/bin/bash

# Set the root directory (adjust if needed)
ROOT_DIR="/users/jbear/dev/universal-framework"

# Step 1: Install necessary Babel and Jest packages
echo "Installing necessary Babel and Jest packages..."
npm install --save-dev @babel/preset-env @babel/preset-react @babel/preset-typescript babel-jest ts-jest jest

# Step 2: Create or update Babel configuration
echo "Creating/updating .babelrc..."
cat <<EOT > "$ROOT_DIR/.babelrc"
{
  "presets": [
    "@babel/preset-env",
    "@babel/preset-react",
    "@babel/preset-typescript"
  ]
}
EOT

# Step 3: Update Jest configuration to handle TypeScript, JSX/TSX, and custom modules
JEST_CONFIG="$ROOT_DIR/config/jest.config.js"

echo "Updating Jest config for TypeScript, JSX, and custom module paths..."
cat <<EOT > "$JEST_CONFIG"
module.exports = {
  preset: 'ts-jest',
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest",
    "^.+\\.(js|jsx)$": "babel-jest"
  },
  moduleNameMapper: {
    "^@/(.*)$": "<rootDir>/$1",
    "^@modules/(.*)$": "<rootDir>/modules/$1"
  },
  moduleFileExtensions: ["ts", "tsx", "js", "jsx"],
  roots: ["<rootDir>/modules", "<rootDir>/tests"],
};
EOT

# Step 4: Confirmation
echo "Babel and Jest configuration updated! You can now run the tests with 'npm run test'."
