<#include "studentMacro.ftl">
<@student keywords="学生信息" js=["js/edit.js"]>

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
                                        aria-expanded="false" class="dropdown-toggle">
                                    <i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a>
                                    <a href="javascript:;" class="dropdown-item edit"><i class="fa fa-gear"></i>Edit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h4 class="h4">Profile</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-9">
                                    <fieldset disabled="disabled">
                                        <form>
                                            <div class="form-group">
                                                <label class="form-control-label">姓名</label>
                                                <input value=${stu.name} class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">学号</label>
                                                <input value=${stu.number} class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="form-control-label">学院</label>
                                                        <input value=${stu.gba} class="form-control">
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="form-control-label">年级与专业</label>
                                                        <input value=${stu.credit} class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">当前校区</label>
                                                <input value=${stu.major.name} class="form-control">
                                            </div>
                                        </form>
                                    </fieldset>
                                </div>
                                <#-- TODO: 头像上传 -->
                                <div class="col-lg-3">
                                    <form action="${ctx}/avatar" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <img src="img/avatar.jpg" class="card-img" alt="..."/>
                                        </div>
                                        <div class="form-group">
                                            <label for="uploadImage" class="btn btn-block btn-dark">切换头像</label>
                                            <input type="file" name="avatar" value="" id="uploadImage" hidden="hidden">
                                        </div>
                                        <#--                                        <div class="form-group">-->
                                        <#--                                            <input type="submit" value="Signin" class="btn btn-primary">-->
                                        <#--                                        </div>-->
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </section>
</@student>