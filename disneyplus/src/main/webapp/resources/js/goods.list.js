function searchParam(key) {
    return new URLSearchParams(location.search).get(key);
};

if (searchParam('company') == 'disney') {
    document.getElementById('disney-collapse').classList.add('show');
    document.getElementById('pixar-collapse').classList.remove('show');
    document.getElementById('marvel-collapse').classList.remove('show');
    document.getElementById('starwars-collapse').classList.remove('show');
    document.getElementById('national-collapse').classList.remove('show');
    document.getElementById('star-collapse').classList.remove('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/disney.png" style="width: 200px;"></img>'
} else if (searchParam('company') == 'pixar') {
    document.getElementById('disney-collapse').classList.remove('show');
    document.getElementById('pixar-collapse').classList.add('show');
    document.getElementById('marvel-collapse').classList.remove('show');
    document.getElementById('starwars-collapse').classList.remove('show');
    document.getElementById('national-collapse').classList.remove('show');
    document.getElementById('star-collapse').classList.remove('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/pixar.png" style="width: 200px;"></img>'
} else if (searchParam('company') == 'marvel') {
    document.getElementById('disney-collapse').classList.remove('show');
    document.getElementById('pixar-collapse').classList.remove('show');
    document.getElementById('marvel-collapse').classList.add('show');
    document.getElementById('starwars-collapse').classList.remove('show');
    document.getElementById('national-collapse').classList.remove('show');
    document.getElementById('star-collapse').classList.remove('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/marvel.png" style="width: 200px;"></img>'
} else if (searchParam('company') == 'starwars') {
    document.getElementById('disney-collapse').classList.remove('show');
    document.getElementById('pixar-collapse').classList.remove('show');
    document.getElementById('marvel-collapse').classList.remove('show');
    document.getElementById('starwars-collapse').classList.add('show');
    document.getElementById('national-collapse').classList.remove('show');
    document.getElementById('star-collapse').classList.remove('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/starwars.png" style="width: 200px;"></img>';
} else if (searchParam('company') == 'national') {
    document.getElementById('disney-collapse').classList.remove('show');
    document.getElementById('pixar-collapse').classList.remove('show');
    document.getElementById('marvel-collapse').classList.remove('show');
    document.getElementById('starwars-collapse').classList.remove('show');
    document.getElementById('national-collapse').classList.add('show');
    document.getElementById('star-collapse').classList.remove('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/national.png" style="width: 200px;"></img>'
} else {
    document.getElementById('disney-collapse').classList.remove('show');
    document.getElementById('pixar-collapse').classList.remove('show');
    document.getElementById('marvel-collapse').classList.remove('show');
    document.getElementById('starwars-collapse').classList.remove('show');
    document.getElementById('national-collapse').classList.remove('show');
    document.getElementById('star-collapse').classList.add('show');
    document.getElementById('goodsLogo').innerHTML = '<img src="/resources/img/star.png" style="width: 200px;"></img>'
}