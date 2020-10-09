<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>航班信息查询</title>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <link rel="stylesheet" href="/css/main.css"/>
    <!-- App css -->
    <link href="/css/app.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<!--菜单栏-->
<div class="head_warp"  id="headerMain">
    <div class="head">
        <div class="navbg">
            <div class="col960 float-left">
                <ul id="navul" class="cl">
                    <li><a href="index.html">首页</a></li>
                    <li><a href="#">航班数据统计</a>
                        <ul>
                            <li><a href="dayanalysis.html"   >日延误统计</a></li>
                            <li><a href="monthanalysis.html" >月延误统计</a></li>
                            <li><a href="yearanalysis.html"  >年延误统计</a></li>
                        </ul>
                    </li>
                    <li><a href="#">航班信息</a>
                        <ul>
                            <li><a href="jsp7.jsp">航班信息查询</a></li>
                        </ul>
                    </li>
                    <li><a href="#">延误预测</a>
                        <ul>
                            <li><a href="predict.html">航班延误预测</a></li>
                        </ul>
                    </li>
                    <li><a href="#">航班调整</a>
                        <ul>
                            <li><a href="Flight_adjustment.jsp">航班查询调整</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <div class="float-right"
                 style="background-color: #1e90ff;padding: 8px 10px;font-size: 14px;border-radius: 3px;">
                <a href="testlogin.html" style="color: #fff;" id="login">登录/注册</a>
            </div>
        </div>
    </div>
</div>
<%--信息栏--%>
<div style="background-color: #88b7e4;padding-top: 80px;">
    <div class="data_wrap" style="min-width: 1440px">
        <div class="animsition" style="overflow: hidden;">
            <div class="xsfx_tips">
                1.Search:按飞行日期、始发地机场、航班号搜索航班；<br/>
                A：筛选<br/>
                B：返回的数据包括:起飞机场名、起飞天气、到达机场名、到达天气；飞机具体信息：飞机型号、航班号、出发时间、到达时间<br/>
                <i class="fa fa-close"></i>
            </div>
        </div>

        <div class="my_duxs_time">
            <form action="/controller/findByEs" method="post" id="conditionform">

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
        <!--航班显示界面-->
        <div style="width: 100%;min-height:600px;max-height: 100%;overflow: auto">
            <table id="sphg_table" class="my_table tablesorter" cellspacing="0" width="98%" border="1" cellpadding="2"
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
                                                                            class="sp_check"/><img
                                style="margin-top: 17px"
                                class="my_img"
                                src="/img/plane.jpg"><span
                                style="width: 60%;margin-top: 17px"
                                class="sp_name">${flight.aircrafttype}</span></label>
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
                    <c:if test="${pageInfo.pageNum != pageInfo.firstPage}">href="${pageContext.request.contextPath}/controller/findByEs?currPage=${pageInfo.pageNum - 1 }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"</c:if>
                    <c:if test="${pageInfo.pageNum == pageInfo.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>
            >上一页</a>
            <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                <a href="${pageContext.request.contextPath}/controller/findByEs?currPage=${status.count }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"
                   <c:if test="${status.count == pageInfo.pageNum}">class="select"</c:if>
                   <c:if test="${(pageInfo.pageNum<status.count-5)}">class="disabled"</c:if>
                   <c:if test="${(pageInfo.pageNum>status.count+5)}">class="disabled"</c:if>
                >${status.count }</a>
            </c:forEach>
            <a
                    <c:if test="${pageInfo.pageNum == pageInfo.lastPage}">class="disabled"
                    href="javascript:void(0)"</c:if>
                    <c:if test="${pageInfo.pageNum != pageInfo.lastPage}">href="${pageContext.request.contextPath}/controller/findByEs?currPage=${pageInfo.pageNum + 1 }&date_start=${sessionScope.flights.date_start}&date_end=${sessionScope.flights.date_end}&flightnumber=${sessionScope.flights.flightnumber}&originairport=${sessionScope.flights.originairport}"</c:if>
                    id="downpage"
            >下一页</a>
            <span id="pagetotal" style="color: blue">共 ${pageInfo.pages}页</span>
        </div>
    </div>
</div>
</body>
</html>
<script src="/js/jquery.min.js"></script>
<%--    菜单特效--%>
<script src="/js/work.js"></script>
<script src="/js/FileSaver.js"></script>
<script src="js/jszip.js"></script>
<script src="js/excel-gen.js"></script>
<%--获取登录状态--%>
<script>
    $(function () {
        $.ajax({
            type: "post",
            url: "user/getmassage",
            dateType: "text",
            cache: false,
            success: function (result) {
                if (result.toString() != "请登录") {
                    $("#login").text(result + "/退出");
                }
                if ($("#login").text() != "登录/注册") {
                    $("#login").attr("href", "/user/logout")
                }
            },
            error: function () {
                alert("请登录")
            }
        })
    })
</script>

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

        $('.select').css({"color": "red"});

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
        if (originairport && originairport != 0 && originairport != 'null') {
            $("select[name='originairport']").val(originairport)
        }

        sessionStorage.clear();
    })
</script>
<%--导出数据--%>
<script>
    $(function () {
        excel = new ExcelGen({
            "src_id": "sphg_table",
            "show_header": true,
        });
        $("#gzlb").click(function () {
            excel.generate();
        })
    })
</script>
<!--导航栏变色-->
<script>
    window.onscroll = function() {
        var headerMain = document.getElementById('headerMain');
        var navul = document.getElementById('navul');
        if(window.pageYOffset >= 80){
            headerMain.classList.add('headerMain-bg');
            navul.classList.add('text-color');
        } else {
            headerMain.classList.remove('headerMain-bg');
            navul.classList.remove('text-color');
        }
    }
</script>