<#include "managerMacro.ftl">
<@manager keywords="查看详情" js=["js/bootstable.js"] css=[]>

    <header class="page-header">
        <div class="container-fluid">
            <a href="${ctx}/manager/score">课程信息</a> / 成绩详情
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
                                    <a href="javascript:void(0)" class="dropdown-item export">
                                        <i class="fa fa-gear"></i>Export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩审核</h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <#if scores??>
                                    <table id="editTable" class="table table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th>学号</th>
                                            <th>姓名</th>
                                            <th>成绩</th>
                                            <th>绩点</th>
                                            <th>专业</th>
                                            <th>学分</th>
                                            <th>是否及格</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#assign scoreText = scores>
                                        <#assign scoreJson = scoreText?eval>
                                        <#list scoreJson as tscore>
                                            <#assign student = tscore.student>
                                            <tr>
                                                <td class="snumber">${student.number}</td>
                                                <td>${student.name}</td>
                                                <#if tscore.value != 0>
                                                    <td class="score-value">${tscore.value}</td>
                                                    <#if (tscore.value >= 50)>
                                                        <td class="gpa">${(tscore.value - 50)/10}</td>
                                                    <#else>
                                                        <td class="gpa">0</td>
                                                    </#if>
                                                    <td>${student.major.name}</td>
                                                    <#if (tscore.value >= 60)>
                                                        <td>${tscore.course.credit}</td>
                                                        <td>是</td>
                                                    <#else>
                                                        <td>0</td>
                                                        <td>否</td>
                                                    </#if>
                                                <#else>
                                                    <#assign isSubmit = 0>
                                                    <td colspan="2">未提交</td>
                                                    <td>${student.major.name}</td>
                                                    <td colspan="2">未提交</td>
                                                </#if>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                    <#if isSubmit??>
                                    <#else>
                                        <button class="btn btn-primary" id="submitScore">确认成绩</button>
                                    </#if>
                                <#else>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@manager>