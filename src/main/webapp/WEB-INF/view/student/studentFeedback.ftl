<#include "studentMacro.ftl">
<@student keywords="学生信息" js=[] css=["css/quill.snow.css"]>

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">意见反馈</h2>
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
                                    <a href="javascript:void(0)" onclick="sendFeedback(this)"
                                       class="dropdown-item edit"><i
                                                class="fa fa-gear"></i>Submit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h4 class="h4">Feedback</h4>
                        </div>

                        <div class="card-body">
                            <div id="editor" style="height: 360px"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </section>

    <script src="js/quill.min.js"></script>
    <script>
        var quill = new Quill('#editor', {
            theme: 'snow'
        });
    </script>
</@student>