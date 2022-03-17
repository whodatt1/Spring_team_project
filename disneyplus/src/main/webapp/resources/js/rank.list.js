async function spreadRankListFromServer(page) {
    try {
        const resp = await fetch('/rank/'+ page);
        const rankPagingHandler = await resp.json();
        return await rankPagingHandler;
    } catch (error) {
        console.log(error);
    }
}

function printPagingArrow(prev, pgvo, next) {
    let arrowArea = document.getElementById('arrowArea');
    arrowArea.innerHTML = '';
    let div = '';
    if (prev) {
         div += `<a class="page prev my-arrow-prev my-btn" onclick="getRankList(${pgvo.pageNo-1})"><i class="fas fa-chevron-left"></i> 이전</a>`;
    }

    if (next) {
        div += `<a class="my-arrow-next page next my-btn" onclick="getRankList(${pgvo.pageNo+1})">다음 <i class="fas fa-chevron-right"></i></a>`;
    }
    
    arrowArea.innerHTML = div;
}

function getRankList(pageNo=1) {
    console.log(typeof pageNo);
    spreadRankListFromServer(pageNo).then(result => {
        const div = document.getElementById('rankListArea');
        if (result.rankList.length) {
            div.innerHTML = '';
            let rankNum = pageNo == 1 ? 1 : pageNo == 2 ? 6 : pageNo == 3 ? 11 : 16;
            for (const mvo of result.rankList) {
                let a = `<a href="/${mvo.movie > 0 ? 'movies' : 'series'}/detail?mno=${mvo.mno}" class="col-md-15 col-sm-3 my-poster" style="background-image: url(../../../../fileUpload/${mvo.posterImg});"><img class="my-rank" src="/resources/img/${rankNum}.png"></a>`
                div.innerHTML += a;
                rankNum += 1;
            }
            printPagingArrow(result.prev, result.pgvo, result.next);
        }
    })
}
