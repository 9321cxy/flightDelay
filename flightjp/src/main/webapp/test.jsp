<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>航班调整结果及分析</title>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <link rel="stylesheet" href="/css/main.css"/>
    <link rel="stylesheet" href="/css/fdo.css"/>
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
<!--------信息显示栏---------->
<div style="background-color: #88b7e4;padding-top: 80px;">
    <div class="data_wrap" style="min-width: 1650px">
        <%--浮动提示--%>
        <div class="animsition" style="overflow: hidden;">
            <div class="xsfx_tips">
                1.Search:按飞行日期、始发地机场、航班号搜索航班；<br/>
                A：筛选<br/>
                B：返回的数据包括:起飞机场名、起飞天气、到达机场名、到达天气；飞机具体信息：飞机型号、航班号、出发时间、到达时间<br/>
                <i class="fa fa-close"></i>
            </div>
        </div>

        <!-- 表名 -->
        <div class="my_duxs_time">
            <form id="jsForm">
                <div style="text-align: center;" class="my_setlabel">
                    <h3>延误航班调整结果</h3>
                </div>
                <div>
                    <label style="margin-right: 150px;" class="my_setlabel">航季：${sessionScope.title.season}</label>
                    <label class="my_setlabel">机场：${sessionScope.title.airport}</label>
                    <label class="my_setlabel">优化航班数量：<span id="number"></span></label>
                </div>
            </form>
        </div>
        <!-- 航班表 -->
        <div style="max-height: 500px;overflow-y: scroll">
            <table id="sphg_table" class="my_table tablesorter" cellspacing="0" cellpadding="0"
                   style="background: white; width: 98%;" align="center">
                <!-- 表头 -->
                <thead style="position: relative;">
                <tr>
                    <th style="padding:1.5%;">航班号</th>
                    <th>计起时间</th>
                    <th>起飞机场</th>
                    <th>计达时间</th>
                    <th>目的机场</th>
                    <th>等级</th>
                    <th>高度</th>
                    <th>机型</th>
                    <th>任务类型</th>
                    <th>速度</th>
                    <th>预计延误等级</th>
                </tr>
                </thead>
                <!-- 表格内容 -->
                <tbody>
                <c:forEach items="${sessionScope.flight_data}" var="oflight">
                    <tr align="left">
                        <td style="border: 1px solid #cac1c1">${oflight.flight_number}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.dep_time}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.origin_airport}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.arr_time}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.dest_airport}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.grade}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.height}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.aircraft_type}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.task_type}</td>
                        <td style="border: 1px solid #cac1c1">${oflight.speed}</td>
                        <td style="border: 1px solid #cac1c1"><span class="back_color" >${oflight.estimate_delay_level}</span></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 优化评估显示 -->
        <div style="margin: 30px 10px;text-align: center;">
            <h3 style="margin-bottom:30px;">${sessionScope.title.airport}${sessionScope.title.season}航班调整结果分析</h3>
            <div style="width: 100%;">
                <div id="pie1"     style="width: 49%; height:333px;background-color: #fff;margin-right: 20px;display: inline-block;"></div>
                <div id="pie2"     style="width: 49%; height:333px;background-color: #fff;display: inline-block;"></div>
                <div id="h_column" style="width: 100%;height:333px;background-color: #fff;margin-top: 20px;"></div>
                <div id="v_column" style="width: 100%;height:333px;background-color: #fff;margin-top: 20px;"></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.tablesorter.min.js"></script>
