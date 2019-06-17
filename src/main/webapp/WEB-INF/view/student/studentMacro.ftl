<#compress>
    <#macro student keywords="" js=[] css=[]>
        <#include "../baseMacro.ftl">
        <@base base_title="学生界面" base_keywords="学生" base_js=js base_css=css>
            <div class="page-content d-flex align-items-stretch">
                <!-- Side Navbar -->
                <nav class="side-navbar">
                    <!-- Sidebar Header-->
                    <div class="sidebar-header d-flex align-items-center">
                        <div class="avatar">
                            <img src="img/avatar.jpg" alt="..." class="img-fluid rounded-circle">
                        </div>
                        <div class="title">
                            <h1 class="h4">${name}</h1>
                            <p>${number}</p>
                            <p>学生</p>
                        </div>
                    </div>
                    <span class="heading">Main</span>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#education" aria-expanded="false" data-toggle="collapse">
                                <i class="icon-flask"></i>教学
                            </a>
                            <ul id="education" class="collapse list-unstyled ">
                                <li><a href="${ctx}/student/score">成绩查询</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#contact" aria-expanded="false" data-toggle="collapse">
                                <i class="icon-user"></i>联系
                            </a>
                            <ul id="contact" class="collapse list-unstyled ">
                                <li><a href="${ctx}/student/temp">班级通讯录</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#system" aria-expanded="false" data-toggle="collapse">
                                <i class="icon-screen"></i>系统
                            </a>
                            <ul id="system" class="collapse list-unstyled ">
                                <li><a href="${ctx}/student/profile">个人信息</a></li>
                            </ul>
                        </li>
                    </ul>
                    <span class="heading">Extras</span>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#">
                                <i class="icon-mail"></i>意见反馈
                            </a>
                        </li>
                    </ul>
                </nav>

                <div class="content-inner">
                    <#-- 内容区 -->
                    <#nested>
                    <!-- Page Footer-->
                    <footer class="main-footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-6">
                                    <p>
                                        Copyright &copy; 2019.Company name All rights reserved.
                                        <a target="_blank" href="http://sc.chinaz.com/moban/">ChinaZ</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </@base>
    </#macro>
</#compress>