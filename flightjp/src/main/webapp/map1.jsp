<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="/images/favicon.ico">
    <!-- App css -->
    <link href="/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/app.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/mapjsp.css">
    <link rel="stylesheet" href="css/laydate.css"/>
    <link rel="stylesheet" href="css/analysis.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/work.js"></script>
    <script src="/js/jquery.tablesorter.min.js"></script>
    <script src="/js/echarts.min.js"></script>
    <script src="/js/china.js"></script>
    <%--表格相关动态--%>
    <script src="/js/mapjsp.js"></script>
    <script src="js/laydate.js"></script>
</head>
<body>
<%--菜单栏--%>
<div class="head_warp">
    <div class="head">
        <div class="navbg">
            <div class="col960 float-left">
                <ul id="navul" class="cl">
                    <li><a href="#" target="_blank">首页</a></li>
                    <li><a href="#" title="Html">航班数据统计</a>
                        <ul>
                            <li><a href="#" title="日延误统计">日延误统计</a></li>
                            <li><a href="#" title="月延误统计">月延误统计</a></li>
                            <li><a href="#" title="年延误统计">年延误统计</a></li>
                        </ul>
                    </li>
                    <li><a href="#" title="航班信息">航班信息</a>
                        <ul>
                            <li><a href="#" title="航班信息查询">航班信息查询</a></li>
                        </ul>
                    </li>
                    <li><a href="#" title="航班调整">航班调整</a>
                        <ul>
                            <li><a href="#" title="调整页面">调整页面</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="float-right"
                 style="background-color: #1e90ff;padding: 8px 10px;font-size: 14px;border-radius: 3px;">
                <a href="" style="color: #fff;">登录/注册</a>
            </div>
        </div>
    </div>
</div>
<%--下方--%>
<div style="background: #88b7e4;width: 100%; position: absolute;margin: 0 auto;">
    <div class="data_wrap">
        <%--        查询模块--%>
        <div class="backgroundimage">
            <div class="search">
                <div class="stop_image">
                    <p>Living on time</p>
                    <p>可靠的航班动态数据服务</p>
                </div>
                <div class="search-box">
                    <div class="search_bar_tog">按航班号</div>
                    <div class="float-left" style="padding:0px 5px">
                        <input type="text" class="search_input" placeholder="请输入航班号">
                    </div>
                    <%--                    日历模块--%>
                    <div class="float-left" style="padding:0px 5px">
                        <input type="text" id="laydateInput" placeholder="出发时间"/>
                        <img src="images/calendar.png" alt="" class="icon data-icon">
                        <div class="select-date">
                            <div class="select-date-header">
                                <ul class="heade-ul">
                                    <li class="header-item header-item-one">
                                        <select name="" id="yearList"></select>
                                    </li>
                                    <li class="header-item header-item-two" onselectstart="return false">
                                        <select name="" id="monthList"></select>
                                    </li>
                                    <li class="header-item header-item-three" onselectstart="return false">
                                        <span class="reback">回到今天</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="select-date-body">
                                <ul class="week-list">
                                    <li>日</li>
                                    <li>一</li>
                                    <li>二</li>
                                    <li>三</li>
                                    <li>四</li>
                                    <li>五</li>
                                    <li>六</li>
                                </ul>
                                <ul class="day-tabel"></ul>
                            </div>
                        </div>
                    </div>
                    <input type="text" class="y-btn-grey" value="查询">
                    <%--        保证页面外层div被撑开--%>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
        <%--    页面中部布局--%>
        <div class="table-list">
            <div class="overview-card-title-container">
                <label class="overview-card-title">今日航班统计</label>
                <a href="#" class="float-right" style="font-size: 18px;color: #828282;">更多信息>></a>
            </div>
            <table cellspacing="0" cellpadding="0" class="list">
                <tbody>
                <tr class="title">
                    <th></th>
                    <th>航班总流量（架次）</th>
                    <th>延误航班量（架次）</th>
                    <th>延误率</th>
                    <th>平均延误时长</th>
                    <th>延误发生最多时间段</th>
                    <th>北京地区延误航班占比</th>
                    <th class="empty-tr0"></th>
                </tr>
                <tr class="highlight">
                    <td class="normal">首都机场</td>
                    <td class="">1,087</td>
                    <td class="">380</td>
                    <td class="">30%</td>
                    <td class="">00:05:42</td>
                    <td class="">--</td>
                    <td class="">51.42%</td>
                    <td class="empty-tr0"></td>
                </tr>
                <tr>
                    <td class="normal">大兴机场</td>
                    <td class="">2,969</td>
                    <td class="">838</td>
                    <td class="">41%</td>
                    <td class="">00:08:17</td>
                    <td class="">--</td>
                    <td class="">49.68%</td>
                    <td class="empty-tr0"></td>
                </tr>
                <tr>
                    <td class="normal">天津机场</td>
                    <td class="">2,362</td>
                    <td class="">300</td>
                    <td class="">29%</td>
                    <td class="">--</td>
                    <td class="">--</td>
                    <td class="">--</td>
                    <td class="empty-tr0"></td>
                </tr>
                <tr>
                    <td class="normal">石家庄机场</td>
                    <td class="">2,362</td>
                    <td class="">300</td>
                    <td class="">29%</td>
                    <td class="">--</td>
                    <td class="">--</td>
                    <td class="">--</td>
                    <td class="empty-tr0"></td>
                </tr>
                <tr class="empty-tr1"></tr>
                </tbody>
            </table>
            <div id="main1" class="my_main" style="width: 100%;margin-top: 10px;"></div>
        </div>
        <!-- 页面下方布局 -->
        <div style="width: 100%;padding-top: 10px;background-color: #fff;margin-top: 10px; padding-bottom:10px; margin-bottom: 20px;">
            <!-- 地图模块 -->
            <div id="container"></div>
            <!-- 京津冀延误情况表格 -->
            <div id="tableleft">
                <div class="float-right">
                    <a href="#" class="float-right" style="font-size: 18px;color: #828282;">完整信息>></a>
                </div>
                <div id="tabledelay">
                    <div>
                        京津冀机场次日延误航班
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
            <div style="clear: both"></div>
        </div>
        <%--        保证页面外层div被撑开--%>
        <div style="clear: both"></div>
    </div>
