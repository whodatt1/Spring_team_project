let genre;
let currentPage;
const ul = document.getElementById("movieListArea");

async function getListofGenre(genre, page) {
  try {
    const resp = await fetch("/movies/" + genre + "/" + page);
    const pageHandler = await resp.json();
    return await pageHandler;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById("action").addEventListener("click", (e) => {
  e.preventDefault();
  currentPage = 1;
  genre = "action";
  getGenreList(genre, currentPage);
});

document.getElementById("moreBtn").addEventListener("click", moreBtnPlusPage);

function moreBtnPlusPage() {
  getGenreList(genre, currentPage + 1);
}

function getGenreList(genre, page = 1) {
  getListofGenre(genre, page).then((result) => {
    console.log(result);
    if (result.list.length) {
      if (page == 1) {
        ul.innerHTML = "";
      }
      if (result.list.length) {
        for (let mvo of result.list) {
          let a = `<a
           href="/movies/detail?mno=${mvo.mno}&pageNo=${result.pgvo.pageNo}&qty=${result.pgvo.qty}&genre=${result.pgvo.genre}"
           class="col-md-15-me col-sm-3 my-posters"
           style="background-image: url(../../../../fileUpload/${mvo.posterImg});">`;
          ul.innerHTML += a;
        }
      }
      let moreBtn = document.getElementById("moreBtn");

      if (result.pgvo.pageNo < result.endPage || result.next) {
        moreBtn.style.visibility = "visible";
        // moreBtn.dataset.page = parseInt(page2) + 1;
        currentPage = page;
      } else {
        moreBtn.style.visibility = "hidden";
      }
    }
  });
}

document.getElementById("animation").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "animation";
  getGenreList(genre, page);
});

document.getElementById("drama").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "drama";
  getGenreList(genre, page);
});

document.getElementById("comedy").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "comedy";
  getGenreList(genre, page);
});

document.getElementById("SF").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "SF";
  getGenreList(genre, page);
});

document.getElementById("thriller").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "thriller";
  getGenreList(genre, page);
});

document.getElementById("documentary").addEventListener("click", (e) => {
  e.preventDefault();
  page = 1;
  genre = "documentary";
  getGenreList(genre, page);
});