<%--菜单特效--%>
<script src="js/work.js"></script>
<script src="js/FileSaver.js"></script>
<script src="js/jszip.js"></script>
<script src="js/excel-gen.js"></script>
<script src="js/echarts.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>

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
<%--关闭提示--%>
<script>
    $(function () {
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
<%--延误等级颜色显示--%>
<script>
    $(function () {
        $(".back_color").each(function () {
            var val = $(this).text();

            if (val == "0") {
                var $pat = $(this).parent();
                $pat.css("background", "#397e30")
            } else if (val == "1") {
                var $pat = $(this).parent();
                $pat.css("background", "#00ceb1")
            } else if (val == "2") {
                var $pat = $(this).parent();
                $pat.css("background", "#ffd500")
            } else if (val == "3") {
                var $pat = $(this).parent();
                $pat.css("background", "#fc7c16")
            } else {
                var $pat = $(this).parent();
                $pat.css("background", "#e00500")
            }
        })
    });
</script>
<%--获取表格行数--%>
<script>
    var table=document.getElementById("sphg_table");
    var trs=table.getElementsByTagName("tr");
    document.getElementById("number").innerText=trs.length-1;
</script>
<!-- 饼图1 -->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('pie1'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '${sessionScope.title.airport}-航班延误情况',
            subtext: '${sessionScope.title.season}',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        color: ['#397e30', '#00ceb1', '#ffd500', '#fc7c16', '#e00500'],
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['未延误', '低度延误', '中度延误', '高度延误', '重度延误']
        },
        series: [
            {
                name: '优化前',
                type: 'pie',
                radius: '60%',
                center: ['50%', '60%'],
                data: [
                    { value: ${sessionScope.pie[0].no_delay},       name: '未延误' },
                    { value: ${sessionScope.pie[0].light_delay},    name: '低度延误' },
                    { value: ${sessionScope.pie[0].moderate_delay}, name: '中度延误' },
                    { value: ${sessionScope.pie[0].serious_delay},  name: '高度延误' },
                    { value: ${sessionScope.pie[0].severe_delay},   name: '重度延误' }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<!-- 饼图2 -->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('pie2'));
    option = {
        title: {
            text: '${sessionScope.title.airport}-延误优化情况',
            subtext: '${sessionScope.title.season}',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        color: ['#397e30', '#00ceb1', '#ffd500', '#fc7c16', '#e00500'],
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['未延误', '低度延误', '中度延误', '高度延误', '重度延误']
        },
        series: [
            {
                name: '优化后',
                type: 'pie',
                radius: '60%',
                center: ['50%', '60%'],
                data: [
                    { value: ${sessionScope.pie[1].no_delay},       name: '未延误' },
                    { value: ${sessionScope.pie[1].light_delay},    name: '低度延误' },
                    { value: ${sessionScope.pie[1].moderate_delay}, name: '中度延误' },
                    { value: ${sessionScope.pie[1].serious_delay},  name: '高度延误' },
                    { value: ${sessionScope.pie[1].severe_delay},   name: '重度延误' }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<!-- 横向柱状对比图 -->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('h_column'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '${sessionScope.title.season}各机场延误航班数量',
            // subtext: '数据来自网络'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        color: ['#cca4e3', '#70f3ff'],
        legend: {
            data: ['优化前', '优化后']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['京津冀机场群', '石家庄正定国际机场', '天津滨海国际机场', '北京南苑国际机场', '北京首都国际机场']
        },
        series: [
            {
                name: '优化前',
                type: 'bar',
                data: [${sessionScope.h_column[0].jingjinji}, ${sessionScope.h_column[0].shijiazhuang},
                    ${sessionScope.h_column[0].tianjin}, ${sessionScope.h_column[0].beijing_nanyuan},
                    ${sessionScope.h_column[0].beijing_shoudu},]
            },
            {
                name: '优化后',
                type: 'bar',
                data: [${sessionScope.h_column[1].jingjinji}, ${sessionScope.h_column[1].shijiazhuang},
                    ${sessionScope.h_column[1].tianjin}, ${sessionScope.h_column[1].beijing_nanyuan},
                    ${sessionScope.h_column[1].beijing_shoudu},]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<!-- 纵向柱状对比图 -->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('v_column'));

    // 指定图表的配置项和数据
    option = {
        legend: {},
        title: {
            text: '${sessionScope.title.season}各机场平均延误等级',
            // subtext: '数据来自网络',
            left: 'left'
        },
        color:['#f40','#008c8c'],
        tooltip: {},
        dataset: {
            source: [
                ['product', '优化前', '优化后'],
                ['北京首都国际机场', ${sessionScope.v_column[0].beijing_shoudu},${sessionScope.v_column[1].beijing_shoudu}],
                ['北京南苑国际机场', ${sessionScope.v_column[0].beijing_nanyuan}, ${sessionScope.v_column[1].beijing_nanyuan}],
                ['天津滨海国际机场', ${sessionScope.v_column[0].tianjin}, ${sessionScope.v_column[1].tianjin}],
                ['石家庄正定国际机场', ${sessionScope.v_column[0].shijiazhuang}, ${sessionScope.v_column[1].shijiazhuang}],
                ['京津冀机场群', ${sessionScope.v_column[0].jingjinji}, ${sessionScope.v_column[1].jingjinji}]
            ]
        },
        xAxis: { type: 'category' },
        yAxis: {},
        // Declare several bar series, each will be mapped
        // to a column of dataset.source by default.
        series: [
            { type: 'bar' },
            { type: 'bar' }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
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
<!--页面变化时重新加载-->
<script>
    $(window).resize(function () {
        location.reload();
    })
</script>