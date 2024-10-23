import { render, screen } from '@testing-library/react';
import ProjectOverview from '@/components/ProjectOverview';

describe('ProjectOverview Component', () => {
  test('renders the component', () => {
    render(<ProjectOverview />);
    const titleElement = screen.getByText(/Project Overview/i);
    expect(titleElement).toBeInTheDocument();
  });
});