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
                                    <a href="javascript:void(0)" class="dropdown-item export">
                                        <i class="fa fa-gear"></i>Export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">课程成绩</h3>
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
                                        <input type="checkbox" checked="checked" class="checkbox-template typeFilter">
                                        <label>专必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input type="checkbox" checked="checked" class="checkbox-template typeFilter">
                                        <label>公必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input type="checkbox" checked="checked" class="checkbox-template typeFilter">
                                        <label>专选</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input type="checkbox" checked="checked" class="checkbox-template typeFilter">
                                        <label>公选</label>
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
                                            <td>${(record.course.teacher.name)!""}</td>
                                            <td>${record.value}</td>
                                            <#assign gpa>${(record.value-50)/10}</#assign>
                                            <td>${gpa}</td>
                                            <td>${record.crank} / ${record.course.studentCount!"未统计"}</td>
                                            <td>${record.course.year} - ${record.course.year?eval + 1}</td>
                                            <td>${(record.course.term)!"未知"}</td>
                                            <td>${(record.course.testForm)!"未知"}</td>
                                            <td>
                                                <#if (record.value >= 60)>
                                                    及格
                                                <#else>
                                                    不及格
                                                </#if>
                                            </td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <#--                            <ul class="pagination" id="pagination" style="justify-content: center"></ul>-->
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
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
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
                                cnObtain = creditJson.cncredit.obtainCredit
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
                                pnObtain = creditJson.pncredit.obtainCredit
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
                                csObtain = creditJson.cscredit.obtainCredit
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
                                psObtain = creditJson.pscredit.obtainCredit
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
                                <td>必修、专选平均学分</td>
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
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
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
                                        <#assign progress1 = cnObtain / major.comNeed * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${cnObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.comNeed}"
                                                 style="width: ${progress1}%;">
                                                ${progress1}% 完成
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
                                        <#assign progress2 = pnObtain / major.proNeed * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${pnObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.proNeed}"
                                                 style="width: ${progress2}%;">
                                                ${progress2}% 完成
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
                                        <#assign progress3 = csObtain / major.comSelect * 100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${csObtain}"
                                                 aria-valuemin="0" aria-valuemax="${major.comSelect}"
                                                 style="width: ${progress3}%;">
                                                ${progress3}% 完成
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
                                        <#assign progress5 = (totalObtain/totalNeed)*100>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped"
                                                 role="progressbar"
                                                 aria-valuenow="${totalObtain}"
                                                 aria-valuemin="0" aria-valuemax="${totalNeed}"
                                                 style="width: ${progress5}%;">
                                                ${progress5}% 完成
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
                        <div class="col-lg-7">
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
                                                        class="fa fa-times"></i>Close</a>
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
                        <div class="col-lg-5">
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
                                                        class="fa fa-times"></i>Close</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h4 class="h4">平均绩点</h4>
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
    </script>

</@student>
