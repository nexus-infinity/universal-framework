// tests/security/xss.test.js
test('Escapes HTML to prevent XSS', () => {
  const maliciousInput = '<script>alert("XSS")</script>';
  const safeOutput = escapeHTML(maliciousInput); // Hypothetical function
  expect(safeOutput).toBe('&lt;script&gt;alert("XSS")&lt;/script&gt;');
});
