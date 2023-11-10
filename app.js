const initialString = `
  userType == 'EMPLOYEE' AND location == 'US' OR location != 'US'
`;
document.addEventListener("DOMContentLoaded", function() {
  document.getElementById('oele-input').textContent = initialString.trim();
});