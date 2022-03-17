async function postReviewToServer(rvData) {
  try {
    const url = "/mreview/post";
    const config = {
      method: "post",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: JSON.stringify(rvData),
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById("rvPostBtn").addEventListener("click", () => {
  const email = document.querySelector("input[name=email]");
  const profileName = document.querySelector("input[name=profileName]");
  const content = document.querySelector("textarea[name=rvContent]");
  const score = document.querySelector("input[name=rvScore]:checked");

  if (content.value == "" || content.value == null) {
    alert("리뷰 내용을 입력해주세요");
    content.focus();
    return false;
  } else if (score == "" || score == null) {
    alert("별점을 선택해주세요");
    return false;
  } else {
    let rvData = {
      mno: mno,
      email: email.value,
      profileName: profileName.value,
      score: score.value,
      content: content.value,
    };

    postReviewToServer(rvData).then((result) => {
      if (parseInt(result)) {
        alert("댓글 등록 성공");
        document.querySelector("textarea[name=rvContent]").value = "";
        document.querySelector("input[name=rvScore]:checked").checked = false;
      }
      getReviewList(rvData.mno);
    });
  }
});

async function spreadReviewFromServer(gno, pageNo) {
  try {
    const resp = await fetch("/mreview/" + gno + "/" + pageNo);
    const customPagingHandler = await resp.json();
    return await customPagingHandler;
  } catch (error) {
    console.log(error);
  }
}

function printPagination(prev, startPage, pgvo, endPage, next) {
  let pgn = document.getElementById('rvPaging');
  pgn.innerHTML = '';
  let ul = '';
  if (prev) {
      ul += `<li class="page-item">
      <a href="${startPage -1}" class="page-link">Prev</a></li>`;
  }

  for (let i = startPage; i <= endPage; i++) {
      ul += `<li class="page-item ${pgvo.pageNo == i ? 'active' : ''}"
      aria-current="page"><a class="page-link" href="${i}">${i}</a></li>`;
  }

  if (next) {
      ul += `<li class="page-item">
      <a class="page-link" href="${endPage + 1}">Next</a></li>`;
  }
  pgn.innerHTML = ul;
}

function getReviewList(gno, pageNo = 1) {
  spreadReviewFromServer(gno, pageNo).then((result) => {
    const ul = document.getElementById("rvListArea");
    if (result.reviewList.length) {
      ul.innerText = "";
      for (const rvo of result.reviewList) {
        let li = `<li data-rno=${rvo.rno} class="mb-2 list-group-item d-flex justify-content-between align-items-start" style="background-color: rgb(9, 11, 19); color: white;">`;
        li += `<div class="ms-2 me-auto" style="line-height: 1;">`;
        li += `<div class="fw-bold mb-3">${rvo.profileName} (${rvo.email})&nbsp&nbsp&nbsp<span class="my-goods-company">${rvo.modAt}</span></div>
                ${rvo.content}</div>`;
        li += `<span class="badge my-bg rounded-pill">`;
        li += `${
          rvo.score == 5
            ? '<i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i>'
            : rvo.score == 4
            ? '<i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i>'
            : rvo.score == 3
            ? '<i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i>'
            : rvo.score == 2
            ? '<i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i>'
            : '<i class="fas fa-star" style="color: yellow;"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i><i class="fas fa-star" style="color: rgb(49, 52, 62);"></i>'
        }`;
        li += `<div><a class="my-btn mt-3 del" style="text-decoration: none;">삭제</a></div></li>`;
        ul.innerHTML += li;
      }
    }
    printPagination(result.prev, result.startPage, result.pgvo, result.endPage, result.next);
  });
}

async function eraseCommentAtServer(grno) {
  try {
    const url = "/mreview/" + grno;
    const config = {
      method: "delete",
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.addEventListener("click", (e) => {
  if (e.target.classList.contains("del")) {
    let li = e.target.closest("li");
    let rnoVal = li.dataset.rno;
    eraseCommentAtServer(rnoVal).then((result) => {
      alert("리뷰 삭제 성공");
      getReviewList(mno);
    });
  } else if (e.target.classList.contains('page-link')) {
    e.preventDefault();
    getReviewList(mno, e.target.getAttribute('href'));
  }
});