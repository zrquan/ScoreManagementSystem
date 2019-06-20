//分页
var theTable = document.getElementById("main");
var totalPage = document.getElementById("spanTotalPage");
var pageNum = document.getElementById("spanPageNum");

var spanPre = document.getElementById("spanPre");
var spanNext = document.getElementById("spanNext");
var spanFirst = document.getElementById("spanFirst");
var spanLast = document.getElementById("spanLast");

var numberRowsInTable = theTable.rows.length;
var pageSize = 10;
var page = 1;

//next
function next() {

    hideTable();

    currentRow = pageSize * page;
    maxRow = currentRow + pageSize;
    if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
    for (var i = currentRow; i < maxRow; i++) {
        theTable.rows[i].style.display = '';
    }
    page++;


    if (maxRow == numberRowsInTable) {
        nextText();
        lastText();
    }
    showPage();
    preLink();
    firstLink();
}

//上一页
function pre() {

    hideTable();

    page--;

    currentRow = pageSize * page;
    maxRow = currentRow - pageSize;
    if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
    for (var i = maxRow; i < currentRow; i++) {
        theTable.rows[i].style.display = '';
    }

    if (maxRow == 0) {
        preText();
        firstText();
    }
    showPage();
    nextLink();
    lastLink();
}

//first
function first() {
    hideTable();
    page = 1;
    for (var i = 0; i < pageSize; i++) {
        theTable.rows[i].style.display = '';
    }
    showPage();


    preText();
    nextLink();
    lastLink();
}

//last
function last() {
    hideTable();
    page = pageCount();
    currentRow = pageSize * (page - 1);
    for (var i = currentRow; i < numberRowsInTable; i++) {
        theTable.rows[i].style.display = '';
    }
    showPage();


    preLink();
    nextText();
    firstLink();
}

function hideTable() {
    for (var i = 0; i < numberRowsInTable; i++) {
        theTable.rows[i].style.display = 'none';
    }
}

function showPage() {
    pageNum.innerHTML = page;
}

//总共页数
function pageCount() {
    var count = 0;
    if (numberRowsInTable % pageSize != 0) count = 1;
    return parseInt(numberRowsInTable / pageSize) + count;
}

//显示链接
function preLink() {
    spanPre.innerHTML = "<a href='javascript:pre();'>pre</a>";
}

function preText() {
    spanPre.innerHTML = "pre";
}


function nextLink() {
    spanNext.innerHTML = "<a href='javascript:next();'>next</a>";
}

function nextText() {
    spanNext.innerHTML = "next";
}


function firstLink() {
    spanFirst.innerHTML = "<a href='javascript:first();'><< </a>";
}

function firstText() {
    spanFirst.innerHTML = "<< ";
}


function lastLink() {
    spanLast.innerHTML = "<a href='javascript:last();'> >></a>";
}

function lastText() {
    spanLast.innerHTML = " >>";
}

//隐藏表格
function hide() {
    for (var i = pageSize; i < numberRowsInTable; i++) {
        theTable.rows[i].style.display = 'none';
    }


    totalPage.innerHTML = pageCount();
    pageNum.innerHTML = '1';


    nextLink();
    lastLink();
}

hide();
