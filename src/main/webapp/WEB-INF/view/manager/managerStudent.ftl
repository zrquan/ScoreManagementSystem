<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/table-page.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">学生管理</h2>
        </div>
    </header>

    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
                                    <a href="javascript:void(0)" class="dropdown-item export">
                                        <i class="fa fa-gear"></i>Export
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-7">
                                    <form action="${ctx}/manager/searchStudent" class="form-group" method="post">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="submit"
                                                        class="btn btn-outline-secondary"
                                                        aria-expanded="false"><span class="icon-search"></span>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control" name="content">
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table id="main" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>名字</th>
                                        <th>学号</th>
                                        <th>专业</th>
                                        <th>班别</th>
                                        <th>已获学分</th>
                                        <th>平均绩点</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#-- 变量声明 -->
                                    <#if students??>
                                        <#assign text>${students}</#assign>
                                        <#assign studentsJson=text?eval />
                                        <#list studentsJson as student>
                                            <tr>
                                                <td>${student.name}</td>
                                                <td>${student.number}</td>
                                                <td>${student.major.name}</td>
                                                <td>${student.clazz}</td>
                                                <td>${student.credit!""}</td>
                                                <td>${student.gpa!""}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <span id="spanFirst"><< </span> <span id="spanPre">pre</span> <span
                                    id="spanNext">next</span> <span id="spanLast"> >></span> <span
                                    id="spanPageNum"></span>/<span id="spanTotalPage"></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </section>

    <script>
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
    </script>

</@manager>
