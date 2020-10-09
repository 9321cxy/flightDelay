<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>航班调整</title>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <link rel="stylesheet" href="/css/main.css"/>
    <link rel="stylesheet" href="/css/fdo.css"/>
    <!-- App css -->
    <link href="/css/app.min.css" rel="stylesheet" type="text/css"/>

</head>
<body style="padding-bottom: initial;">
<%--菜单栏--%>
<div class="head_warp">
    <div class="head">
        <div class="navbg">
            <div class="col960 float-left">
                <ul id="navul" class="cl">
                    <li><a href="index.html">首页</a></li>
                    <li><a href="#">航班数据统计</a>
                        <ul>
                            <li><a href="dayanalysis.html">日延误统计</a></li>
                            <li><a href="monthanalysis.html">月延误统计</a></li>
                            <li><a href="yearanalysis.html">年延误统计</a></li>
                        </ul>
                    </li>
                    <li><a href="#">航班信息</a>
                        <ul>
                            <li><a href="jsp7.jsp">航班信息查询</a></li>
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
    <div class="data_wrap" style="min-width: 1440px">
        <div class="animsition" style="overflow: hidden;">
            <div class="xsfx_tips">
                1.Search:按航季、始发地机场、延误等级搜索航班；<br/>
                A：筛选<br/>
                B：返回的数据包括:航班号、起飞时间、起飞机场、到达时间、到达机场、等级、高度、机型、任务类型、速度、飞行次数、延误次数、平均延误时间、延误等级；<br/>

                <i class="fa fa-close"></i>
            </div>
        </div>

        <div class="my_duxs_time">
            <form action="controller/findDelayFlight" method="post">
                <div style="padding-bottom: 10px;text-align: center;" class="my_setlabel">
                    <h3>航班查询调整</h3>
                </div>
                <!-- 航季选择 -->
                <label class="my_setlabel">航季：
                    <select id="list1" name="flight_season" required onclick="setCookie('list1',this.selectedIndex)" >
                        <option value=""> - - - 选择航季 - - - </option>
                        <option value="2019summer">2019夏秋航季</option>
                        <option value="2019winter">2019冬春航季</option>
                        <option value="2018summer">2018夏秋航季</option>
                        <option value="2018winter">2018冬春航季</option>
                    </select>
                </label>
                <!-- 机场选择 -->
                <label class="my_setlabel">机场：
                    <select id="list2" name="origin_airport" required onclick="setCookie('list2',this.selectedIndex)">
                        <option value=""> - - - 选择机场 - - - </option>
                        <option value="all" >京津冀机场群</option>
                        <option value="ZBAA">北京首都国际机场</option>
                        <option value="ZBAD">北京大兴国际机场</option>
                        <option value="ZBNY">北京南苑国际机场</option>
                        <option value="ZBTJ">天津滨海国际机场</option>
                        <option value="ZBSJ">石家庄正定国际机场</option>
                        <option value="ZBZJ">张家口宁远机场</option>
                        <option value="ZBSN">唐山三女河机场</option>
                        <option value="ZBHD">邯郸机场</option>
                        <option value="ZBDH">秦皇岛北戴河机场</option>
                        <option value="ZBCD">承德普宁机场</option>
                    </select>
                </label>
                <!-- 延误等级选择 -->
                <label class="my_setlabel">延误等级：
                    <select id="list3" name="delay_level" required onclick="setCookie('list3',this.selectedIndex)" >
                        <option value=""> - - 选择延误等级 - - </option>
                        <option value="all" >所有等级</option>
                        <option value="0">0（不延误）</option>
                        <option value="1">1（轻度延误）</option>
                        <option value="2">2（中度延误）</option>
                        <option value="3">3（高度延误）</option>
                        <option value="4">4（重度延误）</option>
                    </select>
                </label>
                <label class="my_setlabel">航班数量：<span id="number"></span></label>
                <!-- 查询按钮 -->
                <input id="query" type="submit" value="查询">
            </form>

        </div>

