<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--    <meta name="viewport" content="width=device-width,initial-scale=1" />-->
    <meta charset="UTF-8">
    <title></title>
    <%--    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <link rel="stylesheet" href="/css/alertify/alertify.min.css"/>
    <link rel="stylesheet" href="/css/alertify/default.min.css"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="/assets/images/favicon.ico">
    <!-- App css -->
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/app.min.css" rel="stylesheet" type="text/css"/>
</head>
<body style="height: 0px;padding: 0 0;">
<!--导航栏-->

<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <div class="left-side-menu">

        <div class="slimscroll-menu" id="left-side-menu-container">

            <!-- LOGO -->
            <div class="logo text-center">
                        <span class="logo-lg">
                            <img src="/assets/images/logo.png" alt="" height="16">

                        </span>
                <span class="logo-sm">
                            <img src="/assets/images/logo_sm.png" alt="" height="16">
                        </span>
            </div>

            <!--- Sidemenu -->
            <ul class="metismenu side-nav">

                <li class="side-nav-title side-nav-item">Navigation</li>
                <!--京津冀地区总体显示-->
                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-align-justify"></i>
                        <span>京津冀地区延误等级的总体显示 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="jsp6.jsp">京津冀延误等级</a>
                        </li>

                        <li>
                            <a href="duxs_analysis.html">延误地图</a>
                        </li>

                    </ul>
                </li>
                <!--航班信息综合查询-->
                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-meter "></i>
                        <span> 航班信息综合查询 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <!--											<li>-->
                        <!--												<a href="contribution_analysis.html">航班信息</a>-->
                        <!--											</li>-->
                        <li>
                            <a href="sp_repurchase_analysis.html">实时航班信息</a>
                        </li>
                    </ul>
                </li>
                <!--京津冀地区本季度延误统计-->
                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-view-apps"></i>
                        <span> 京津冀地区延误统计 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="hdlx_analysis.html">起飞延误统计</a>
                        </li>
                        <li>
                            <a href="hdqd_analysis.html">降落延误统计</a>
                        </li>
                        <li>
                            <a href="System_analysis2.html">机场延误统计</a>
                        </li>
                        <li>
                            <a href="qk_analysis.html">时间段内延误统计</a>
                        </li>
                        <li>
                            <a href="hdjf_analysis.html">京津冀本季度延误统计</a>
                        </li>
                    </ul>
                </li>
                ！！                    <!--航班延误分析-->
                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-copy"></i>
                        <span>航班延误分析</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li class="side-nav-item">
                        <li>
                            <a href="RFD_data.html">RFD延误分析</a>
                        </li>
                        </li>
                    </ul>
                </li>

                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-browser"></i>
                        <span> 航班延误情况的预测 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="Delay prediction.html">次日航班延误预测</a>
                        </li>
                    </ul>
                </li>

                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-browser"></i>
                        <span> 航班的调整 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="Flight adjustment.html">航班调整</a>
                        </li>
                    </ul>
                </li>

                <li class="side-nav-title side-nav-item mt-1">Components</li>

                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-document"></i>
                        <span> 关于 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="form-elements.html">Basic Elements</a>
                        </li>
                        <li>
                            <a href="form-advanced.html">Form Advanced</a>
                        </li>

                    </ul>
                </li>


                <li class="side-nav-item">
                    <a href="javascript: void(0);" class="side-nav-link">
                        <i class="dripicons-list"></i>
                        <span> 联系我们 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="side-nav-second-level" aria-expanded="false">
                        <li>
                            <a href="tables-basic.html">Basic Tables</a>
                        </li>
                        <li>
                            <a href="tables-datatable.html">Data Tables</a>
                        </li>
                    </ul>
                </li>


            </ul>

            <!-- Help Box -->

            <!-- end Help Box -->
            <!-- End Sidebar -->


        </div>
        <!-- Sidebar -left -->

    </div>
    <!-- Left Sidebar End -->
    <script src="/assets/js/app.min.js"></script>
</div>


