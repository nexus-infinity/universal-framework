import React from 'react';
import { render, fireEvent } from '@testing-library/react';
import Button from '../../../shared/components/Button';

describe('Button component', () => {
  it('renders with the correct label', () => {
    const { getByText } = render(<Button label="Click me" onClick={() => {}} />);
    expect(getByText('Click me')).toBeInTheDocument();
  });

  it('calls onClick when clicked', () => {
    const handleClick = jest.fn();
    const { getByText } = render(<Button label="Click me" onClick={handleClick} />);
    fireEvent.click(getByText('Click me'));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  it('applies the correct styles for different variants', () => {
    const { getByText, rerender } = render(<Button label="Primary" onClick={() => {}} variant="primary" />);
    expect(getByText('Primary')).toHaveClass('bg-blue-500');

    rerender(<Button label="Secondary" onClick={() => {}} variant="secondary" />);
    expect(getByText('Secondary')).toHaveClass('bg-gray-200');

    rerender(<Button label="Tertiary" onClick={() => {}} variant="tertiary" />);
    expect(getByText('Tertiary')).toHaveClass('bg-transparent');
  });
});