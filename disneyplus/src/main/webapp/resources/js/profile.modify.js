document.addEventListener('click', (e) => {
    let pin = document.getElementById('pin');
    let lock = document.getElementById('lock');
    let modForm = document.getElementById('modForm');
    if (e.target.id == 'modBtn') {
        if (pin.value == null || pin.value == '') {
            alert('PIN을 입력해주세요');
            pin.focus();
            return;
        } else {
            lock.value = 1;
            modForm.submit();
        } 
    }
});

