document.addEventListener('click', (e) => {
    if(e.target.id == 'delBtn') {
        e.preventDefault();
        document.querySelector('input[name=cno]').value = e.target.dataset.cno;
        document.querySelector("#delForm").submit();
    }
});

