import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from './App';

test('renders Hello from React!', () => {
  render(<App />);
  const heading = screen.getByText(/Hello from React!/i);
  expect(heading).toBeInTheDocument();
});
