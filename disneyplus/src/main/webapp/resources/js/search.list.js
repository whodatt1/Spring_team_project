
async function spreadSearchListFromServer(pageNo) {
    try {
        const resp = await fetch('/search/'+ pageNo);
        const customPagingHandler = await resp.json();
        return await customPagingHandler;
    } catch (error) {
        console.log(error);
    }
}

function getSearchList(pageNo=1) {
    spreadSearchListFromServer(pageNo).then(result => {
        console.log(result);
        const div = document.getElementById('searchListArea');
        if (result.searchList.length) {
            if (pageNo == 1) {
                div.innerHTML = '';
            }
            for (const mvo of result.searchList) {
                let a = `<a href="/${mvo.movie > 0 ? 'movies' : 'series'}/detail?mno=${mvo.mno}" class="col-md-15 col-sm-3 my-poster" style="background-image: url(../../../../fileUpload/${mvo.posterImg});"></a>`
                div.innerHTML += a;
            }
            let moreBtn = document.getElementById('moreBtn');
            if (result.pgvo.pageNo < result.endPage || result.next) {
                moreBtn.style.visibility = 'visible';
                moreBtn.dataset.pageNo = pageNo + 1;
            } else {
                moreBtn.style.visibility = 'hidden';
            }
        }
    })
}

document.addEventListener('click', (e) => {
    if (e.target.id == 'moreBtn') {
        getSearchList(parseInt(e.target.dataset.pageNo));
    }
})

async function spreadSearchResultListFromServer(type, keyword, pageNo=1) {
    try {
        const resp = await fetch('/search/'+ type + '/' + keyword + '/' + pageNo);
        const customPagingHandler = await resp.json();
        return await customPagingHandler;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('searchKeyword').addEventListener('keyup', () => {
    let type = document.getElementById('searchType').value;
    let keyword = document.getElementById('searchKeyword').value;
    if (keyword == '') {
        getSearchList();
    } else {
        spreadSearchResultListFromServer(type, keyword, pageNo=1).then(result => {
                console.log(result);
                const div = document.getElementById('searchListArea');
                if (result.searchList.length) {
                    if (pageNo == 1) {
                        div.innerHTML = '';
                    }
                    for (const mvo of result.searchList) {
                        let a = `<a href="/${mvo.movie > 0 ? 'movies' : 'series'}/detail?mno=${mvo.mno}" class="col-md-15 col-sm-3 my-poster" style="background-image: url(../../../../fileUpload/${mvo.posterImg});"></a>`
                        div.innerHTML += a;
                    }
                    let moreBtn = document.getElementById('moreBtn');
                    if (result.pgvo.pageNo < result.endPage || result.next) {
                        moreBtn.style.visibility = 'visible';
                        moreBtn.dataset.pageNo = pageNo + 1;
                    } else {
                        moreBtn.style.visibility = 'hidden';
                    }
                }
    
        });
    }
})