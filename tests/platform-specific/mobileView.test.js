import { render, screen } from '@testing-library/react';
import MobileView from '@/components/MobileView';

describe('Mobile View', () => {
  beforeAll(() => {
    window.innerWidth = 320;
    window.dispatchEvent(new Event('resize'));
  });

  test('Displays correctly on mobile', () => {
    render(<MobileView />);
    const mobileMenu = screen.getByTestId('mobile-menu');
    expect(mobileMenu).toBeInTheDocument();
  });
});