</div>
</div>
</body>
</html>
<%--日历特效--%>
<script type="text/javascript">
    $(".navbg").capacityFixed();

    function getSelectDate(result) {
        //这里获取选择的日期
        console.log(result);
    }
</script>
<!-- echarts地图-->
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
            {name: '石家庄正定机场', value: delayStr[13] + delayStr[14] + delayStr[15]},
            {name: '天津滨海国际机场', value: delayStr[9] + delayStr[10] + delayStr[11]},
            {name: '首都机场', value: 0},
            {name: '大兴国际机场', value: delayStr[5] + delayStr[6] + delayStr[7]},
        ];

        var geoCoordMap = {
            '天津滨海国际机场': [117.20, 39.07],
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
                show: false
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
                        areaColor: '#323c48'
                    },
                    color: '#1b1b1b',
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
                    symbolSize: function (val) {
                        return Math.log10(val[2] + 10) * 10;
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
                                if (value >= 0 && value < 5) {
                                    color = '#19F41B'
                                } else if (value >= 5 && value < 10) {
                                    color = '#f4e925'
                                } else if (value >= 10 && value < 30) {
                                    color = '#f49309'
                                } else if (value >= 30) {
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
                    data: [{value: delayStr[0], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[1],
                        label: {show: true, position: 'insideRight'}
                    }, {value: delayStr[2], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[3],
                        label: {show: true, position: 'insideRight'}
                    }]
                },
                {
                    name: '大兴机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value: delayStr[4], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[5],
                        label: {show: true, position: 'insideRight'}
                    }, {value: delayStr[6], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[7],
                        label: {show: true, position: 'insideRight'}
                    }]
                },
                {
                    name: '天津机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value: delayStr[8], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[9],
                        label: {show: true, position: 'insideRight'}
                    }, {value: delayStr[10], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[11],
                        label: {show: true, position: 'insideRight'}
                    }]
                },
                {
                    name: '石家庄机场',
                    type: 'bar',
                    stack: '总量',
                    data: [{value: delayStr[12], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[13],
                        label: {show: true, position: 'insideRight'}
                    }, {value: delayStr[14], label: {show: true, position: 'insideRight'}}, {
                        value: delayStr[15],
                        label: {show: true, position: 'insideRight'}
                    }]
                }
            ]
        };
        const opt0 = baroption.series[0];
        const opt1 = baroption.series[1];
        const opt2 = baroption.series[2];
        const opt3 = baroption.series[3];
        hittable(opt0);
        hittable(opt1);
        hittable(opt2);
        hittable(opt3);

        function hittable(opt) {
            $.each(opt.data, function (n, item) {
                if (parseInt(item.value) === 0) {
                    item.label.show = false;
                }
            })
        }

        mybarChart.setOption(baroption);
    }

</script>
<%--统计表格--%>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main1'), 'light');

    var date = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];

    var option = {
        title: {
            text: '今日航班起飞延误统计',
            y: 15,
            x: 20,
            borderColor: '#ccc',
            borderWidth: 1,
            padding: [8, 15],
            textStyle: {
                fontSize: 14
            }
        },
        backgroundColor: 'white',
        tooltip: {
            trigger: 'axis',
            formatter: function (data) {
                var str = data[1].name;
                data.forEach(function (item) {
                    str += '</br>' + " " + item.seriesName + ':' + item.value;
                });
                return str;

            }
        },
        legend: {
            selectedMode: false,
            data: ['首都机场延误航班', '大兴机场延误航班', '天津机场延误航班', '石家庄机场延误航班'],
            y: '20'
        },
        grid: {
            y: '100',
        },
        toolbox: {
            show: false,
            y: '20',
            feature: {
                mark: {show: false},
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        dataZoom: {
            show: true,
            realtime: true,
            y: 320,
            height: 20,
            start: 70,
            end: 100
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                boundaryGap: true,
                data: date
            }
        ],
        yAxis: [
            {
                //name : '积分数',
                type: 'value'
            }
        ],
        series: [
            {
                name: '首都机场延误航班',
                type: 'bar',
                //stack: '总量',
                barMaxWidth: 15,
                itemStyle: {
                    normal: {
                        borderWidth: 3
                    }
                },
                data: my_data()
            },
            {
                name: '大兴机场延误航班',
                type: 'bar',
                //stack: '总量',
                barMaxWidth: 15,
                itemStyle: {
                    normal: {
                        borderWidth: 3
                    }
                },
                data: my_data()
            },
            {
                name: '天津机场延误航班',
                type: 'bar',
                //stack: '总量',
                barMaxWidth: 15,
                itemStyle: {
                    normal: {
                        borderWidth: 3
                    }
                },
                data: my_data()
            },
            {
                name: '石家庄机场延误航班',
                type: 'bar',
                //stack: '总量',
                barMaxWidth: 15,
                itemStyle: {
                    normal: {
                        borderWidth: 3
                    }
                },
                data: my_data()
            },
        ]
    };

    // 为echarts对象加载数据
    myChart.setOption(option);


    function my_data() {
        var data = [];
        for (var i = 0; i < 30; i++) {
            data.push(Math.round(Math.random() * (200) + 0));
        }
        return data;
    }
</script>
