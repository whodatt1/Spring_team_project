function countPlus() {
    document.getElementById('purchaseCount').value = parseInt(document.getElementById('purchaseCount').value) + 1;
    document.getElementById('price').innerHTML = parseInt(document.getElementById('price').innerHTML) + parseInt(document.querySelector('input[name=price]').value);

    document.getElementById('purchaseBtn').setAttribute('href', '/cart/register?'+ 'gno=' + document.querySelector('input[name=gno]').value +'&totalPrice='+ document.getElementById('price').innerHTML + '&purchaseCount=' + document.getElementById('purchaseCount').value);
}

function countMinus() {
    if (parseInt(document.getElementById('purchaseCount').value) < 2) {
        alert('더 이상 줄일 수 없습니다')
    } else {
        document.getElementById('purchaseCount').value = parseInt(document.getElementById('purchaseCount').value) - 1;
        document.getElementById('price').innerHTML = parseInt(document.getElementById('price').innerHTML) - parseInt(document.querySelector('input[name=price]').value);

        document.getElementById('purchaseBtn').setAttribute('href', '/cart/register?'+ 'gno=' + document.querySelector('input[name=gno]').value +'&totalPrice='+ document.getElementById('price').innerHTML + '&purchaseCount=' + document.getElementById('purchaseCount').value);
    }
}

let totalPrice = document.getElementById('price').innerHTML;
let gno = document.querySelector('input[name=gno]').value;
let purchaseCount = document.getElementById('purchaseCount').value;

document.getElementById('purchaseBtn').setAttribute('href', '/cart/register?'+ 'gno=' + gno +'&totalPrice='+ totalPrice + '&purchaseCount=' + purchaseCount);

document.addEventListener('click', (e) => {
    if(e.target.id == 'delBtn') {
        e.preventDefault();
        document.querySelector("#delForm").submit();
    }
});