<%--        <div class="chebox_wrap" style="color: #36a2ef;">--%>
<%--            <span id="gzlb" class="set_r"><i class="fa fa-download"></i> 导出查询列表</span>--%>
<%--            <span id="ljyx" class="set_r"><i class="fa fa-toggle-down"></i> 选中延误航班</span>--%>
<%--            <span id="mdxz" class="set_r"><i class="fa fa-sign-in"></i> 保存查询结果</span>--%>
<%--        </div>--%>
        <!-- 航班显示界面-->
        <div style="width: 100%;height:600px;overflow: auto;" >
            <form action="Info/information" method="post">
                <div id="frozen" style="max-height:500px;overflow-y: scroll;">
                    <table id="sphg_table" class="my_table tablesorter" cellspacing="0" width="98%" border="1" cellpadding="2"
                           cellspacing="1" style="background: white; border: 2px;" align="center">
                        <%--复选框宽度缩到最小--%>
                        <colgroup>
                            <col span="1" style="width: min-content;">
                        </colgroup>
                        <thead>
                        <tr align="center">
                            <th class="cellstyle" style="position: relative;" nowrap>
                                <label>选择<input type="checkbox" id="check_all">
                                </label>
                            <th class="cellstyle " nowrap>航班号</th>
                            <th class="cellstyle " nowrap>计起时间</th>
                            <th class="cellstyle " nowrap>起飞机场</th>
                            <th class="cellstyle " nowrap>计达时间</th>
                            <th class="cellstyle " nowrap>目的机场</th>
                            <th class="cellstyle " nowrap>等级</th>
                            <th class="cellstyle " nowrap>高度</th>
                            <th class="cellstyle " nowrap>机型</th>
                            <th class="cellstyle " nowrap>任务类型</th>
                            <th class="cellstyle " nowrap>速度</th>
                            <th class="cellstyle " nowrap>飞行次数</th>
                            <th class="cellstyle " nowrap>延误次数</th>
                            <th class="cellstyle " nowrap>平均延误时间</th>
                            <th class="cellstyle " nowrap>平均延误等级</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${sessionScope.hflights}" var="hflight">
                            <tr>
                                <td style="border: 1px solid #cac1c1;">
                                    <label>
                                        <img style="margin-right: 0;" class="my_img" src="img/plane.jpg" alt="">
                                        <input style="width: auto" type="checkbox" class="sp_check" name="flightData"
                                               value="${hflight.flight_number},${hflight.dep_time},${hflight.origin_airport}"/>
                                    </label>
                                </td>
                                <td style="border: 1px solid #cac1c1">${hflight.flight_number}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.dep_time}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.origin_airport}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.arr_time}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.dest_airport}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.grade}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.height}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.aircraft_type}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.task_type}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.speed}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.fly_number}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.delay_number}</td>
                                <td style="border: 1px solid #cac1c1">${hflight.average_delay}</td>
                                <td style="border: 1px solid #cac1c1"><span class="back_color" >${hflight.delay_level}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- 设置隐藏域获取航季,机场信息 -->
                <div>
                    <input type="hidden" id="season" name="season" value=" ">
                    <input type="hidden" id="airport" name="airport" value=" ">
                </div>

                <!-- 调整选项 -->
                <div style="padding:20px 1.2% 20px 1.2%;">
                    <label>调整选项：</label>
                    <label style="padding:0 10px;"><input type="radio" name="optimization" value="local" checked><span>本机场内</span></label>
                    <label style="padding:0 10px;"><input type="radio" name="optimization" value="whole"><span>机场群内</span></label>
                </div>

                <!-- 提交按钮 -->
                <div>
                    <input id="submit" type="submit" value="提交" onclick="getvalue();">
                    <div style="clear: both;"></div>
                </div>
            </form>

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
<%--全选--%>
<script>
    $('#check_all').on('click',function(){
        var len = $('.sp_check').length;
        var my_change = $(this).prop('checked');
        for(var i=0; i<len; i++){
            $('.sp_check').eq(i).prop('checked',my_change);
        };
        $('#my_se_layer').slideUp();
    });

    // $(function(){
    //     //点击全选
    //     $("#check_all").click(function () {//当点击全选框时
    //         var flag = $("#check_all").is(":checked");//判断全选按钮的状态
    //         var checkItems=document.getElementsByName("flightData");
    //         for(var i=0;i<checkItems.length;i++){
    //             checkItems[i].checked = flag;
    //         }
    //     });
    //
    //     //点击子项
    //     $("input:checkbox[name='flightData']").each(function(){
    //         $(this).click(function(){
    //             if($("input:checkbox[name='flightData']:checked").length===$("input:checkbox[name='flightData']").length){
    //                 document.getElementById("check_all").checked = true;
    //             }else{
    //                 document.getElementById("check_all").checked = false;
    //             }
    //         });
    //     });
    // });
</script>
<%--表格排序--%>
<script>
    $("#sphg_table").tablesorter({
        // pass the headers argument and assing a object
        headers: {
            // assign the second column (we start counting zero)
            0: {
                // disable it by setting the property sorter to false
                sorter: false
            },
            1: { sorter: false },
            3: { sorter: false },
            4: { sorter: false },
            5: { sorter: false },
            6: { sorter: false },
            7: { sorter: false },
            8: { sorter: false },
            9: { sorter: false },
            10: { sorter: false },
            13: { sorter: false }
        }
    });
</script>
<%--表头固定--%>
<script>
    window.onload = function () {
        var tableCont = document.querySelector('#froze');
        /**
         * scroll handle
         * @param {event} e -- scroll event
         */
        function scrollHandle(e) {
            var scrollTop = this.scrollTop;
            this.querySelector('thead').style.transform = 'translateY(' + scrollTop + 'px)';
        }
        tableCont.addEventListener('scroll', scrollHandle);
    }
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
<%--隐藏域表单赋值--%>
<script>
    function getvalue(){
        var oID1 = document.getElementById("list1").value;//拿到form中航季的value值
        var oID2 = document.getElementById("list2").value;//拿到form中机场的value值
        var oHID1 = document.getElementById("season");//拿到form中的隐藏域的航季对象
        var oHID2 = document.getElementById("airport");//拿到form中的隐藏域的机场对象
        oHID1.value = oID1;//为隐藏域对象的value赋值
        oHID2.value = oID2;//为隐藏域对象的value赋值
    }
</script>
<%--获取表格行数--%>
<script>
    var table = document.getElementById("sphg_table");
    var trs = table.getElementsByTagName("tr");
    document.getElementById("number").innerText=trs.length-1;
</script>
<%--cookie中航季和机场信息的存储--%>
<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name) {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    }
</script>
<%--重新加载cookie中的航季和机场信息--%>
<script type="text/javascript">
    var selectedIndex1 = getCookie("list1");
    var selectedIndex2 = getCookie("list2");
    var selectedIndex3 = getCookie("list3");
    if (selectedIndex1 != null) {
        document.getElementById("list1").selectedIndex = selectedIndex1;
    }
    if (selectedIndex2 != null) {
        document.getElementById("list2").selectedIndex = selectedIndex2;
    }
    if (selectedIndex3 != null) {
        document.getElementById("list3").selectedIndex = selectedIndex3;
    }
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
<!--页面变化时重新加载-->
<script>
    $(window).resize(function () {
        location.reload();
    })
</script>