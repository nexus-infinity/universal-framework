import '@testing-library/jest-dom/extend-expect';

// Mock window for platform-specific tests
if (typeof window === 'undefined') {
  global.window = {
    innerWidth: 1024,
    innerHeight: 768,
    dispatchEvent: jest.fn(),
  };
}