<!-------------------------------------->
<div class="data_wrap" style="min-width: 1650px">
    <div class="animsition" style="overflow: hidden;">
        <div class="xsfx_tips">
            1.Search:按飞行日期、始发地机场、航班号搜索航班；<br/>
            A：筛选<br/>
            B：返回的数据包括:起飞机场名、起飞天气、到达机场名、到达天气；飞机具体信息：飞机型号、航班号、出发时间、到达时间<br/>

            <i class="fa fa-close"></i>
        </div>
    </div>

    <div class="my_duxs_time">
        <form action="findbycondition" method="post" id="conditionform">

            <label class="my_setlabel">
                起始日期-截至日期: <input type="text" style="width:160px;" name="date_start"/> - <input type="text"
                                                                                                style="width:160px;"
                                                                                                name="date_end"/>
            </label>

            <label class="my_setlabel"><span style="padding-right: 24px;">航班号：</span>
                <input style="width: 222px;" type="text" name="flightnumber" placeholder="Flightnum"/>
            </label>
            <label class="my_setlabel">机场：
                <select id="leimu" style="width: 176px" name="originairport">
                    <option value=""></option>
                    <option value="ZBAA">首都机场</option>
                    <option value="ZBAD">大兴机场</option>
                    <option value="ZBTJ">天津滨海国际机场</option>
                    <option value="ZBSJ">石家庄机场</option>

                </select>
            </label>
            <input id="shaixuan" value="提交" style="text-align: center">
            <button id="czbtn">重置</button>
        </form>


    </div>

    <div class="chebox_wrap" style="color: #36a2ef;">
        <span id="gzlb" class="set_r"><i class="fa fa-download"></i> 导出查询列表</span>
        <span id="ljyx" class="set_r"><i class="fa fa-toggle-down"></i> 选中延误航班</span>
        <span id="mdxz" class="set_r"><i class="fa fa-sign-in"></i> 保存查询结果</span>
    </div>
    <!--        航班显示界面-->
    <div style="width: 100%;min-height:800px;max-height: 1100px;overflow: auto">
        <table id="sphg_table" class="my_table tablesorter" cellspacing="0" width="95%" border="1" cellpadding="2"
               cellspacing="1" style="background: white; border: 2px;" align="center">

            <thead>
            <tr align="center">
                <td class="cellstyle" style="position: relative;" nowrap>
                    <label><input type="checkbox" id="check_all">航班</label>
                    <i id="my_select" class="fa fa-caret-square-o-down"></i>
                    <ul id="my_se_layer">
                        <li class="layer_active">不限</li>
                        <li>准点航班</li>
                        <li>延误航班</li>
                        <li>取消航班</li>
                    </ul>
                <td class="cellstyle " nowrap>航班号</td>
                <td class="cellstyle " nowrap>日期</td>
                <td class="cellstyle " nowrap>状态</td>
                <td class="cellstyle " nowrap>起飞机场</td>
                <td class="cellstyle " nowrap>出发时间</td>
                <td class="cellstyle " nowrap>出发天气</td>
                <td class="cellstyle " nowrap>目的机场</td>
                <td class="cellstyle " nowrap>到达时间</td>
                <td class="cellstyle " nowrap>到达天气</td>

            </tr>
            </thead>

            <tbody>
            <c:forEach items="${sessionScope.pageInfo.list}" var="flight">
                <tr align="left">
                    <td style="border: 1px solid #cac1c1"><label><input style="width: auto" type="checkbox"
                                                                        class="sp_check"/><img style="margin-top: 17px"
                                                                                               class="my_img"
                                                                                               src="../../../resources/static/assets/img/plane.jpg"><span
                            style="width: 60%;margin-top: 17px" class="sp_name">${flight.aircrafttype}</span></label>
                    </td>
                    <td style="border: 1px solid #cac1c1">${flight.flightnumber}</td>
                    <td style="border: 1px solid #cac1c1">${flight.date}</td>
                        <%--                    <td style="border: 1px solid #cac1c1">${flight.delayminutes}</td>--%>
                    <td style="border: 1px solid #cac1c1">待输入</td>
                    <td style="border: 1px solid #cac1c1">${flight.originairport}</td>
                    <td style="border: 1px solid #cac1c1">${flight.crsdepTime}</td>
                    <td style="border: 1px solid #cac1c1">小雨、阵风5m/s</td>
                    <td style="border: 1px solid #cac1c1">${flight.destairport}</td>
                        <%--                    <td style="border: 1px solid #cac1c1">${flight.shidashijian}</td>--%>
                    <td style="border: 1px solid #cac1c1">${flight.crsarrTime}</td>
                    <td style="border: 1px solid #cac1c1">晴、风速4m/s</td>

                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
    <div id="pages" class="pages" style="margin-top: 40px">
        <a
                <c:if test="${pageInfo.pageNum != pageInfo.firstPage}">href="${pageContext.request.contextPath}/controller/findbycondition?currPage=${pageInfo.pageNum - 1 }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"</c:if>
                <c:if test="${pageInfo.pageNum == pageInfo.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>
        >上一页</a>
        <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
            <a href="${pageContext.request.contextPath}/controller/findbycondition?currPage=${status.count }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"
               <c:if test="${status.count == pageInfo.pageNum}">class="select"</c:if>
               <c:if test="${(pageInfo.pageNum<status.count-5)}">class="disabled"</c:if>
               <c:if test="${(pageInfo.pageNum>status.count+5)}">class="disabled"</c:if>
            >${status.count }</a>
        </c:forEach>
        <a
                <c:if test="${pageInfo.pageNum == pageInfo.lastPage}">class="disabled"
                href="javascript:void(0)"</c:if>
                <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">href="${pageContext.request.contextPath}/controller/findbycondition?currPage=${pageInfo.pageNum + 1 }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"</c:if> id="downpage"
        >下一页</a>
        <span id="pagetotal" style="color: blue">共 ${pageInfo.pages}页</span>
    </div>
</div>

</body>
</html>
<script src="/assets/js/jquery.min.js"></script>
<%--<script src="assets/js/jquery.cookie.js"></script>--%>
<script>
    $(function () {
        //关闭提示
        $('.xsfx_tips').mouseenter(function () {
            $(this).slideUp();
        })

        $("#shaixuan").click(function () {
            sessionStorage.setItem('date_start', $("input[name='date_start']").val());
            sessionStorage.setItem('date_end', $("input[name='date_end']").val());
            sessionStorage.setItem('flightnumber', $("input[name='flightnumber']").val());
            sessionStorage.setItem('originairport', $("select[name='originairport']").val());
            $('#conditionform').submit();
        })

        $('.select').css({"color":"red"});

        var date_start = sessionStorage.date_start;
        var date_end = sessionStorage.date_end;
        var flightnumber = sessionStorage.flightnumber;
        var originairport = sessionStorage.getItem('originairport');
        if (date_start && date_start != 0 && date_start != 'null') {
            $("input[name='date_start']").val(date_start);
        }
        if (date_end && date_end != 0 && date_end != 'null') {
            $("input[name='date_end']").val(date_end);
        }
        if (flightnumber && flightnumber != 0 && flightnumber != 'null') {
            $("input[name='flightnumber']").val(flightnumber);
        }
        if (originairport && originairport !=0 && originairport != 'null'){
            $("select[name='originairport']").val(originairport)
        }
    })
</script>
