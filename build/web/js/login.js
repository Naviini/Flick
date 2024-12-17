//// Path: web/js/login.js
//
//document.addEventListener('DOMContentLoaded', function() {
//    // Check for error parameter in URL
//    const urlParams = new URLSearchParams(window.location.search);
//    if (urlParams.get('error') === 'invalid') {
//        alert('Invalid credentials. Please try again.');
//    }
//});
// Path: web/js/login.js

document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    
    // Handle different error types
    const error = urlParams.get('error');
    if (error) {
        switch(error) {
            case 'invalid_password':
                alert('Invalid password.  Please try again.');
                break;
            case 'user_not_found':
                alert('User not found. Please register first.');
                break;
            case 'system_error':
                alert('System error. Please try again later.');
                break;
        }
    }

    // Handle successful registration
    if (urlParams.get('registration') === 'success') {
        alert('Registration successful! Please login.');
    }
});