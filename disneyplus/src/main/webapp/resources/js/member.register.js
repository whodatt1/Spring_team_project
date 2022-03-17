async function emailDupleCheckFromServer(emailVal) {
    try {
        const url = '/member/dupleCheck';
        const config = {
            method : 'post',
            headers : {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify({email : emailVal})
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
document.addEventListener('click', (e) => {
    let regBtn = document.getElementById('regBtn');
    let emailInput = document.getElementById('email');
    let emailVal = emailInput.value;
    let pwd = document.getElementById('pwd').value;
    let rpwd = document.getElementById('rpwd').value;

    if (e.target.id == 'dupleCheck') {
        e.preventDefault();
        if (emailVal == '') {
            alert('가입할 이메일을 입력해주세요');
            emailInput.focus();
            return;
        } else {
            emailDupleCheckFromServer(emailVal).then(result => {
                if (parseInt(result)) {
                    alert('이미 사용중인 이메일입니다');
                    emailInput.value = "";
                    emailInput.focus();
                } else {
                    alert('사용 가능한 이메일 입니다');
                }
            });
        }
    }
    if (e.target.id == 'pwdCheck') {
        e.preventDefault();
        check_pwd();
        if (emailVal.length > 0 && pwd == rpwd) {
            regBtn.disabled = false;
        }
    }
});
function check_pwd(){
    let pwd = document.getElementById('pwd').value;
    if(pwd.length < 8 || pwd.length > 20){
       alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
        document.getElementById('pwd').value='';
    }
    if(document.getElementById('pwd').value != '' && document.getElementById('rpwd').value != ''){
        if(document.getElementById('pwd').value == document.getElementById('rpwd').value){
            alert('비밀번호가 일치합니다');
        }
        else{
            alert('비밀번호가 일치하지 않습니다');
            document.getElementById('pwd').value = "";
            document.getElementById('rpwd').value = "";
            document.getElementById('pwd').focus();
        }
    }
}