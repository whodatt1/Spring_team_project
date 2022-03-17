document.addEventListener('click', (e) => {
    e.preventDefault();
    let modForm = document.getElementById('modForm');
    let pwd = document.getElementById('pwd').value;
    if (e.target.id == 'modBtn') {
        if(pwd.length < 8 || pwd.length > 20){
            alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
            pwd = '';
            document.getElementById('pwd').focus();
         } else {
            modForm.submit();
         }
    }
});