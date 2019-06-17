<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/edit.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">用户管理</h2>
        </div>
    </header>
    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-2">
                    <div class="card">
                        <div class="card-body">

                            <#--判断添加状态-->
                            <#if message??>
                                <#if message=="添加成功！">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert"
                                         style="width: fit-content">
                                        <strong>${message}</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                <#elseif message=="添加失败，务必先完善教师信息。">
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
                                                        aria-expanded="false"> Action <span class="caret"></span>
                                                </button>
                                                <div class="dropdown-menu" x-placement="bottom-start"
                                                     style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                                    <button onclick="searchUser(this)" data-value="name"
                                                            class="dropdown-item">用户名
                                                    </button>
                                                    <button onclick="searchUser(this)" data-value="type"
                                                            class="dropdown-item">类型
                                                    </button>
                                                    <div class="dropdown-divider"></div>
                                                    <button onclick="void(0)" class="dropdown-item">模糊</button>
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" name="content">
                                        </div>
                                    </form>
                                </div>
                                <!-- 添加用户 -->
                                <div class="col-sm-1 offset-sm-1">
                                    <button data-toggle="dropdown" type="button"
                                            class="btn btn-success dropdown-toggle"
                                            aria-expanded="false"><strong>添加</strong>
                                    </button>
                                    <div class="dropdown-menu" x-placement="bottom-start"
                                         style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                        <button type="button" data-toggle="modal" data-target="#addTeacher"
                                                class="dropdown-item">教师
                                        </button>
                                        <button type="button" data-toggle="modal" data-target="#addStudent"
                                                class="dropdown-item">学生
                                        </button>
                                        <button type="button" data-toggle="modal" data-target="#addManager"
                                                class="dropdown-item">管理员
                                        </button>
                                    </div>
                                </div>
                                <div id="addTeacher" tabindex="-1" role="dialog"
                                     aria-labelledby="addTeacherTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addTeacherTitle" class="modal-title">添加教师信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/teacher" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>名字</label>
                                                        <input name="name" type="text" placeholder="Teacher's Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>工号</label>
                                                        <input name="number" type="text" placeholder="Number"
                                                               class="form-control">
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>所属学院</label>
                                                            <select name="deptId" class="form-control">
                                                                <#if depts??>
                                                                    <#assign depts_text>${depts}</#assign>
                                                                    <#assign deptsJson=depts_text?eval />
                                                                    <#list deptsJson as dept>
                                                                        <option value="${dept.id}">${dept.name}</option>
                                                                    </#list>
                                                                </#if>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>职称</label>
                                                            <input name="title" type="text"
                                                                   placeholder="Teacher's Title"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">确定</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="addStudent" tabindex="-1" role="dialog"
                                     aria-labelledby="addStudentTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addStudentTitle" class="modal-title">添加学生信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/student" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>名字</label>
                                                        <input name="name" type="text" placeholder="Student's Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>学号</label>
                                                        <input name="number" type="text"
                                                               placeholder="Number"
                                                               class="form-control">
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-9">
                                                            <label>专业</label>
                                                            <input id="minput" type="text"
                                                                   list="mlist" onchange="contactMajorId()"
                                                                   placeholder="Major" class="form-control">
                                                            <datalist id="mlist">
                                                                <#if majors??>
                                                                    <#assign majors_text>${majors}</#assign>
                                                                    <#assign majorsJson=majors_text?eval />
                                                                    <#list majorsJson as major>
                                                                        <option value=${major.name} data-id=${major.id}></option>
                                                                    </#list>
                                                                </#if>
                                                            </datalist>
                                                            <input id="majorId" name="majorId" value="1" hidden>
                                                        </div>
                                                        <div class="form-group col-lg-3">
                                                            <label>班别</label>
                                                            <select name="clazz" class="form-control">
                                                                <option>A班</option>
                                                                <option>B班</option>
                                                                <option>C班</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">确定</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="addManager" tabindex="-1" role="dialog"
                                     aria-labelledby="addManagerTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addManagerTitle" class="modal-title">添加管理员信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/manager" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>名字</label>
                                                            <input name="name" type="text" placeholder="Name"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>工号</label>
                                                            <input name="number" type="text" placeholder="Number"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>所在学院</label>
                                                        <select name="deptId" class="form-control">
                                                            <#list deptsJson as dept>
                                                                <option value="${dept.id}">${dept.name}</option>
                                                            </#list>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>邮箱</label>
                                                        <input name="email" type="email" placeholder="Email Address"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>手机号</label>
                                                        <input name="phone" type="text" placeholder="Phone Number"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">确定</button>
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
                                        <th>账号</th>
                                        <th>用户名</th>
                                        <th>角色</th>
                                        <th>手机</th>
                                        <th>邮箱</th>
                                        <th>创建时间</th>
                                    </tr>
                                    </thead>
                                    <tbody id="result">
                                    <#-- 变量声明 -->
                                    <#if users??>
                                        <#assign users_text>${users}</#assign>
                                        <#assign usersJson=users_text?eval />
                                        <#list usersJson as user>
                                            <tr>
                                                <td>${user.accountNumber}</td>
                                                <td>${user.userName}</td>
                                                <td>${user.userType}</td>
                                                <td></td>
                                                <td></td>
                                                <td>${user.createTime}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function searchUser(option) {
            let params = {};
            params.content = $("#search input").val();
            let condition = option.getAttribute("data-value");
            $.ajax({
                async: false,
                type: "POST",
                url: "${ctx}/manager/search/user/" + condition,
                data: params,
                dataType: "json",
                success: function (data) {
                    $("#result tr").remove();// 删除ID=“result”标签的字标签tr下所有内容
                    // 以下代码为循环布局
                    for (let i in data) {
                        let date = new Date(data[i].createTime);
                        const trtd = "<td>" + data[i].accountNumber + "</td><td>" // 添加复选框
                            + data[i].userName + "</td><td>"  // 添加标号
                            + data[i].userType + "</td><td>"  // 类型名
                            + "" + "</td><td>"  // 商品名
                            + "" + "</td><td>"  // 商品价格
                            + date.getFullYear() + "-"
                            + (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1)
                            + "-" + (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + "  "
                            + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()
                            + "</td>"; // 商品折后价
                        // 将以上标签动态添加到tbody中进行展示
                        $("#main tbody").append("<tr>" + trtd + "</tr>");
                    }
                    console.log(data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        function contactMajorId() {
            let mid = $("#mlist option[value='" + $('#minput').val() + "']").attr('data-id');
            $("#majorId").attr("value", mid);
        }
    </script>
</@manager>