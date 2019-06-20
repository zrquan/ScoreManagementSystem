<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/table-page.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">课程管理</h2>
        </div>
    </header>

    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
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

                            <#if message??>
                                <#if message=="添加成功">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert"
                                         style="width: fit-content">
                                        <strong>${message}</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                <#elseif message=="添加失败，务必先完善教师信息">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert"
                                         style="width: fit-content">
                                        <strong>${message}</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </#if>
                            </#if>

                            <div class="row">
                                <!-- 查询功能 -->
                                <div class="col-sm-7">
                                    <form action="" id="search" class="form-group" method="post">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-outline-secondary dropdown-toggle"
                                                        aria-expanded="false"> 查询 <span class="caret"></span>
                                                </button>
                                                <div class="dropdown-menu" x-placement="bottom-start"
                                                     style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                                    <button onclick="searchCourse(this)" data-value="teacher"
                                                            class="dropdown-item">教师
                                                    </button>
                                                    <button onclick="searchCourse(this)" data-value="type"
                                                            class="dropdown-item">类型
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" name="content">
                                        </div>
                                    </form>
                                </div>
                                <!-- 添加课程 -->
                                <button type="button" data-toggle="modal" data-target="#addCourse"
                                        class="col-sm-1 btn btn-primary"
                                        style="height: fit-content"><strong>新课程</strong>
                                </button>
                                <!-- 创建新课程 -->
                                <div id="addCourse" tabindex="-1" role="dialog" aria-labelledby="addCourseTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addCourseTitle" class="modal-title">添加课程信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/course" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>名称</label>
                                                        <input name="name" type="text" placeholder="Course Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>教师</label>
                                                            <input name="teacherName" type="text"
                                                                   placeholder="Teacher's Name"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>类型</label>
                                                            <select name="type" class="form-control">
                                                                <option>专必</option>
                                                                <option>公必</option>
                                                                <option>专选</option>
                                                                <option>公选</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>学分</label>
                                                            <input name="credit" type="number" placeholder="Credit"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>学时</label>
                                                            <input name="period" type="number" placeholder="Period"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">
                                                        确定
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 表格 -->
                            <div class="table-responsive">
                                <table id="main" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>名称</th>
                                        <th>教师</th>
                                        <th>类型</th>
                                        <th>学分</th>
                                        <th>学时</th>
                                    </tr>
                                    </thead>
                                    <tbody id="result">
                                    <#-- 变量声明 -->
                                    <#if courses??>
                                        <#assign text>${courses}</#assign>
                                        <#assign coursesJson=text?eval />
                                        <#list coursesJson as course>
                                            <tr>
                                                <td>${course.name}</td>
                                                <#if course.teacher??>
                                                    <td>${course.teacher.name}</td>
                                                <#else>
                                                    <td></td>
                                                </#if>
                                                <td>${course.type}</td>
                                                <td>${course.credit}</td>
                                                <td>${course.period}</td>
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
                <div class="col-lg-1"></div>
            </div>
        </div>
    </section>

    <script>
        function searchCourse(option) {
            let params = {};
            params.content = $("#search input").val();
            let condition = option.getAttribute("data-value");
            $.ajax({
                async: false,
                type: "POST",
                url: "${ctx}/manager/search/course/" + condition,
                data: params,
                dataType: "json",
                success: function (data) {
                    $("#result tr").remove();// 删除ID=“result”标签的字标签tr下所有内容
                    // 以下代码为循环布局
                    for (let i in data) {
                        const trtd = "<td>" + data[i].name + "</td><td>"
                            + data[i].teacher.name + "</td><td>"
                            + data[i].type + "</td><td>"
                            + data[i].credit + "</td><td>"  // 商品名
                            + data[i].period + "</td><td>"  // 商品价格
                            + "</td>"; // 商品折后价
                        // 将以上标签动态添加到tbody中进行展示
                        $("#main tbody").append("<tr>" + trtd + "</tr>");
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
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