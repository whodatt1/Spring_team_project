async function spreadWatchListFromServer(email, profileName, pageNo) {
    try {
        const resp = await fetch('/watchlist/'+ email + '/' + profileName + '/' + pageNo);
        const customPagingHandler = await resp.json();
        return await customPagingHandler;
    } catch (error) {
        console.log(error);
    }
}

function getWatchList(email, profileName, pageNo=1) {
    spreadWatchListFromServer(email, profileName, pageNo).then(result => {
        console.log(result);
        const div = document.getElementById('watchListArea');
        if (result.watchList.length) {
            if (pageNo == 1) {
                div.innerHTML = '';
            }
            for (const mvo of result.watchList) {
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
};

document.addEventListener('click', (e) => {
    if (e.target.id == 'moreBtn') {
        getWatchList(email, profileName, parseInt(e.target.dataset.pageNo));
    }
});