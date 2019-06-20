<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=[]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">个人信息</h2>
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
                                        aria-expanded="false" class="dropdown-toggle">
                                    <i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h4 class="h4">Feedback</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>账号</th>
                                        <th>名字</th>
                                        <th>角色</th>
                                        <th>邮箱</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#-- 变量声明 -->
                                    <#if feedback != "[]">
                                        <#assign text>${feedback}</#assign>
                                        <#assign jsonStr=text?eval />
                                        <#list jsonStr as record>
                                            <#assign user = record.user>
                                            <tr>
                                                <td><strong>${record.id}</strong></td>
                                                <td>${user.accountNumber}</td>
                                                <td>${user.userName}</td>
                                                <#if user.userType == "teacher">
                                                    <td>教师</td>
                                                <#elseif user.userType == "student">
                                                    <td>学生</td>
                                                </#if>
                                                <td>${(user.email)!"***"}</td>
                                                <td>
                                                    <button type="button" data-toggle="modal"
                                                            data-target="#feedback${record.id}"
                                                            class="btn btn-sm btn-info">查看
                                                    </button>
                                                    <a href="${ctx}/manager/deleteFeedback?id=${record.id}"
                                                       style="color: black" class="btn btn-sm btn-default">
                                                        删除
                                                    </a>
                                                </td>
                                            </tr>
                                            <div id="feedback${record.id}" tabindex="-1" role="dialog"
                                                 aria-labelledby="addTeacherTitle"
                                                 class="modal fade text-left" style="display: none;" aria-hidden="true">
                                                <div role="document" class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <p id="addTeacherTitle" class="modal-title">
                                                                By ${user.userName} </p>
                                                            <button type="button" data-dismiss="modal"
                                                                    aria-label="Close"
                                                                    class="close"><span aria-hidden="true">×</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ${record.content}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>
        </div>
    </section>
</@manager>