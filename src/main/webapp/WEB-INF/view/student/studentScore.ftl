<#include "studentMacro.ftl">
<@student keywords="学生成绩" js=["js/mycharts.js"]>

    <!-- 模块标题 -->
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">成绩详情</h2>
        </div>
    </header>

    <!-- 内容区 -->
    <section class="charts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!-- 课程成绩 -->
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
                                    <a href="javascript:void(0)" class="dropdown-item export"
                                       onclick="exportExcel('#stable')">
                                        <i class="fa fa-gear"></i>Export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩查询</h3>
                        </div>

                        <div class="card-body">
                            <!-- 查询表单 -->
                            <div class="d-inline-flex">
                                <form class="form-inline">
                                    <div class="form-group mr-3">
                                        <label>培养方案：</label>
                                        <select class="form-control" name="">
                                            <option>主修</option>
                                            <option>辅修</option>
                                            <option>双学位</option>
                                        </select>
                                    </div>

                                    <div class="form-group mr-3">
                                        <label>学年：</label>
                                        <select class="form-control" name="">
                                            <option>2018-2019</option>
                                            <option>2017-2018</option>
                                            <option>2016-2017</option>
                                        </select>
                                    </div>

                                    <div class="form-group mr-3">
                                        <label>学期：</label>
                                        <select class="form-control" name="">
                                            <option>第一学期</option>
                                            <option>第二学期</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">查询</button>
                                </form>
                            </div>
                            <div class="d-inline-flex ml-5">
                                <div class="mb-3">
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom1" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom1">专必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom2" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom2">公必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom3" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom3">专选</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom4" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom4">公选</label>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <#assign scoreText>${score}</#assign>
                                <#assign scoreJson=scoreText?eval />
                                <table id="stable" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程</th>
                                        <th>类型</th>
                                        <th>教师</th>
                                        <th>分数</th>
                                        <th>绩点</th>
                                        <th>排名</th>
                                        <th>学年</th>
                                        <th>学期</th>
                                        <th>考试方式</th>
                                        <th>是否通过</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <#list scoreJson as record>
                                        <tr>
                                            <td>${record.course.name}</td>
                                            <td>${record.course.type}</td>
                                            <td>${record.course.teacher.name}</td>
                                            <td>${record.value}</td>
                                            <#assign gpa>${(record.value-50)/10}</#assign>
                                            <td>${gpa}</td>
                                            <td>${record.crank} / ${record.course.studentCount!""}</td>
                                            <td>${record.course.year} - ${record.course.year?eval + 1}</td>
                                            <td>${record.course.term!""}</td>
                                            <td>${record.course.testForm!""}</td>
                                            <#assign isPassed>${record.identity}</#assign>
                                            <td>
                                                <#if isPassed == "1">
                                                    不及格
                                                <#else>
                                                    及格
                                                </#if>
                                            </td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <ul class="pagination" id="pagination" style="justify-content: center"></ul>
                        </div>
                    </div>
                    <!-- 学分详情 -->
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a
                                            href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">学分详情</h3>
                        </div>

                        <table class="table table-bordered ranking-all ng-scope" ng-repeat="item in creditSituationList"
                               style="text-align: center">
                            <tbody>
                            <#assign creditText>${credit}</#assign>
                            <#assign creditJson=creditText?eval />
                            <tr>
                                <td rowspan="2" style="    vertical-align: middle;">课程类别</td>
                                <td colspan="3" class="ng-binding">2018-2019学年第一学期完成情况</td>
                                <td colspan="3">全部完成情况</td>
                            </tr>
                            <tr>
                                <td>已修学分</td>
                                <td>已获学分</td>
                                <td>平均学分绩点</td>
                                <td>已修学分</td>
                                <td>已获学分</td>
                                <td>平均学分绩点</td>
                            </tr>

                            <tr>
                                <td>公必</td>
                                <#assign
                                cnTotal = creditJson.cncredit.totalCredit
                                cnObtain = creditJson.cncredit.totalCredit
                                >
                                <#if creditJson.cncredit.courseCount != 0>
                                    <#assign cnAverage = cnObtain/creditJson.cncredit.courseCount>
                                <#else>
                                    <#assign cnAverage = 0.00>
                                </#if>
                                <td class="ng-binding">${cnTotal}</td>
                                <td class="ng-binding">${cnObtain}</td>
                                <td class="ng-binding">${cnAverage}</td>
                                <td class="ng-binding">${cnTotal}</td>
                                <td class="ng-binding">${cnObtain}</td>
                                <td class="ng-binding">${cnAverage}</td>
                            </tr>
                            <tr>
                                <td>专必</td>
                                <#assign
                                pnTotal = creditJson.pncredit.totalCredit
                                pnObtain = creditJson.pncredit.totalCredit
                                >
                                <#if creditJson.pncredit.courseCount != 0>
                                    <#assign pnAverage = pnObtain/creditJson.pncredit.courseCount>
                                <#else>
                                    <#assign pnAverage = 0.00>
                                </#if>
                                <td class="ng-binding">${pnTotal}</td>
                                <td class="ng-binding">${pnObtain}</td>
                                <td class="ng-binding">${pnAverage}</td>
                                <td class="ng-binding">${pnTotal}</td>
                                <td class="ng-binding">${pnObtain}</td>
                                <td class="ng-binding">${pnAverage}</td>
                            </tr>
                            <tr>
                                <td>公选</td>
                                <#assign
                                csTotal = creditJson.cscredit.totalCredit
                                csObtain = creditJson.cscredit.totalCredit
                                >
                                <#if creditJson.cscredit.courseCount != 0>
                                    <#assign csAverage = csObtain/creditJson.cscredit.courseCount>
                                <#else>
                                    <#assign csAverage = 0.00>
                                </#if>
                                <td class="ng-binding">${csTotal}</td>
                                <td class="ng-binding">${csObtain}</td>
                                <td class="ng-binding">${csAverage}</td>
                                <td class="ng-binding">${csTotal}</td>
                                <td class="ng-binding">${csObtain}</td>
                                <td class="ng-binding">${csAverage}</td>
                            </tr>
                            <tr>
                                <td>专选</td>
                                <#assign
                                psTotal = creditJson.pscredit.totalCredit
                                psObtain = creditJson.pscredit.totalCredit
                                >
                                <#if creditJson.pscredit.courseCount != 0>
                                    <#assign psAverage = psObtain/creditJson.pscredit.courseCount>
                                <#else>
                                    <#assign psAverage = 0.00>
                                </#if>
                                <td class="ng-binding">${psTotal}</td>
                                <td class="ng-binding">${psObtain}</td>
                                <td class="ng-binding">${psAverage}</td>
                                <td class="ng-binding">${psTotal}</td>
                                <td class="ng-binding">${psObtain}</td>
                                <td class="ng-binding">${psAverage}</td>
                            </tr>

                            <tr>
                                <td>合计</td>
                                <td class="ng-binding">${cnTotal + csTotal + pnTotal + psTotal}</td>
                                <td class="ng-binding">${cnObtain + csObtain + pnObtain + psObtain}</td>
                                <td class="ng-binding">${cnAverage + csAverage + pnAverage + psAverage}</td>
                                <td class="ng-binding">${cnTotal + csTotal + pnTotal + psTotal}</td>
                                <td class="ng-binding">${cnObtain + csObtain + pnObtain + psObtain}</td>
                                <td class="ng-binding">${cnAverage + csAverage + pnAverage + psAverage}</td>
                            </tr>
                            <tr>
                                <td>必修、专选平均绩点</td>
                                <td colspan="2" class="ng-binding">${(pnObtain + cnTotal + psTotal)/3}</td>
                                <#-- TODO 学分排名-->
                                <td class="ng-binding">57/87</td>
                                <td colspan="2" class="ng-binding">${(pnObtain + cnTotal + psTotal)/3}</td>
                                <td class="ng-binding">60/87</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- 学分详情 -->
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i
                                            class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3"
                                     class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a
                                            href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">学分详情</h3>
                        </div>

                        <div class="container">
                            <table class="table table-hover" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th scope="col" style="width:10%;">类型</th>
                                    <th scope="col" style="width:10%;">平均学分绩点</th>
                                    <th scope="col" style="width:10%;">应修学分</th>
                                    <th scope="col" style="width:10%;">已修学分</th>
                                    <th scope="col" style="width:10%;">已获学分</th>
                                    <th scope="col" style="width:10%;">未获学分</th>
                                    <th scope="col" style="width:20%;">完成度</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">公必</th>
                                    <td>${cnAverage}</td>
                                    <td>${major.comNeed}</td>
                                    <td>${cnTotal}</td>
                                    <td>${cnObtain}</td>
                                    <td>${major.comNeed-cnObtain}</td>
                                    <td>
                                        <#assign progress4 = cnObtain / major.comNeed * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${cnObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.comNeed}"
                                                 style="width: ${progress4}%;">
                                                ${progress4}% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">专必</th>
                                    <td>${pnAverage}</td>
                                    <td>${major.proNeed}</td>
                                    <td>${pnTotal}</td>
                                    <td>${pnObtain}</td>
                                    <td>${major.proNeed-pnObtain}</td>
                                    <td>
                                        <#assign progress4 = pnObtain / major.proNeed * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${pnObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.proNeed}"
                                                 style="width: ${progress4}%;">
                                                ${progress4}% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">公选</th>
                                    <td>${csAverage}</td>
                                    <td>${major.comSelect}</td>
                                    <td>${csTotal}</td>
                                    <td>${csObtain}</td>
                                    <td>${major.comSelect-csObtain}</td>
                                    <td>
                                        <#assign progress4 = csObtain / major.comSelect * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${csObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.comSelect}"
                                                 style="width: ${progress4}%;">
                                                ${progress4}% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">专选</th>
                                    <td>${psAverage}</td>
                                    <td>${major.proSelect}</td>
                                    <td>${psTotal}</td>
                                    <td>${psObtain}</td>
                                    <td>${major.proSelect-psObtain}</td>
                                    <td>
                                        <#assign progress4 = psObtain / major.proSelect * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${psObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.proSelect}"
                                                 style="width: ${progress4}%;">
                                                ${progress4}% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">总览</th>
                                    <#assign
                                    totalNeed = major.proNeed + major.comNeed + major.proSelect + major.comSelect
                                    totalObtain = pnObtain + psObtain + cnObtain + csObtain
                                    totalAverage = (pnAverage + psAverage + cnAverage + csAverage) / 4
                                    >
                                    <td>${totalAverage}</td>
                                    <td>${totalNeed}</td>
                                    <td>${pnTotal + psTotal + cnTotal + csTotal}</td>
                                    <td>${totalObtain}</td>
                                    <td>${totalNeed - totalObtain}</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${totalObtain}"
                                                 aria-valuemin="0" aria-valuemax="${totalNeed}"
                                                 style="width: ${totalObtain / totalNeed}%;">
                                                ${totalObtain / totalNeed}% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 可视化 -->
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- 线图 -->
                            <div class="line-chart-example card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false"
                                                class="dropdown-toggle"><i
                                                    class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard1"
                                             class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i
                                                        class="fa fa-times"></i>Close</a><a href="#"
                                                                                            class="dropdown-item edit">
                                                <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">成绩分布</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chartjs-size-monitor"
                                         style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                        <div class="chartjs-size-monitor-expand"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:1000000;height:1000000;left:0;top:0"></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                        </div>
                                    </div>
                                    <canvas id="scoreDis" width="642" height="321"
                                            class="chartjs-render-monitor"
                                            style="display: block; width: 642px; height: 321px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="work-amount card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false" class="dropdown-toggle"><i
                                                    class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard1"
                                             class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i
                                                        class="fa fa-times"></i>Close</a><a
                                                    href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">平均绩点</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chart text-center">
                                        <div class="chartjs-size-monitor"
                                             style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                            <div class="chartjs-size-monitor-expand"
                                                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                                <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                            </div>
                                            <div class="chartjs-size-monitor-shrink"
                                                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                                <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                            </div>
                                        </div>
                                        <div class="text"><strong>${totalAverage}</strong><br><span>GPA</span></div>
                                        <canvas id="gpaDis" width="642" height="321" class="chartjs-render-monitor"
                                                style="display: block; width: 642px; height: 321px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        var scoreJson = JSON.parse("${scoreText?js_string}");
        var creditList = [${pnAverage}, ${psAverage}, ${cnAverage}, ${csAverage}];

        var page = 1;
        //当前页，默认等于1
        var pageSize = 10;
        var jsonObj = JSON.parse("${scoreText?js_string}");

        function loadPagination() {
            let s = "";
            //用于分页标签嵌入
            let minPage = 1;
            //最小页码
            let maxPage = 1;
            //最大页码
            let totalRecord = jsonObj.length;
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
                if (i <= jsonObj.length - 1) {
                    let identity = jsonObj[i].identity;
                    let isPassed = "不及格";
                    if (identity === 0)
                        isPassed = "及格";
                    let score = parseFloat(jsonObj[i].value);
                    let credit = (score - 50) / 10;
                    let year = parseInt(jsonObj[i].course.year);
                    let yearStr = `${year} - ${year + 1}`;
                    str += `<tr>
                            <td>${jsonObj[i].course.name}</td>
                            <td>${jsonObj[i].course.type}</td>
                            <td>${jsonObj[i].course.teacher.name}</td>
                            <td>${jsonObj[i].value}</td>
                            <td>${credit}</td>
                            <td>${jsonObj[i].crank / jsonObj[i].course.studentCount}</td>
                            <td>${yearStr}</td>
                            <td>${jsonObj[i].course.term}</td>
                            <td>${jsonObj[i].course.testForm}</td>
                            <td>${isPassed}</td>
                        </tr>`;
                }
            }
            $("#tbody").html(str);
        }

        </#noparse>

        function exportExcel(id) {
            $(id).table2excel({
                // 不被导出的表格行的CSS class类
                exclude: ".noExl",
                // 导出的Excel文档的名称
                name: "Excel Document Name",
                // Excel文件的名称
                filename: "test",
                //文件后缀名
                fileext: ".xls",
                //是否排除导出图片
                exclude_img: false,
                //是否排除导出超链接
                exclude_links: false,
                //是否排除导出输入框中的内容
                exclude_inputs: false
            })
        }
    </script>
</@student>
