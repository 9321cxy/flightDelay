<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
</head>
<link rel="stylesheet" href="/css/common.css"/>
<link rel="stylesheet" href="/css/xsfx.css"/>
<!-- App favicon -->
<link rel="shortcut icon" href="/images/favicon.ico">
<!-- App css -->
<link href="/css/icons.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/app.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/css/mapjsp.css">

<body>
<!-- 菜单栏 -->
<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <div class="left-side-menu">

        <div class="slimscroll-menu" id="left-side-menu-container">

            <!-- LOGO -->
            <div class="logo text-center">
                    <span class="logo-lg">
                        <img src="/images/logo.png" alt="" height="16">

                    </span>
                <span class="logo-sm">
                        <img src="/images/logo_sm.png" alt="" height="16">
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
                            <a href="distribute.html">京津冀延误等级</a>
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
                ！！
                <!--航班延误分析-->
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
    <script src="/js/app.min.js"></script>
</div>
<!-- 主界面 -->
<div class="data_wrap">
    <div class="animsition" style="overflow: hidden;z-index: 2">
        <div class="xsfx_tips">
            1.地图颜色深的地区延误情况较严重，请优先调整。<br/>
            2.地区中飞机位置为各个机场位置，鼠标悬停显示各个机场的名称、坐标与延误情况。<br/>
            3.点击地图京、津、冀区域在表格中筛选出相应的航班。<br/>
            <i class="fa fa-close"></i>
        </div>
    </div>
    <!-- 页面上方布局 -->
    <div>
        <!-- 地图模块 -->
        <div id="container"></div>
        <!-- 京津冀延误情况表格 -->
        <div id="tableleft">
            <div id="tabledelay">
                <div>
                    京津冀机场次日航班延误情况预测
                </div>
                <div class="checkbox">
                    <input type="checkbox" checked>首都机场
                    <input type="checkbox" checked>大兴机场
                    <input type="checkbox" checked>天津机场
                    <input type="checkbox" checked>石家庄机场
                    <input type="checkbox" hidden checked>
                </div>
                <table class="tablesorter">
                    <thead>
                    <tr>
                        <th class="cellstylemin">机场</th>
                        <th class="cellstylemin">航班号</th>
                        <th class="cellstylemin">起飞时间</th>
                        <th class="cellstylemin">预计延误等级</th>
                    </tr>
                    </thead>
                    <tbody id="filterBody">

                    </tbody>
                </table>
            </div>
            <!-- 京津冀地区延误图 -->
            <div id="barContainer"></div>
        </div>
    </div>
</div>
</body>

