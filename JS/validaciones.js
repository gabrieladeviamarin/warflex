function validateEmail(email) {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}

function validateUsername(username) {
    return username.length >= 6;
}

function validatePassword(password) {
    const uppercasePattern = /[A-Z]/g;
    const specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;

    const hasLength = password.length >= 8;
    const hasUppercase = (password.match(uppercasePattern) || []).length >= 2;
    const hasSpecialChar = specialCharPattern.test(password);

    return hasLength && hasUppercase && hasSpecialChar;
}

function showError(inputId, message) {
    const input = document.getElementById(inputId);
    let errorDiv = input.nextElementSibling;

    if (!errorDiv || !errorDiv.classList.contains('error-message')) {
        errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.style.color = 'red';
        errorDiv.style.fontSize = '12px';
        errorDiv.style.marginTop = '5px';
        input.parentNode.insertBefore(errorDiv, input.nextSibling);
    }

    errorDiv.textContent = message;
}

function clearErrors() {
    const errors = document.querySelectorAll('.error-message');
    errors.forEach(error => error.remove());
}

function validateRegisterForm() {
    clearErrors();

    const email = document.getElementById('email').value;
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm_password').value;

    let isValid = true;

    if (!validateEmail(email)) {
        showError('email', 'Por favor ingrese un correo válido.');
        isValid = false;
    }

    if (!validateUsername(username)) {
        showError('username', 'El nombre de usuario debe tener al menos 6 caracteres.');
        isValid = false;
    }

    if (!validatePassword(password)) {
        showError('password', 'La contraseña debe contener al menos 8 caracteres, 2 mayúsculas y 1 carácter especial.');
        isValid = false;
    }

    if (password !== confirmPassword) {
        showError('confirm_password', 'Las contraseñas no coinciden.');
        isValid = false;
    }

    return isValid;
}