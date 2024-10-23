import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default {
  rootDir: path.resolve(__dirname, '..'),
  testEnvironment: 'jsdom',
  transform: {
    '^.+\\.(js|jsx|ts|tsx)$': ['babel-jest', { configFile: './config/babel.config.js' }],
  },
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1',
    '^@modules/(.*)$': '<rootDir>/modules/$1',
    '^@platforms/(.*)$': '<rootDir>/platforms/$1',
    '^@shared/(.*)$': '<rootDir>/shared/$1',
  },
  moduleDirectories: ['node_modules', 'src', 'modules', 'shared'],
  testMatch: [
    '<rootDir>/tests/**/*.test.(js|jsx|ts|tsx)',
    '<rootDir>/modules/**/tests/**/*.test.(js|jsx|ts|tsx)',
    '<rootDir>/platforms/**/tests/**/*.test.(js|jsx|ts|tsx)',
  ],
  setupFilesAfterEnv: ['<rootDir>/tests/setup.js'],
  transformIgnorePatterns: [
    '/node_modules/(?!(@tata-ai)/)',
  ],
  extensionsToTreatAsEsm: ['.jsx', '.ts', '.tsx'],
};
