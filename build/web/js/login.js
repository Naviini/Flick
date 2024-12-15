// Path: web/js/login.js

document.addEventListener('DOMContentLoaded', function() {
    // Check for error parameter in URL
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'invalid') {
        alert('Invalid credentials. Please try again.');
    }
});