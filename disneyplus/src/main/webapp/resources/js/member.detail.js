document.getElementById('delBtn').addEventListener('click', () => {
    let pwd = document.getElementById('pwd');
    let confDelBtn = document.getElementById('confDelBtn');
    pwd.type = "password";
    confDelBtn.style.display = "";
});
document.addEventListener('click', (e) => {
    if (e.target.id == 'confDelBtn') {
        document.getElementById('removeForm').submit();
    }
});