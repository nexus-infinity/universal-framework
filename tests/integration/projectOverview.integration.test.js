// tests/integration/projectOverview.integration.test.js
import { render, screen } from '@testing-library/react';
import ProjectOverview from '../src/components/ProjectOverview';

describe('ProjectOverview Integration Test', () => {
  test('it renders project title from API', async () => {
    render(<ProjectOverview />);
    const projectTitle = await screen.findByText(/Project Overview/i);
    expect(projectTitle).toBeInTheDocument();
  });
});
