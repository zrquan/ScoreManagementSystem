<#include "teacherMacro.ftl">
<@teacher keywords="教师课程查看" js=[]>

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">课程详情</h2>
        </div>
    </header>

    <section class="charts">
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

                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">你的课程</h3>
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
                                <#if course??>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th>课程名</th>
                                            <th>课程类型</th>
                                            <th>学分</th>
                                            <th>学时</th>
                                            <th>考试类型</th>
                                            <th>学年</th>
                                            <th>学期</th>
                                        </tr>
                                        </thead>
                                        <tbody id="result">
                                        <#assign text>${course}</#assign>
                                        <#assign json=text?eval />
                                        <#list json as record>
                                            <tr>
                                                <td>${record.name}</td>
                                                <td>${record.type}</td>
                                                <td>${record.credit}</td>
                                                <td>${record.period}</td>
                                                <td>${(record.testForm)!""}</td>
                                                <#if record.year??>
                                                    <td>${record.year} - ${record.year?eval + 1}</td>
                                                <#else>
                                                    <td></td>
                                                </#if>
                                                <td>${(record.term)!""}</td>
                                                <td>
                                                    <div class="btn-group pull-right">
                                                        <a class="btn btn-primary"
                                                           href="${ctx}/teacher/score?cid=${record.id}">查看成绩</a>
                                                        <button type="button" class="btn"
                                                                data-toggle="modal" data-target="#inputModal">导入成绩
                                                        </button>
                                                        <div class="modal fade text-left" id="inputModal" tabindex="-1"
                                                             role="dialog"
                                                             aria-labelledby="exampleModalLabel" aria-hidden="true"
                                                             data-backdrop="static">

                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 id="exampleModalLabel" class="modal-title">
                                                                            成绩上传界面</h4>
                                                                        <button type="button" data-dismiss="modal"
                                                                                aria-label="Close" class="close"><span
                                                                                    aria-hidden="true">×</span></button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <div class="file-container"
                                                                             style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
                                                                            <button class="btn btn-primary fileinput-button"
                                                                                    type="button">上传文件
                                                                            </button>
                                                                            <input type="file" id="jobData"
                                                                                   accept=".xls,.xlsx"
                                                                                   onchange="loadFile(this.files[0])"
                                                                                   style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
                                                                            <span id="filename"
                                                                                  style="vertical-align: middle">未上传文件</span>
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button class="btn btn-secondary"
                                                                                data-dismiss="modal"
                                                                                type="button">关闭
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>
        </div>
    </section>
</@teacher>