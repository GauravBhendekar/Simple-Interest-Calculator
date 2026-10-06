const form = document.getElementById('interest-form');
const principalInput = document.getElementById('principal');
const rateInput = document.getElementById('rate');
const timeInput = document.getElementById('time');
const interestResult = document.getElementById('interest-result');
const totalResult = document.getElementById('total-result');
const clearButton = document.getElementById('clear-btn');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const principal = Number(principalInput.value);
  const rate = Number(rateInput.value);
  const time = Number(timeInput.value);

  const interest = (principal * rate * time) / 100;
  const total = principal + interest;

  interestResult.textContent = formatCurrency(interest);
  totalResult.textContent = formatCurrency(total);
});

clearButton.addEventListener('click', () => {
  form.reset();
  interestResult.textContent = '$0.00';
  totalResult.textContent = '$0.00';
  principalInput.focus();
});

function formatCurrency(value) {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD'
  }).format(value);
}
