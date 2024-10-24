module.exports = {
  preset: 'ts-jest',
  transform: {
    '^.+\.(ts|tsx)$': 'ts-jest',
    '^.+\.(js|jsx)$': 'babel-jest'
  },
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/',
    '^@modules/(.*)$': '<rootDir>/modules/'
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx'],
  roots: ['<rootDir>/modules', '<rootDir>/tests'],
};
