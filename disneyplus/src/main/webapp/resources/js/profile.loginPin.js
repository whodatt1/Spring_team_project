async function checkedPinFromServer(pno) {
    try {
        const url = '/profile/loginPin';
        const config = {
            method : 'post',
            headers : {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify({pno : pno})
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return await result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', (e)=> {
    if (e.target.id == 'pinBtn') {
        e.preventDefault();
        const pin = document.getElementById('pin');
        const pinVal = pin.value;
        if (pinVal == '') {
            alert('PIN을 입력해주세요');
            pin.focus();
        } else {
            checkedPinFromServer(pnoVal).then(result => {
                if (parseInt(result) == pinVal) {
                   document.querySelector('#pinForm').submit();
                } else {
                    alert('잘못된 PIN입니다. 다시 시도해 주세요');
                    pin.value = '';
                    pin.focus();
                }
            });
        }
    }
});