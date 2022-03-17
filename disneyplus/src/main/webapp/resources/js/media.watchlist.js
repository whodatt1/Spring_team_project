async function getAccountWatchListFromServer(data) {
    try {
        const url = "/watchlist/accountList";
        const config = {
            method: 'post',
            headers: {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body: JSON.stringify(data)
        }
        const resp = await fetch(url, config);
        const result = await resp.json();
        return await result;
    } catch (error) {
        console.log(error);
    }
}

function changeWishListBtn() {
    let data = {
        mno : document.querySelector('input[name=mno]').value,
        email : document.querySelector('input[name=email').value,
        profileName : document.querySelector('input[name=profileName').value
    }

    getAccountWatchListFromServer(data).then(result => {
        
        if (result.length == 1) {
            document.getElementById('plusWishList').style.display = 'none';
            document.getElementById('minusWishList').style.display = 'block';
            document.getElementById('minusWishList').dataset.wno = result[0].wno;
        } else if (result.length == 0) {
            document.getElementById('plusWishList').style.display = 'block';
            document.getElementById('minusWishList').style.display = 'none';
        }
    })
}

async function registerWatchListToServer(wlData) {
    try {
        const url = "/watchlist/register";
        const config = {
            method: 'post',
            headers: {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body: JSON.stringify(wlData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('plusWishList').addEventListener('click', () => {
    let wlData = {
        mno : document.querySelector('input[name=mno]').value,
        email : document.querySelector('input[name=email]').value,
        title : document.querySelector('input[name=wlTitle]').value,
        profileName : document.querySelector('input[name=profileName]').value,
        posterImg: document.querySelector('input[name=wlPosterImg]').value
    }

    registerWatchListToServer(wlData).then(result => {
        if (parseInt(result)) {
            alert('관심컨텐츠 등록 성공');
            changeWishListBtn();
        }
    })
})

async function eraseReviewAtServer(wno) {
    try {
        const url = "/watchlist/" + wno;
        const config = {
            method: "delete"
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


document.addEventListener('click', (e) => {
    if (e.target.id == 'minusWishList') {
        let wnoVal = e.target.dataset.wno;
        eraseReviewAtServer(wnoVal).then(result => {
            if (parseInt(result)) {
                alert("관심리스트 삭제 성공");
                changeWishListBtn();
            }
        });
    }
})