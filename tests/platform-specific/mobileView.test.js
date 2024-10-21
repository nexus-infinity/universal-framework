// tests/platform-specific/mobileView.test.js
test('Displays correctly on mobile', () => {
  global.innerWidth = 320; // Mock mobile width
  window.dispatchEvent(new Event('resize'));
  // Check for mobile-specific UI rendering
  const mobileMenu = screen.getByTestId('mobile-menu');
  expect(mobileMenu).toBeInTheDocument();
});
