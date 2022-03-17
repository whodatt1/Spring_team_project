document.addEventListener('click', (e) => {
    let loginForm = document.getElementById(e.target.closest('form').id);
    if (e.target.id == 'icon') {
        loginForm.submit();
    }
});