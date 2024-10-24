#!/bin/bash

# Step 1: Update package.json
echo "Updating package.json..."
cat <<EOT > package.json
{
  "name": "universal-framework",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "test": "node --experimental-vm-modules node_modules/jest/bin/jest.js",
    "test:watch": "npm test -- --watch",
    "test:coverage": "npm test -- --coverage",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "lint:fix": "eslint . --ext .js,.jsx,.ts,.tsx --fix",
    "build": "tsc",
    "start": "npm run build && node dist/index.js",
    "dev": "nodemon --watch src --exec ts-node src/index.ts",
    "prepare": "husky install"
  },
  "dependencies": {
    "axios": "^1.7.7",
    "dotenv": "^16.3.1",
    "express": "^4.18.2",
    "mongoose": "^8.7.2",
    "openai": "^4.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@babel/core": "^7.22.5",
    "@babel/plugin-proposal-class-properties": "^7.18.6",
    "@babel/plugin-transform-runtime": "^7.22.5",
    "@babel/preset-env": "^7.22.5",
    "@babel/preset-react": "^7.22.5",
    "@babel/preset-typescript": "^7.22.5",
    "@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^14.0.0",
    "@types/express": "^4.17.17",
    "@types/jest": "^29.5.2",
    "@types/react": "^18.2.14",
    "@types/react-dom": "^18.2.6",
    "@typescript-eslint/eslint-plugin": "^5.60.1",
    "@typescript-eslint/parser": "^5.60.1",
    "babel-jest": "^29.5.0",
    "eslint": "^8.43.0",
    "eslint-plugin-react": "^7.32.2",
    "eslint-plugin-react-hooks": "^4.6.0",
    "husky": "^8.0.3",
    "jest": "^29.5.0",
    "jest-environment-jsdom": "^29.5.0",
    "nodemon": "^3.1.7",
    "prettier": "^2.8.8",
    "ts-jest": "^29.1.0",
    "ts-node": "^10.9.1",
    "typescript": "^5.1.3"
  },
  "engines": {
    "node": ">=20.0.0"
  },
  "husky": {
    "hooks": {
      "pre-commit": "npm run lint",
      "pre-push": "npm test"
    }
  }
}
EOT
echo "package.json updated!"

# Step 2: Create tsconfig.json for TypeScript
echo "Creating tsconfig.json..."
cat <<EOT > tsconfig.json
{
  "compilerOptions": {
    "outDir": "./dist",
    "module": "commonjs",
    "target": "es6",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules", "**/*.test.ts"]
}
EOT
echo "tsconfig.json created!"

# Step 3: Install dependencies
echo "Installing npm dependencies..."
npm install

# Step 4: Build the project
echo "Building the project..."
npm run build

# Step 5: Start the project
echo "Starting the project..."
npm start
