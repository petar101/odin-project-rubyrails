console.log('Flight search JavaScript loaded');

document.addEventListener('turbo:load', () => {
  const form = document.getElementById('flight-search-form');
  const resultsContainer = document.getElementById('flight-results');

  if (form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      
      const formData = new FormData(form);
      const searchParams = new URLSearchParams(formData);
      
      fetch(`${form.action}?${searchParams.toString()}`, {
        headers: {
          'Accept': 'text/html',
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      .then(response => response.text())
      .then(html => {
        resultsContainer.innerHTML = html;
      });
    });
  }
}); 