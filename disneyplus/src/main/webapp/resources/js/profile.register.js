document.addEventListener('click', (e) => {
let pName = document.getElementById('pName');
let kids = document.getElementById('kids');
let regBtn = document.getElementById('regBtn');

if (e.target.id == 'regBtn') {
    if (pName.value == '' || pName.value == null) {
        alert('프로필이름을 입력해주세요');
        pName.focus();
        return;
    }
    if (kids.value == '' || kids.value == null) {
        alert('키즈 나이를 입력해주세요');
        kids.focus();
    } else {
        regBtn.setAttribute("type", "submit");
    }
}
});