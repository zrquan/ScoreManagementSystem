<#include "teacherMacro.ftl">
<@teacher keywords="教师课程查看" js=["js/edit.js"]>

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">成绩详情</h2>
        </div>
    </header>

    <section class="charts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
                                    <a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                    <a href="javascript:void(0)" class="dropdown-item edit" onclick="exportExcel()"><i
                                                class="fa fa-gear"></i>export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩查询</h3>
                            <div style="margin-left: 20px">
                                <button id="btn" class="btn btn-primary" >提交</button>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="scoreEditTable" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>成绩</th>
                                        <th>绩点</th>
                                        <th>排名</th>
                                        <th>是否及格</th>
                                        <th>审核状态</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <tr>
                                        <td>16369001</td>
                                        <td>甲</td>
                                        <td>61</td>
                                        <td>1.1</td>
                                        <td></td>
                                        <td>是</td>
                                        <td>未审核</td>
                                        <td>
                                            <button id="btn" class="btn btn-primary" onclick="edit(this);">编辑</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>16369002</td>
                                        <td>乙</td>
                                        <td>59</td>
                                        <td>0</td>
                                        <td></td>
                                        <td>否</td>
                                        <td>未审核</td>
                                        <td>
                                            <button id="btn" class="btn btn-primary" onclick="edit(this);">编辑</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>16369011</td>
                                        <td>丙</td>
                                        <td>69</td>
                                        <td>1.9</td>
                                        <td></td>
                                        <td>是</td>
                                        <td>未审核</td>
                                        <td>
                                            <button id="btn" class="btn btn-primary" onclick="edit(this);">编辑</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table
                            </div>
                        </div>
                        <div class="card-footer">
                            <ul class="pagination" id="pagination" style="justify-content: center"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        var page = 1;
        //当前页，默认等于1
        var pageSize = 10;

        function loadPagination() {
            let s = "";
            //用于分页标签嵌入
            let minPage = 1;
            //最小页码
            let maxPage = 1;
            //最大页码
            let totalRecord = 3
            maxPage = Math.ceil(totalRecord / pageSize);
            //加载上一页
            s += "<li class='page-item'><a class='page-link' id='prePage'>&laquo;</a></li>";


            //加载分页列表
            for (let i = page - 4; i < page + 5; i++) {
                //i代表列表的页数
                if (i >= minPage && i <= maxPage) {
                    if (i === page) {
                        s += " <li class='page-item active'><a class='page-link'>" + i + "</a></li>"
                    } else {
                        s += " <li class='page-item'><a class='page-link'>" + i + "</a></li>";
                    }
                }
            }
            //加载下一页
            s += "<li class='page-item'><a class='page-link' id='nextPage'>&raquo;</a></li>";
            load();
            $("#pagination").html(s);
            //给列表加上点击事件
            $(".page-item").click(function () {
                //改变当前页数
                //把点击的页数，扔给page（当前页）
                page = $(this).text();
                console.log("当前页数:" + page);
                //page获取了当前页，重新加载以下方法
                //调用load方法
                load();
                //把加载数据封装成一个方法
                loadPagination();
                //加载分页信息方法
            });
            //上一页点击事件
            $("#prePage").click(function () {
                //改变当前页
                console.log("i was used");
                if (page > 1) {
                    //如果不是第一页
                    page = parseInt(page) - 1;
                }
                //            page获取了当前页，重新加载以下方法
                //调用load方法
                loadPagination();
                load();
                //把加载数据封装成一个方法
                //加载分页信息方法
            });
            //下一页点击事件
            $("#nextPage").click(function () {
                //alert(maxPage);
                if (page < maxPage) {
                    //如果不是最后一页
                    page = parseInt(page) + 1;
                }
                //page获取了当前页，重新加载以下方法
                //调用load方法
                load();
                //把加载数据封装成一个方法
                loadPagination();
                //加载分页信息方法
            });
        }

        window.onload = loadPagination;

        <#noparse>

        function load() {
            //有page传进来
            let str = "";
            for (let i = (page - 1) * pageSize; i < (page - 1) * pageSize + pageSize; i++) {
            }

            //$("#tbody").html(str);
        }

        function edit(data) {
            let mod = data.parentElement.parentElement.children[2];
            mod.innerHTML = "<input id='newScore' type=text />";
            data.parentElement.innerHTML = "<button id=\"btn\" class=\"btn btn-primary\" onclick=\"confirm(this);\">确认</button>";
        }

        function confirm(data) {
            let newScore = document.getElementById("newScore").value;
            if(newScore>=0&&newScore<=100){
                let mod = data.parentElement.parentElement.children[2];
                mod.innerHTML = newScore;
                let isPassed=data.parentElement.parentElement.children[5];
                let credit=data.parentElement.parentElement.children[3];
                if(newScore>=60){
                    isPassed.innerHTML="是";
                    credit.innerHTML=(newScore-50)/10;
                }
                else{
                    isPassed.innerHTML="否";
                    credit.innerHTML="-";
                }
                data.parentElement.parentElement.style.background='pink';
                data.parentElement.innerHTML = "<button id=\"btn\" class=\"btn btn-primary\" onclick=\"edit(this);\">编辑</button>";
            }
        }
        </#noparse>
    </script>
</@teacher>