</html>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.tablesorter.min.js"></script>
<script src="/js/echarts.min.js"></script>
<script src="/js/china.js"></script>
<%--表格相关动态--%>
<script src="/js/mapjsp.js"></script>
<!-- echarts-->
<script type="text/javascript">
    function echart(delayStr) {
        //关闭提示
        $('.xsfx_tips').mouseenter(function () {
            $(this).slideUp();
        })
// 地图容器
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var data = [
            {name: '石家庄正定机场', value: delayStr[13]+delayStr[14]+delayStr[15]},
            {name: '天津滨海国际机场', value: delayStr[9]+delayStr[10]+delayStr[11]},
            {name: '首都机场', value: 0},
            {name: '大兴国际机场', value: delayStr[5]+delayStr[6]+delayStr[7]},
        ];

        var geoCoordMap = {
            '天津滨海国际机场':[117.20,39.07],
            '大兴国际机场': [116.4198, 39.50338],
            '邯郸机场': [114.2548, 36.3126],
            '唐山三女河机场': [118.00086, 39.43028],
            '石家庄正定机场': [114.69976, 38.27772],
            '首都机场': [116.586, 40.075],
            '秦皇岛山海关机场': [119.73448, 39.96991],
            '南苑机场': [116.39534, 39.79076],
            '张家口机场': [114.87, 40.82]
        };

        function convertData(data) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var geoCoord = geoCoordMap[data[i].name];
                if (geoCoord) {
                    res.push({
                        name: data[i].name,
                        value: geoCoord.concat(data[i].value)
                    });
                }
            }
            return res;
        }


        option = {

            title: {
                text: '京津冀航班次日延误预测概览',
                x: 'center',
                textStyle: {
                    color: '#fff',
                    fontSize: 25,
                }
            },
            backgroundColor: '#404a59',
            tooltip: {
                show:false
            },

            geo: {
                center: [117.35881, 39.7],
                zoom: 6.5,
                map: 'china',
                roam: true,
                itemStyle: {
                    normal: {
                        borderColor: 'rgba(100,149,237,1)',
                        borderWidth: 1.5,
                        areaColor:'#323c48'
                    },
                    color:'#1b1b1b',
                    emphasis: {
                        areaColor: '#2a333d'
                    }
                },
                label: {
                    normal: {
                        show: true,
                        textStyle: {
                            color: 'rgba(0,0,0,0.4)'
                        }
                    }
                },
            },
            series: [
                {
                    type: 'effectScatter',
                    coordinateSystem: 'geo',
                    data: convertData(data),
                    symbol: 'path://M562.1 414.5c-0.7 17.9 6 29.8 21.5 39.4 68.6 42.1 136.8 85 205 127.8 17.3 10.8 27.4 46.1 18.3 64-4.2 8.3-11 6.5-18.1 4.2-50-15.7-100.1-31.3-150.1-46.9-19.1-5.9-38.1-11.9-57.3-17.6-14.6-4.4-19-1.7-19.1 13-0.3 44.1-0.2 88.1 0 132.2 0 11.7 5 21.2 14.6 28.2 9.3 6.8 18.2 14.2 27.6 20.7 14 9.6 20.6 22.3 19.4 39.5-1.1 16.5-5.3 20.1-21.9 15.5-21.2-5.8-42.4-11.6-63.3-18.2-15.4-4.9-30.3-4.8-45.6-0.1-21.4 6.6-43.1 12.7-64.7 18.7-15.4 4.3-19.8 0.3-20.8-15.3-1.2-17.7 5.7-30.3 20-40.7 48-35.2 40.8-25.4 41.5-82.2 0.3-31.5 0.2-63.1-0.1-94.6-0.2-19.1-3.4-21.5-21.5-15.9-66.7 20.7-133.4 41.6-200.2 62.4-20.6 6.4-22.5 4-24.4-17.3-2.3-26.5 6.9-43.2 30.6-57.2 66.3-39.2 130.8-81.4 196.4-121.8 14.1-8.7 19.4-19.8 19.3-35.9-0.5-47.6-0.4-95.2 0.1-142.7 0.3-23.9 14-42 34.3-47.5 19.2-5.3 39.6 2.7 50.9 20 6 9.1 7.9 19.3 7.8 30-0.1 12 0 24 0 36.1V347c0 22.5 0.7 45-0.2 67.5z',
                    symbolRotate: 35,
                    symbolSize: function(val) {
                        return Math.log10(val[2]+10) * 10;
                    },
                    showEffectOn: 'render',
                    rippleEffect: {
                        brushType: 'stroke'
                    },
                    hoverAnimation: true,
                    label: {
                        normal: {
                            formatter: '{b}',
                            position: 'right',
                            show: true
                        }
                    },
                    //需要写配置文件
                    itemStyle: {
                        normal: {
                            color: function (val) {
                                var value = val.value[2];
                                var color = "#07f4ea";
                                if (value>=0&&value<5){
                                    color = '#19F41B'
                                }else if (value>=5&&value<10){
                                    color = '#f4e925'
                                }else if (value>=10&&value<30){
                                    color = '#f49309'
                                }else if (value>=30){
                                    color = '#f42513'
                                }
                                return color;
                            },
                            shadowBlur: 10,
                            shadowColor: '#333'
                        }
                    },
                    zlevel: 1
                },
                {
                    name: '延误情况',
                    type: 'map',
                    geoIndex: 0,
                    tooltip: {show: false},
                    data: [
                        {name: '北京', value: (parseInt(data[3].value) + parseInt(data[2].value))},
                        {name: '天津', value: data[1].value},
                        {name: '河北', value: data[0].value},
                    ]
                }
            ]
        };

        myChart.setOption(option, true);
        myChart.on('click', {seriesIndex: 1, name: '北京'}, function () {
            $('.checkbox>input').eq(0).prop("checked", true);
            $('.checkbox>input').eq(1).prop("checked", true);
            $('.checkbox>input').eq(2).removeAttr("checked");
            $('.checkbox>input').eq(3).removeAttr("checked");
            $('#filterBody>tr').hide().filter(":contains('" + '北京' + "'),:contains('" + '大兴' + "')").show();
        });
        myChart.on('click', {seriesIndex: 1, name: '天津'}, function () {
            $('.checkbox>input').eq(2).prop("checked", true).siblings().prop("checked", false);
            $('#filterBody>tr').hide().filter(":contains('" + '天津' + "')").show();
        });
        myChart.on('click', {seriesIndex: 1, name: '河北'}, function () {
            $('.checkbox>input').eq(3).prop("checked", true).siblings().prop("checked", false);
            $('#filterBody>tr').hide().filter(":contains('" + '石家庄' + "')").show();
        });


        // 表格容器
        var mybarChart = echarts.init(document.querySelector('#barContainer'));
        var baroption = {

            title: {
                text: '京津冀次日航班延误情况统计图',
                left: 'center',
                textStyle: {
                    color: '#080808',
                    fontFamily: "华文楷体",
                }
            },

            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['首都机场', '大兴机场', '天津机场', '石家庄机场'],
                top: 30
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value'
            },
            yAxis: {
                type: 'category',
                data: ['正常航班', '轻度延误', '中度延误', '重度延误']
            },
            series: [
                {
                    name: '首都机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value : delayStr[0],label: {show: true, position: 'insideRight'}}, {value :delayStr[1],label: {show: true, position: 'insideRight'}}, {value :delayStr[2],label: {show: true, position: 'insideRight'}}, {value :delayStr[3],label: {show: true, position: 'insideRight'}}]
                },
                {
                    name: '大兴机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value :delayStr[4],label: {show: true, position: 'insideRight'}}, {value :delayStr[5],label: {show: true, position: 'insideRight'}}, {value :delayStr[6],label: {show: true, position: 'insideRight'}}, {value :delayStr[7],label: {show: true, position: 'insideRight'}}]
                },
                {
                    name: '天津机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value :delayStr[8],label: {show: true, position: 'insideRight'}}, {value :delayStr[9],label: {show: true, position: 'insideRight'}}, {value :delayStr[10],label: {show: true, position: 'insideRight'}}, {value :delayStr[11],label: {show: true, position: 'insideRight'}}]
                },
                {
                    name: '石家庄机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value :delayStr[12],label: {show: true, position: 'insideRight'}}, {value :delayStr[13],label: {show: true, position: 'insideRight'}}, {value :delayStr[14],label: {show: true, position: 'insideRight'}}, {value :delayStr[15],label: {show: true, position: 'insideRight'}}]
                }
            ]
        };
        const opt0 = baroption.series[0];
        const opt1 = baroption.series[1];
        const opt2 = baroption.series[2];
        const opt3 = baroption.series[3];
        hittable(opt0);hittable(opt1);hittable(opt2);hittable(opt3);
        function hittable(opt) {
            $.each(opt.data,function (n,item) {
                if (parseInt(item.value) === 0){
                    item.label.show = false;
                }
            })
        }
        mybarChart.setOption(baroption);

    }

</script>



