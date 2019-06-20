<#include "teacherMacro.ftl">
<@teacher keywords="教师信息" js=["js/table-page.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">个人信息</h2>
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
                                    <form action="" class="form-group" method="post">
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
                                        <th>账号</th>
                                        <th>名字</th>
                                        <th>邮箱</th>
                                        <th>电话号码</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#-- 变量声明 -->
                                    <#if users??>
                                        <#assign text>${users}</#assign>
                                        <#assign usersJson=text?eval />
                                        <#list usersJson as user>
                                            <tr>
                                                <td>${user.userName}</td>
                                                <td>${user.accountNumber}</td>
                                                <td>${(user.email)!"***"}</td>
                                                <td>${(user.phone)!"***"}</td>
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
</@teacher>