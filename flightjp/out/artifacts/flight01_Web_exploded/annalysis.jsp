<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/4 0004
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>延误分析</title>
</head>
<link rel="stylesheet" href="/css/common.css"/>
<link rel="stylesheet" href="/css/xsfx.css"/>
<!-- App favicon -->
<link rel="shortcut icon" href="/images/favicon.ico">
<!-- App css -->
<link href="/css/icons.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/app.min.css" rel="stylesheet" type="text/css"/>
<link href="/css/analysis.css" rel="stylesheet" type="text/css"/>
<style>
    .table-list {
        padding-top: 6px;
        padding-right: 1px;
        border: 1px solid #dedede;
        border-bottom: 0;
        background-color: white;
    }

    div.table-list table.list th {
        height: 16px;
        line-height: 16px;
        padding: 13px 20px 0 10px;
        text-align: right;
        color: #5b5d61;
        white-space: nowrap;
        font-weight: 400
    }

    .overview-card-title-container {
        padding: 14px 15px 0
    }

    .overview-card-title {
        font-size: 14px;
        color: #323437;
        font-weight: 700
    }

    .list {
        border-collapse: collapse;
        width: 100%;
        font-size: 12px
    }


    tr.title {
        border-bottom: none;
        height: 50px;
        line-height: 50px
    }

    .highlight td.normal {
        padding-left: 20px;
        font-size: 12px;
        font-weight: 400;
        text-align: left
    }

    table.list tr td.normal {
        padding-left: 20px;
        width: 85px;
        text-align: left;
        color: #323437;
    }

    .highlight td {
        color: #111314;
        font-size: 16px;
        font-weight: bolder
    }

    .empty-tr0 {
        width: 1px;
        padding: 6px 19px 6px 0;
        border-left: 0
    }

    table.list tr.empty-tr1 {
        height: 20px;
        border-bottom: 1px solid #f0f0f0;
    }

    table.list tr td {
        border-left: 1px solid #f0f0f0;
        padding: 6px 20px 6px 5px;
        height: 17px;
        line-height: 17px;
        white-space: nowrap;
        text-align: right;
    }

    .rrow-down {
        background-repeat: no-repeat;
        background-position: 97% 9px;
        background-image: url(/images/arrow-down.png);
    }

    #airtable {
        width: 100%;
        margin-top: 10px;
        margin-bottom: 23px;
    }

    #airtable tbody tr td {
        width: 33%;
        height: 60px;
        font-size: 30px;
        padding-left: 20px;
        border-right: 1px solid #ededef;
        font-family: Arial;
    }

    .airtable-title {
        font-size: 16px;
        color: #5d5d61;
        margin-bottom: 5px;
    }

    .airtable-title + div span {
        font-size: 18px;
    }

    .air-type-dly {
        color: red;
    }

    .air-type-ont {
        color: rgb(47, 255, 75);
    }

    .visit-type-detail-name,
    .visit-type-detail-new,
    .visit-type-detail-old {
        width: 30%;
        text-align: center;
        color: #787a7d;
    }

    #airtable-bottom {
        width: 100%;
    }

    #airtable-bottom tr td {
        border: 1px solid #ededef;
        height: 39px;
        line-height: 39px;
        padding-bottom: 0;
        color: #414448;
    }

    .title {
        padding: 20px 20px 10px;
        background-color: white;
        margin-top: 1px;

    }

    div.l {
        color: #323437;
        font-weight: 700;
        font-size: 14px;
        display: inline;
    }

    .r {
        display: inline;
        float: right;
    }

    a.detail-report-btn {
        background-repeat: no-repeat;
        background-position: left 0;
        display: inline-block;
        text-align: center;
        width: 18px;
        height: 18px;
    }

    .circlegrey {
        width: 5px;
        height: 5px;
        border-radius: 50%;
        background-color: grey;
        display: inline-block;
    }

    .circlewhite {
        width: 6px;
        height: 6px;
        border: 1px solid #000;
        border-radius: 50%;
        background-color: white;
        display: inline-block;
    }

</style>

<body>
<!-- 菜单栏 -->
<div class="data_wrap">
    <div class="table-list">
        <div class="overview-card-title-container">
            <label class="overview-card-title">本周航班流量</label>
        </div>
        <table cellspacing="0" cellpadding="0" class="list">
            <tbody>
            <tr class="title">
                <th></th>
                <th>京津冀航班总流量（架次）</th>
                <th>延误航班量（架次）</th>
                <th>延误率</th>
                <th>平均延误时长</th>
                <th>延误发生最多时间段</th>
                <th>北京地区延误航班占比</th>
                <th class="empty-tr0"></th>
            </tr>
            <tr class="highlight">
                <td class="normal">本周</td>
                <td class="">1,087</td>
                <td class="">380</td>
                <td class="">30%</td>
                <td class="">00:05:42</td>
                <td class="">--</td>
                <td class="">51.42%</td>
                <td class="empty-tr0"></td>
            </tr>
            <tr>
                <td class="normal">上周</td>
                <td class="">2,969</td>
                <td class="">838</td>
                <td class="">41%</td>
                <td class="">00:08:17</td>
                <td class="">--</td>
                <td class="">49.68%</td>
                <td class="empty-tr0"></td>
            </tr>
            <tr>
                <td class="normal">预计下周</td>
                <td class="">2,362</td>
                <td class="rrow-down">300</td>
                <td class="rrow-down">29%</td>
                <td class="">--</td>
                <td class="">--</td>
                <td class="">--</td>
                <td class="empty-tr0"></td>
            </tr>
            <tr class="empty-tr1"></tr>
            </tbody>
        </table>
    </div>
    <div>
        <div style="position: relative;">
            <div id="hdjf_tips">
                <span id="hdjf_hdl">延误率：30%</span>
                <p id="hdjf_date">2017/1/1</p>
            </div>
            <div id="main1" class="my_main" style="width: 100%;margin-top: 10px;"></div>

        </div>
        <div style="position: relative;background-color: white;overflow-y: hidden;height:451px;" id="airportanly">
            <div>
                <div class="title">
                    <div class="l">本月首都机场航班状态</div>
                    <div class="r">
                        <a class="detail-report-btn" href="" id="beijing" target="_blank">
                            <p>>></p>
                        </a>
                    </div>
                </div>


                <div
                        style="height: 400px;padding: 0 20px; width: 69.5%;background-color: white;display: inline-block;">

                    <table id="airtable">
                        <tbody>
                        <tr>
                            <td style="text-align: center;">
                                <img src="/images/ZBAA.jpg" style="height: 60px;">
                            </td>
                            <td class="air-type-dly">
                                <div class="airtable-title">
                                    起飞延误航班
                                </div>
                                <div>
                                    27.27
                                    <span>%</span>
                                </div>
                            </td>
                            <td class="air-type-ont">
                                <div class="airtable-title">
                                    到达延误航班
                                </div>
                                <div>
                                    19.52
                                    <span>%</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="airtable-bottom">
                        <tbody>
                        <tr>
                            <td class="visit-type-detail-name">15~30min</td>
                            <td class="visit-type-detail-new">118</td>
                            <td class="visit-type-detail-new">622</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">30~45min</td>
                            <td class="visit-type-detail-new">56</td>
                            <td class="visit-type-detail-new">72</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">>45min</td>
                            <td class="visit-type-detail-new">36</td>
                            <td class="visit-type-detail-old">25</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">平均延误时长（min）</td>
                            <td class="visit-type-detail-new">25</td>
                            <td class="visit-type-detail-old">30</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误发生最多时段</td>
                            <td class="visit-type-detail-new">11：00~15：00</td>
                            <td class="visit-type-detail-old">12：00~17：00</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误次数最多</td>
                            <td class="visit-type-detail-new">CQH8587</td>
                            <td class="visit-type-detail-old">HBH3527</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误平均时间最长</td>
                            <td class="visit-type-detail-new">CQH8566</td>
                            <td class="visit-type-detail-old">CQH8692</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div id="main2"
                     style="float: right; background-color: white;width: 30.5%;height: 400px;display: inline-block; border-left: 1px solid #ededef;">
                </div>

            </div>
            <div>
                <div class="title">
                    <div class="l">本月大兴机场航班状态</div>
                    <div class="r">
                        <a class="detail-report-btn" href="">>></a>
                    </div>
                </div>
                <div
                        style="height: 400px;padding: 0 20px; width: 69.5%;background-color: white;display: inline-block;">

                    <table id="airtable">
                        <tbody>
                        <tr>
                            <td style="text-align: center;">
                                <img src="/images/ZBAA.jpg" style="height: 60px;">
                            </td>
                            <td class="air-type-dly">
                                <div class="airtable-title">
                                    起飞延误航班
                                </div>
                                <div>
                                    27.27
                                    <span>%</span>
                                </div>
                            </td>
                            <td class="air-type-ont">
                                <div class="airtable-title">
                                    到达延误航班
                                </div>
                                <div>
                                    72.73
                                    <span>%</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="airtable-bottom">
                        <tbody>
                        <tr>
                            <td class="visit-type-detail-name">15~30min</td>
                            <td class="visit-type-detail-new">118</td>
                            <td class="visit-type-detail-new">622</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">30~45min</td>
                            <td class="visit-type-detail-new">56</td>
                            <td class="visit-type-detail-new">72</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">>45min</td>
                            <td class="visit-type-detail-new">36</td>
                            <td class="visit-type-detail-old">25</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">平均延误时长（min）</td>
                            <td class="visit-type-detail-new">25</td>
                            <td class="visit-type-detail-old">30</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误发生最多时段</td>
                            <td class="visit-type-detail-new">11：00~15：00</td>
                            <td class="visit-type-detail-old">12：00~17：00</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误次数最多</td>
                            <td class="visit-type-detail-new">CQH8587</td>
                            <td class="visit-type-detail-old">HBH3527</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误平均时间最长</td>
                            <td class="visit-type-detail-new">CQH8566</td>
                            <td class="visit-type-detail-old">CQH8692</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div id="main3"
                     style="float: right; background-color: white;width: 30.5%;height: 400px;display: inline-block; border-left: 1px solid #ededef;">
                </div>
            </div>
            <div>
                <div class="title">
                    <div class="l">本月天津机场航班状态</div>
                    <div class="r">
                        <a class="detail-report-btn" href="">>></a>
                    </div>
                </div>
                <div
                        style="height: 400px;padding: 0 20px; width: 69.5%;background-color: white;display: inline-block;">

                    <table id="airtable">
                        <tbody>
                        <tr>
                            <td style="text-align: center;">
                                <img src="/images/ZBAA.jpg" style="height: 60px;">
                            </td>
                            <td class="air-type-dly">
                                <div class="airtable-title">
                                    起飞延误航班
                                </div>
                                <div>
                                    27.27
                                    <span>%</span>
                                </div>
                            </td>
                            <td class="air-type-ont">
                                <div class="airtable-title">
                                    到达延误航班
                                </div>
                                <div>
                                    72.73
                                    <span>%</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="airtable-bottom">
                        <tbody>
                        <tr>
                            <td class="visit-type-detail-name">15~30min</td>
                            <td class="visit-type-detail-new">118</td>
                            <td class="visit-type-detail-new">622</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">30~45min</td>
                            <td class="visit-type-detail-new">56</td>
                            <td class="visit-type-detail-new">72</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">>45min</td>
                            <td class="visit-type-detail-new">36</td>
                            <td class="visit-type-detail-old">25</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">平均延误时长（min）</td>
                            <td class="visit-type-detail-new">25</td>
                            <td class="visit-type-detail-old">30</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误发生最多时段</td>
                            <td class="visit-type-detail-new">11：00~15：00</td>
                            <td class="visit-type-detail-old">12：00~17：00</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误次数最多</td>
                            <td class="visit-type-detail-new">CQH8587</td>
                            <td class="visit-type-detail-old">HBH3527</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误平均时间最长</td>
                            <td class="visit-type-detail-new">CQH8566</td>
                            <td class="visit-type-detail-old">CQH8692</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div id="main4"
                     style="float: right; background-color: white;width: 30.5%;height: 400px;display: inline-block; border-left: 1px solid #ededef;">
                </div>
            </div>
            <div>
                <div class="title">
                    <div class="l">本月石家庄机场航班状态</div>
                    <div class="r">
                        <a class="detail-report-btn" href="">>></a>
                    </div>
                </div>
                <div
                        style="height: 400px;padding: 0 20px; width: 69.5%;background-color: white;display: inline-block;">

                    <table id="airtable">
                        <tbody>
                        <tr>
                            <td style="text-align: center;">
                                <img src="/images/ZBAA.jpg" style="height: 60px;">
                            </td>
                            <td class="air-type-dly">
                                <div class="airtable-title">
                                    起飞延误航班
                                </div>
                                <div>
                                    27.27
                                    <span>%</span>
                                </div>
                            </td>
                            <td class="air-type-ont">
                                <div class="airtable-title">
                                    到达延误航班
                                </div>
                                <div>
                                    72.73
                                    <span>%</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="airtable-bottom">
                        <tbody>
                        <tr>
                            <td class="visit-type-detail-name">15~30min</td>
                            <td class="visit-type-detail-new">118</td>
                            <td class="visit-type-detail-new">622</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">30~45min</td>
                            <td class="visit-type-detail-new">56</td>
                            <td class="visit-type-detail-new">72</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">>45min</td>
                            <td class="visit-type-detail-new">36</td>
                            <td class="visit-type-detail-old">25</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">平均延误时长（min）</td>
                            <td class="visit-type-detail-new">25</td>
                            <td class="visit-type-detail-old">30</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误发生最多时段</td>
                            <td class="visit-type-detail-new">11：00~15：00</td>
                            <td class="visit-type-detail-old">12：00~17：00</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误次数最多</td>
                            <td class="visit-type-detail-new">CQH8587</td>
                            <td class="visit-type-detail-old">HBH3527</td>
                        </tr>
                        <tr>
                            <td class="visit-type-detail-name">延误平均时间最长</td>
                            <td class="visit-type-detail-new">CQH8566</td>
                            <td class="visit-type-detail-old">CQH8692</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div id="main5"
                     style="float: right; background-color: white;width: 30.5%;height: 400px;display: inline-block; border-left: 1px solid #ededef;">
                </div>


            </div>
        </div>
        <div style="text-align: center;background-color: white;" id="circle">
            <li class="circlewhite"></li>
            <li class="circlegrey"></li>
            <li class="circlegrey"></li>
            <li class="circlegrey"></li>
        </div>
    </div>

</div>
</div>
</div>

</body>

</html>
<script src="/js/echarts.min.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.animsition.min.js"></script>
<script src="/js/china.js"></script>
<script>
    $(document).ready(function () {
        function getRecentDate(num) {
            let day = num || 30;
            let curDateStamp = new Date().getTime();
            let recentDateStamp;
            let prevDate;
            let prevDateList = [];
            let i = 0;
            let formatDate;
            while ((day-- > 0)) {
                recentDateStamp = day * 24 * 60 * 60 * 1000;
                prevDate = new Date(curDateStamp - recentDateStamp);
                formatDate = prevDate.getFullYear() + '-' + ((prevDate.getMonth() + 1).toString().length === 1 ? '0' + (prevDate.getMonth() + 1).toString() : (prevDate.getMonth().toString())) + '-' + (prevDate.getDate().toString().length === 1 ? '0' + prevDate.getDate().toString() : prevDate.getDate().toString());
                prevDateList[i] = formatDate;
                // console.log(formatDate);
                i++;
            }
            return prevDateList;
        }

        function getFormatDate(num) {
            let day = num;
            let curDateStamp = new Date().getTime();
            let recentDateStamp;
            let prevDate;
            let formatDate;
            recentDateStamp = day * 24 * 60 * 60 * 1000;
            prevDate = new Date(curDateStamp - recentDateStamp);
            formatDate = "2018" + ((prevDate.getMonth() + 1).toString().length === 1 ? '0' + (prevDate.getMonth() + 1).toString() : (prevDate.getMonth().toString())) + (prevDate.getDate().toString().length === 1 ? '0' + prevDate.getDate().toString() : prevDate.getDate().toString());
            return formatDate;
        }
        function getCurDateStamp() {
            let prevDate = new Date();
            formatDate = "2018" + ((prevDate.getMonth() + 1).toString().length === 1 ? '0' + (prevDate.getMonth() + 1).toString() : (prevDate.getMonth().toString())) + (prevDate.getDate().toString().length === 1 ? '0' + prevDate.getDate().toString() : prevDate.getDate().toString());
            return formatDate;
        }

        //控制跳转页面
        $('#beijing').click(function () {
            var formatDate = getFormatDate(29);
            var curDateStamp = getCurDateStamp();
            var route = '<%=request.getContextPath()%>' + "/controller/findbycondition?date_start="+formatDate+"&date_end="+curDateStamp+"&originairport=ZBAA";
            $('#beijing').attr('href',route);
            $('#beijing>p').trigger('click')
        })

        //时间坐标
        var date = getRecentDate(30);
        var fligthdata;
        //获取数据
        $.ajax({
            type:"POST",
            url:"controller/analysis",
            dateType:"JSON",
            async:false,
            success:function (data) {
                fligthdata = data.analysis_0_0;
                console.log(fligthdata)
            },
            error:function () {
                alert("获取失败")
            }
        })


        function getdata() {

        }

        //虚拟随机数据
        function my_data() {
            var data = [];
            for (var i = 0; i < 30; i++) {
                data.push(Math.round(Math.random() * (200) + 0));
            }
            return data;
        }

        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main1'), 'light');


        var option = {
            title: {
                text: '本月航班起飞延误统计',
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


                    $('#hdjf_date').html(data[1].name);
                    $('#hdjf_hdl').html('延误率：27.27%');


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


        //关闭提示
        $('.xsfx_tips').mouseenter(function () {
            $(this).slideUp();
        })
    });
</script>
<script>
    var chart2 = echarts.init(document.getElementById('main2'));
    var chart3 = echarts.init(document.getElementById('main3'));
    var chart4 = echarts.init(document.getElementById('main4'));
    var chart5 = echarts.init(document.getElementById('main5'));
    // 中国地图线路特效配置 start

    //  在线经纬度查询网址推荐： https://jingweidu.51240.com/
    let geoCoordMap = { // 地图地点的经度纬度
        '上海': [121.4648, 31.2891],
        '东莞': [113.8953, 22.901],
        '东营': [118.7073, 37.5513],
        '中山': [113.4229, 22.478],
        '临汾': [111.4783, 36.1615],
        '临沂': [118.3118, 35.2936],
        '丹东': [124.541, 40.4242],
        '丽水': [119.5642, 28.1854],
        '乌鲁木齐': [87.9236, 43.5883],
        '佛山': [112.8955, 23.1097],
        '保定': [115.0488, 39.0948],
        '兰州': [103.5901, 36.3043],
        '包头': [110.3467, 41.4899],
        '北京': [116.4551, 40.2539],
        '北海': [109.314, 21.6211],
        '南京': [118.8062, 31.9208],
        '南宁': [108.479, 23.1152],
        '南昌': [116.0046, 28.6633],
        '南通': [121.1023, 32.1625],
        '厦门': [118.1689, 24.6478],
        '台州': [121.1353, 28.6688],
        '合肥': [117.29, 32.0581],
        '呼和浩特': [111.4124, 40.4901],
        '咸阳': [108.4131, 34.8706],
        '哈尔滨': [127.9688, 45.368],
        '唐山': [118.4766, 39.6826],
        '嘉兴': [120.9155, 30.6354],
        '大同': [113.7854, 39.8035],
        '大连': [122.2229, 39.4409],
        '天津': [117.4219, 39.4189],
        '太原': [112.3352, 37.9413],
        '威海': [121.9482, 37.1393],
        '宁波': [121.5967, 29.6466],
        '宝鸡': [107.1826, 34.3433],
        '宿迁': [118.5535, 33.7775],
        '常州': [119.4543, 31.5582],
        '广州': [113.5107, 23.2196],
        '廊坊': [116.521, 39.0509],
        '延安': [109.1052, 36.4252],
        '张家口': [115.1477, 40.8527],
        '徐州': [117.5208, 34.3268],
        '德州': [116.6858, 37.2107],
        '惠州': [114.6204, 23.1647],
        '成都': [103.9526, 30.7617],
        '扬州': [119.4653, 32.8162],
        '承德': [117.5757, 41.4075],
        '拉萨': [91.1865, 30.1465],
        '无锡': [120.3442, 31.5527],
        '日照': [119.2786, 35.5023],
        '昆明': [102.9199, 25.4663],
        '杭州': [119.5313, 29.8773],
        '枣庄': [117.323, 34.8926],
        '柳州': [109.3799, 24.9774],
        '株洲': [113.5327, 27.0319],
        '武汉': [114.3896, 30.6628],
        '汕头': [117.1692, 23.3405],
        '江门': [112.6318, 22.1484],
        '沈阳': [123.1238, 42.1216],
        '沧州': [116.8286, 38.2104],
        '河源': [114.917, 23.9722],
        '泉州': [118.3228, 25.1147],
        '泰安': [117.0264, 36.0516],
        '泰州': [120.0586, 32.5525],
        '济南': [117.1582, 36.8701],
        '济宁': [116.8286, 35.3375],
        '海口': [110.3893, 19.8516],
        '淄博': [118.0371, 36.6064],
        '淮安': [118.927, 33.4039],
        '深圳': [114.5435, 22.5439],
        '清远': [112.9175, 24.3292],
        '温州': [120.498, 27.8119],
        '渭南': [109.7864, 35.0299],
        '湖州': [119.8608, 30.7782],
        '湘潭': [112.5439, 27.7075],
        '滨州': [117.8174, 37.4963],
        '潍坊': [119.0918, 36.524],
        '烟台': [120.7397, 37.5128],
        '玉溪': [101.9312, 23.8898],
        '珠海': [113.7305, 22.1155],
        '盐城': [120.2234, 33.5577],
        '盘锦': [121.9482, 41.0449],
        '石家庄': [114.4995, 38.1006],
        '福州': [119.4543, 25.9222],
        '秦皇岛': [119.2126, 40.0232],
        '绍兴': [120.564, 29.7565],
        '聊城': [115.9167, 36.4032],
        '肇庆': [112.1265, 23.5822],
        '舟山': [122.2559, 30.2234],
        '苏州': [120.6519, 31.3989],
        '莱芜': [117.6526, 36.2714],
        '菏泽': [115.6201, 35.2057],
        '营口': [122.4316, 40.4297],
        '葫芦岛': [120.1575, 40.578],
        '衡水': [115.8838, 37.7161],
        '衢州': [118.6853, 28.8666],
        '西宁': [101.4038, 36.8207],
        '西安': [109.1162, 34.2004],
        '贵阳': [106.6992, 26.7682],
        '连云港': [119.1248, 34.552],
        '邢台': [114.8071, 37.2821],
        '邯郸': [114.4775, 36.535],
        '郑州': [113.4668, 34.6234],
        '鄂尔多斯': [108.9734, 39.2487],
        '重庆': [107.7539, 30.1904],
        '金华': [120.0037, 29.1028],
        '铜川': [109.0393, 35.1947],
        '银川': [106.3586, 38.1775],
        '镇江': [119.4763, 31.9702],
        '长春': [125.8154, 44.2584],
        '长沙': [113.0823, 28.2568],
        '长治': [112.8625, 36.4746],
        '阳泉': [113.4778, 38.0951],
        '青岛': [120.4651, 36.3373],
        '韶关': [113.7964, 24.7028],
        '吐鲁番': [89.18596, 42.94244],
        '那曲': [92.05136, 31.47614],
        '吕梁': [111.15081, 37.51761],
        '伊春': [128.669, 47.72582],
        '呼伦贝尔': [119.73572, 49.21336],
        '嘉峪关': [98.33435281250001, 39.668377553435185],
        '汉中': [107.03194, 33.06784]
    }

    // 发射点数组
    let ZBAAData = [
        [
            [{name: '北京'}, {name: '吐鲁番'}],
            [{name: '北京'}, {name: '福州'}],
            [{name: '北京'}, {name: '吕梁'}],
            [{name: '北京'}, {name: '长春'}],
            [{name: '北京'}, {name: '汉中'}],
            [{name: '北京'}, {name: '那曲'}],
            [{name: '北京'}, {name: '广州'}],
            [{name: '北京'}, {name: '常州'}],
            [{name: '北京'}, {name: '吐鲁番'}],
            [{name: '北京'}, {name: '南宁'}]
        ],
        [
            [{name: '吐鲁番'}, {name: '北京'}],
            [{name: '福州'}, {name: '北京'}],
            [{name: '吕梁'}, {name: '北京'}],
            [{name: '长春'}, {name: '北京'}],
            [{name: '汉中'}, {name: '北京'}],
            [{name: '那曲'}, {name: '北京'}],
            [{name: '广州'}, {name: '北京'}],
            [{name: '常州'}, {name: '北京'}],
            [{name: '吐鲁番'}, {name: '北京'}],
            [{name: '南宁'}, {name: '北京'}]
        ]
    ]
    let ZBADData = [
        [
            [{name: '北京'}, {name: '吐鲁番'}],
            [{name: '北京'}, {name: '福州'}],
            [{name: '北京'}, {name: '吕梁'}],
            [{name: '北京'}, {name: '长春'}],
            [{name: '北京'}, {name: '汉中'}],
            [{name: '北京'}, {name: '那曲'}],
            [{name: '北京'}, {name: '广州'}],
            [{name: '北京'}, {name: '常州'}],
            [{name: '北京'}, {name: '吐鲁番'}],
            [{name: '北京'}, {name: '南宁'}]
        ],
        [
            [{name: '吐鲁番'}, {name: '北京'}],
            [{name: '福州'}, {name: '北京'}],
            [{name: '吕梁'}, {name: '北京'}],
            [{name: '长春'}, {name: '北京'}],
            [{name: '汉中'}, {name: '北京'}],
            [{name: '那曲'}, {name: '北京'}],
            [{name: '广州'}, {name: '北京'}],
            [{name: '常州'}, {name: '北京'}],
            [{name: '吐鲁番'}, {name: '北京'}],
            [{name: '南宁'}, {name: '北京'}]
        ]
    ]
    let ZBTJData = [
        [
            [{name: '天津'}, {name: '吐鲁番'}],
            [{name: '天津'}, {name: '福州'}],
            [{name: '天津'}, {name: '吕梁'}],
            [{name: '天津'}, {name: '长春'}],
            [{name: '天津'}, {name: '汉中'}],
            [{name: '天津'}, {name: '那曲'}],
            [{name: '天津'}, {name: '广州'}],
            [{name: '天津'}, {name: '常州'}],
            [{name: '天津'}, {name: '吐鲁番'}],
            [{name: '天津'}, {name: '南宁'}]
        ],
        [
            [{name: '吐鲁番'}, {name: '天津'}],
            [{name: '福州'}, {name: '天津'}],
            [{name: '吕梁'}, {name: '天津'}],
            [{name: '长春'}, {name: '天津'}],
            [{name: '汉中'}, {name: '天津'}],
            [{name: '那曲'}, {name: '天津'}],
            [{name: '广州'}, {name: '天津'}],
            [{name: '常州'}, {name: '天津'}],
            [{name: '吐鲁番'}, {name: '天津'}],
            [{name: '南宁'}, {name: '天津'}]
        ]
    ]
    let ZBSJData = [
        [
            [{name: '石家庄'}, {name: '吐鲁番'}],
            [{name: '石家庄'}, {name: '福州'}],
            [{name: '石家庄'}, {name: '吕梁'}],
            [{name: '石家庄'}, {name: '长春'}],
            [{name: '石家庄'}, {name: '汉中'}],
            [{name: '石家庄'}, {name: '那曲'}],
            [{name: '石家庄'}, {name: '广州'}],
            [{name: '石家庄'}, {name: '常州'}],
            [{name: '石家庄'}, {name: '吐鲁番'}],
            [{name: '石家庄'}, {name: '南宁'}]
        ],
        [
            [{name: '吐鲁番'}, {name: '石家庄'}],
            [{name: '福州'}, {name: '石家庄'}],
            [{name: '吕梁'}, {name: '石家庄'}],
            [{name: '长春'}, {name: '石家庄'}],
            [{name: '汉中'}, {name: '石家庄'}],
            [{name: '那曲'}, {name: '石家庄'}],
            [{name: '广州'}, {name: '石家庄'}],
            [{name: '常州'}, {name: '石家庄'}],
            [{name: '吐鲁番'}, {name: '石家庄'}],
            [{name: '南宁'}, {name: '石家庄'}]
        ]
    ]

    // 发射点数组下标
    let launchIndex = 0

    // 按照数组顺序循环发射（如果是使用定时器销毁重建图形发射点那么这个就派上用场了）
    let len = ZBAAData.length
    let arrIndex = launchIndex
    if (launchIndex < len - 1) {
        launchIndex = launchIndex + 1
    } else {
        launchIndex = 0
    }
    // 防止切换用户列表时，定时器延迟造成下标超出数组问题
    if (arrIndex > len - 1) {
        launchIndex = 0
        arrIndex = 0
    }

    // 数组遍历
    let lineDataArr = []
    lineDataArr.push(ZBAAData[arrIndex])

    // // 自定义多个发射点（push多少个就会有多少个同时发射点）
    lineDataArr.push(ZBAAData[0])
    lineDataArr.push(ZBAAData[1])

    let lineDataArr1 = []
    lineDataArr1.push(ZBADData[arrIndex])

    // // 自定义多个发射点（push多少个就会有多少个同时发射点）
    lineDataArr1.push(ZBADData[0])
    lineDataArr1.push(ZBADData[1])

    let lineDataArr2 = []
    lineDataArr1.push(ZBADData[arrIndex])

    // // 自定义多个发射点（push多少个就会有多少个同时发射点）
    lineDataArr2.push(ZBTJData[0])
    lineDataArr2.push(ZBTJData[1])

    let lineDataArr3 = []
    lineDataArr3.push(ZBSJData[arrIndex])

    // // 自定义多个发射点（push多少个就会有多少个同时发射点）
    lineDataArr3.push(ZBSJData[0])
    lineDataArr3.push(ZBSJData[1])

    // 处理线路所需要的数据格式data
    let convertData = function (data) {
        // console.log(data)
        let res = []
        for (let i = 0; i < data.length; i++) {
            let dataItem = data[i]
            let fromCoord = geoCoordMap[dataItem[0].name]
            let toCoord = geoCoordMap[dataItem[1].name]
            if (fromCoord && toCoord) {
                res.push({
                    fromName: dataItem[0].name,
                    toName: dataItem[1].name,
                    coords: [fromCoord, toCoord]
                })
            }
        }
        return res
    }
    // 发射点和线路颜色
    let color = ['#ffa022', '#a6c84c', '#46bee9'] // 橙 墨绿 蓝
    let seriesData = []
    let seriesData1 = []
    let seriesData2 = []
    let seriesData3 = []
    lineDataArr.forEach(function (item, i) {
        seriesData.push(
            { // 亮光发射效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6, // 特效动画的时间，单位为 s
                    // delay: i * 5000, // 特效动画的延时，支持设置成数字或者回调。单位ms
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 0,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 线路效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 2,
                effect: {
                    // show: true,
                    // period: 6,
                    // trailLength: 0,
                    // symbol: planePath,
                    // symbolSize: 55
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 1.5,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 文字和地点涟漪效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                // geoIndex: 0,
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    emphasis: { // 有这一层为鼠标移入涟漪点才显示文字，去掉这一层那么直接显示文字再地图上
                        show: true,
                        // position: 'top',
                        formatter: '{b}'
                        // offset: [10, -4]
                    }
                },
                // label: { // 涟漪文字位置
                //     normal: {
                //         show: true,
                //         position: 'right',
                //         formatter: '{b}'
                //     }
                // },
                symbolSize: 8,
                // symbolOffset:[4, 4], // 标记相对于原本位置的偏移
                itemStyle: { // 涟漪相关颜色
                    normal: {
                        color: color[i]
                    }
                    // color: color[i]
                },
                data: item.map(function (dataItem) {
                    return {
                        name: dataItem[1].name,
                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                    }
                })
            }
        )
    })
    // 中国地图线路特效配置 end
    lineDataArr1.forEach(function (item, i) {
        seriesData1.push(
            { // 亮光发射效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6, // 特效动画的时间，单位为 s
                    // delay: i * 5000, // 特效动画的延时，支持设置成数字或者回调。单位ms
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 0,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 线路效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 2,
                effect: {
                    // show: true,
                    // period: 6,
                    // trailLength: 0,
                    // symbol: planePath,
                    // symbolSize: 55
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 1.5,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 文字和地点涟漪效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                // geoIndex: 0,
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    emphasis: { // 有这一层为鼠标移入涟漪点才显示文字，去掉这一层那么直接显示文字再地图上
                        show: true,
                        // position: 'top',
                        formatter: '{b}'
                        // offset: [10, -4]
                    }
                },
                // label: { // 涟漪文字位置
                //     normal: {
                //         show: true,
                //         position: 'right',
                //         formatter: '{b}'
                //     }
                // },
                symbolSize: 8,
                // symbolOffset:[4, 4], // 标记相对于原本位置的偏移
                itemStyle: { // 涟漪相关颜色
                    normal: {
                        color: color[i]
                    }
                    // color: color[i]
                },
                data: item.map(function (dataItem) {
                    return {
                        name: dataItem[1].name,
                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                    }
                })
            }
        )
    })
    // 中国地图线路特效配置 end
    lineDataArr2.forEach(function (item, i) {
        seriesData2.push(
            { // 亮光发射效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6, // 特效动画的时间，单位为 s
                    // delay: i * 5000, // 特效动画的延时，支持设置成数字或者回调。单位ms
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 0,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 线路效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 2,
                effect: {
                    // show: true,
                    // period: 6,
                    // trailLength: 0,
                    // symbol: planePath,
                    // symbolSize: 55
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 1.5,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 文字和地点涟漪效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                // geoIndex: 0,
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    emphasis: { // 有这一层为鼠标移入涟漪点才显示文字，去掉这一层那么直接显示文字再地图上
                        show: true,
                        // position: 'top',
                        formatter: '{b}'
                        // offset: [10, -4]
                    }
                },
                // label: { // 涟漪文字位置
                //     normal: {
                //         show: true,
                //         position: 'right',
                //         formatter: '{b}'
                //     }
                // },
                symbolSize: 8,
                // symbolOffset:[4, 4], // 标记相对于原本位置的偏移
                itemStyle: { // 涟漪相关颜色
                    normal: {
                        color: color[i]
                    }
                    // color: color[i]
                },
                data: item.map(function (dataItem) {
                    return {
                        name: dataItem[1].name,
                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                    }
                })
            }
        )
    })
    // 中国地图线路特效配置 end
    lineDataArr3.forEach(function (item, i) {
        seriesData3.push(
            { // 亮光发射效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6, // 特效动画的时间，单位为 s
                    // delay: i * 5000, // 特效动画的延时，支持设置成数字或者回调。单位ms
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 0,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 线路效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'lines',
                zlevel: 2,
                effect: {
                    // show: true,
                    // period: 6,
                    // trailLength: 0,
                    // symbol: planePath,
                    // symbolSize: 55
                },
                label: {
                    show: true
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 1.5,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                // data: convertData(item[1])
                data: convertData(item)
            },
            { // 文字和地点涟漪效果
                // name: item[0] + ' Top10',
                name: '广州',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                // geoIndex: 0,
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    emphasis: { // 有这一层为鼠标移入涟漪点才显示文字，去掉这一层那么直接显示文字再地图上
                        show: true,
                        // position: 'top',
                        formatter: '{b}'
                        // offset: [10, -4]
                    }
                },
                // label: { // 涟漪文字位置
                //     normal: {
                //         show: true,
                //         position: 'right',
                //         formatter: '{b}'
                //     }
                // },
                symbolSize: 8,
                // symbolOffset:[4, 4], // 标记相对于原本位置的偏移
                itemStyle: { // 涟漪相关颜色
                    normal: {
                        color: color[i]
                    }
                    // color: color[i]
                },
                data: item.map(function (dataItem) {
                    return {
                        name: dataItem[1].name,
                        value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                    }
                })
            }
        )
    })
    // 中国地图线路特效配置 end


    option2 = {
        title: {
            text: '首都机场起飞、降落延误top10',
            x: 'center',
            textStyle: {
                color: '#323437',
                fontweight: 700,
                fontsize: 1
            }
        },
        backgroundColor: '#FFFFFF', // 图形容器背景色
        tooltip: { // 鼠标移到图里面的浮动提示框
            // formatter详细配置： https://echarts.baidu.com/option.html#tooltip.formatter
            formatter(params, ticket, callback) {
                // console.log(params)
                let value = params.value
                if (Array.isArray(value)) { // 鼠标移到涟漪点上不显示浮层
                    return ''
                }
                if (value === undefined) { // 鼠标移到路线上不显示浮层
                    return ''
                }
                if (isNaN(value)) {
                    value = 0
                }

                let htmlStr = `
          <div style='font-size:16px;'> ${params.name}</div>
          <p style='text-align:left;margin-top:4px;'>
            区域分布：${value}%<br/>
          </p>
        `
                return htmlStr
            }
            // backgroundColor:"#ff7f50",//提示标签背景颜色
            // textStyle:{color:"#fff"} //提示标签字体颜色
        },
        // visualMap的详细配置解析：https://echarts.baidu.com/option.html#visualMap
        // visualMap: { // 左下角的颜色区域
        //     type: 'continuous', // 定义为分段型 visualMap
        //     min: 0,
        //     max: 100,
        //     itemWidth: 10,
        //     itemHeight: 100,
        //     // top: 20,
        //     bottom: 10,
        //     left: 20,
        //     text: ['高', '低'],
        //     textStyle: { // 文字颜色
        //         color: '#ddd'
        //     },
        //     calculable: true, // 是否显示手柄
        //     inRange: {
        //         color: ['#0c1c30', '#216bc2', '#7760f6', '#9900FF'],
        //         // symbolSize: [60, 100] // 大小（这里会影响涟漪散点图的显示，所以去掉）
        //     }
        // },
        // geo配置详解： https://echarts.baidu.com/option.html#geo
        geo: { // 地理坐标系组件用于地图的绘制
            map: 'china', // 表示中国地图
            // roam: true, // 是否开启鼠标缩放和平移漫游
            zoom: 1.2, // 当前视角的缩放比例（地图的放大比例）
            // top:20,
            label: {
                show: true,
                color: '#f2f2f2' // 文字颜色
            },
            itemStyle: { // 地图区域的多边形 图形样式。
                areaColor: '#87CEFA', // 地区默认颜色
                // borderColor: '#678dd6', //片区边框颜色
                borderWidth: 1, // 边框描绘
                borderColor: '#90c5ed', //片区边框颜色
                emphasis: { // 高亮状态下的多边形和标签样式
                    areaColor: '#24cbff', // 高亮区域背景颜色
                    shadowBlur: 20,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series: [
            ...seriesData, // 中国地图线路特效配置
            {
                // name: '', // 浮动框的标题（上面的formatter自定义了提示框数据，所以这里可不写）
                type: 'map',
                geoIndex: 0,
                label: {
                    show: true
                },
                // 这是需要配置地图上的某个地区的数据，根据后台的返回的数据进行拼接（下面是我定义的假数据）
                // data: [{
                //     'name': '北京',
                //     'value': 2
                // }, {
                //     'name': '上海',
                //     'value': 80
                // }, {
                //     'name': '黑龙江',
                //     'value': 25
                // }, {
                //     'name': '新疆',
                //     'value': 10
                // }, {
                //     'name': '深圳',
                //     'value': 36
                // }, {
                //     'name': '湖北',
                //     'value': 2
                // }, {
                //     'name': '四川',
                //     'value': 60
                // }]
            }
        ]
    }
    option3 = {
        title: {
            text: '大兴机场起飞、降落延误top10',
            x: 'center',
            textStyle: {
                color: '#323437',
                fontweight: 700,
                fontsize: 1
            }
        },
        backgroundColor: '#FFFFFF', // 图形容器背景色
        tooltip: { // 鼠标移到图里面的浮动提示框
            // formatter详细配置： https://echarts.baidu.com/option.html#tooltip.formatter
            formatter(params, ticket, callback) {
                // console.log(params)
                let value = params.value
                if (Array.isArray(value)) { // 鼠标移到涟漪点上不显示浮层
                    return ''
                }
                if (value === undefined) { // 鼠标移到路线上不显示浮层
                    return ''
                }
                if (isNaN(value)) {
                    value = 0
                }

                let htmlStr = `
          <div style='font-size:16px;'> ${params.name}</div>
          <p style='text-align:left;margin-top:4px;'>
            区域分布：${value}%<br/>
          </p>
        `
                return htmlStr
            }
            // backgroundColor:"#ff7f50",//提示标签背景颜色
            // textStyle:{color:"#fff"} //提示标签字体颜色
        },
        // visualMap的详细配置解析：https://echarts.baidu.com/option.html#visualMap
        // visualMap: { // 左下角的颜色区域
        //     type: 'continuous', // 定义为分段型 visualMap
        //     min: 0,
        //     max: 100,
        //     itemWidth: 10,
        //     itemHeight: 100,
        //     // top: 20,
        //     bottom: 10,
        //     left: 20,
        //     text: ['高', '低'],
        //     textStyle: { // 文字颜色
        //         color: '#ddd'
        //     },
        //     calculable: true, // 是否显示手柄
        //     inRange: {
        //         color: ['#0c1c30', '#216bc2', '#7760f6', '#9900FF'],
        //         // symbolSize: [60, 100] // 大小（这里会影响涟漪散点图的显示，所以去掉）
        //     }
        // },
        // geo配置详解： https://echarts.baidu.com/option.html#geo
        geo: { // 地理坐标系组件用于地图的绘制
            map: 'china', // 表示中国地图
            // roam: true, // 是否开启鼠标缩放和平移漫游
            zoom: 1.2, // 当前视角的缩放比例（地图的放大比例）
            // top:20,
            label: {
                show: true,
                color: '#f2f2f2' // 文字颜色
            },
            itemStyle: { // 地图区域的多边形 图形样式。
                areaColor: '#87CEFA', // 地区默认颜色
                // borderColor: '#678dd6', //片区边框颜色
                borderWidth: 1, // 边框描绘
                borderColor: '#90c5ed', //片区边框颜色
                emphasis: { // 高亮状态下的多边形和标签样式
                    areaColor: '#24cbff', // 高亮区域背景颜色
                    shadowBlur: 20,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series: [
            ...seriesData1, // 中国地图线路特效配置
            {
                // name: '', // 浮动框的标题（上面的formatter自定义了提示框数据，所以这里可不写）
                type: 'map',
                geoIndex: 0,
                label: {
                    show: true
                },
                // 这是需要配置地图上的某个地区的数据，根据后台的返回的数据进行拼接（下面是我定义的假数据）
                // data: [{
                //     'name': '北京',
                //     'value': 2
                // }, {
                //     'name': '上海',
                //     'value': 80
                // }, {
                //     'name': '黑龙江',
                //     'value': 25
                // }, {
                //     'name': '新疆',
                //     'value': 10
                // }, {
                //     'name': '深圳',
                //     'value': 36
                // }, {
                //     'name': '湖北',
                //     'value': 2
                // }, {
                //     'name': '四川',
                //     'value': 60
                // }]
            }
        ]
    }
    option4 = {
        title: {
            text: '天津机场起飞、降落延误top10',
            x: 'center',
            textStyle: {
                color: '#323437',
                fontweight: 700,
                fontsize: 1
            }
        },
        backgroundColor: '#FFFFFF', // 图形容器背景色
        tooltip: { // 鼠标移到图里面的浮动提示框
            // formatter详细配置： https://echarts.baidu.com/option.html#tooltip.formatter
            formatter(params, ticket, callback) {
                // console.log(params)
                let value = params.value
                if (Array.isArray(value)) { // 鼠标移到涟漪点上不显示浮层
                    return ''
                }
                if (value === undefined) { // 鼠标移到路线上不显示浮层
                    return ''
                }
                if (isNaN(value)) {
                    value = 0
                }

                let htmlStr = `
          <div style='font-size:16px;'> ${params.name}</div>
          <p style='text-align:left;margin-top:4px;'>
            区域分布：${value}%<br/>
          </p>
        `
                return htmlStr
            }
            // backgroundColor:"#ff7f50",//提示标签背景颜色
            // textStyle:{color:"#fff"} //提示标签字体颜色
        },
        // visualMap的详细配置解析：https://echarts.baidu.com/option.html#visualMap
        // visualMap: { // 左下角的颜色区域
        //     type: 'continuous', // 定义为分段型 visualMap
        //     min: 0,
        //     max: 100,
        //     itemWidth: 10,
        //     itemHeight: 100,
        //     // top: 20,
        //     bottom: 10,
        //     left: 20,
        //     text: ['高', '低'],
        //     textStyle: { // 文字颜色
        //         color: '#ddd'
        //     },
        //     calculable: true, // 是否显示手柄
        //     inRange: {
        //         color: ['#0c1c30', '#216bc2', '#7760f6', '#9900FF'],
        //         // symbolSize: [60, 100] // 大小（这里会影响涟漪散点图的显示，所以去掉）
        //     }
        // },
        // geo配置详解： https://echarts.baidu.com/option.html#geo
        geo: { // 地理坐标系组件用于地图的绘制
            map: 'china', // 表示中国地图
            // roam: true, // 是否开启鼠标缩放和平移漫游
            zoom: 1.2, // 当前视角的缩放比例（地图的放大比例）
            // top:20,
            label: {
                show: true,
                color: '#f2f2f2' // 文字颜色
            },
            itemStyle: { // 地图区域的多边形 图形样式。
                areaColor: '#87CEFA', // 地区默认颜色
                // borderColor: '#678dd6', //片区边框颜色
                borderWidth: 1, // 边框描绘
                borderColor: '#90c5ed', //片区边框颜色
                emphasis: { // 高亮状态下的多边形和标签样式
                    areaColor: '#24cbff', // 高亮区域背景颜色
                    shadowBlur: 20,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series: [
            ...seriesData2, // 中国地图线路特效配置
            {
                // name: '', // 浮动框的标题（上面的formatter自定义了提示框数据，所以这里可不写）
                type: 'map',
                geoIndex: 0,
                label: {
                    show: true
                },
                // 这是需要配置地图上的某个地区的数据，根据后台的返回的数据进行拼接（下面是我定义的假数据）
                // data: [{
                //     'name': '北京',
                //     'value': 2
                // }, {
                //     'name': '上海',
                //     'value': 80
                // }, {
                //     'name': '黑龙江',
                //     'value': 25
                // }, {
                //     'name': '新疆',
                //     'value': 10
                // }, {
                //     'name': '深圳',
                //     'value': 36
                // }, {
                //     'name': '湖北',
                //     'value': 2
                // }, {
                //     'name': '四川',
                //     'value': 60
                // }]
            }
        ]
    }
    option5 = {
        title: {
            text: '石家庄机场起飞、降落延误top10',
            x: 'center',
            textStyle: {
                color: '#323437',
                fontweight: 700,
                fontsize: 1
            }
        },
        backgroundColor: '#FFFFFF', // 图形容器背景色
        tooltip: { // 鼠标移到图里面的浮动提示框
            // formatter详细配置： https://echarts.baidu.com/option.html#tooltip.formatter
            formatter(params, ticket, callback) {
                // console.log(params)
                let value = params.value
                if (Array.isArray(value)) { // 鼠标移到涟漪点上不显示浮层
                    return ''
                }
                if (value === undefined) { // 鼠标移到路线上不显示浮层
                    return ''
                }
                if (isNaN(value)) {
                    value = 0
                }

                let htmlStr = `
          <div style='font-size:16px;'> ${params.name}</div>
          <p style='text-align:left;margin-top:4px;'>
            区域分布：${value}%<br/>
          </p>
        `
                return htmlStr
            }
            // backgroundColor:"#ff7f50",//提示标签背景颜色
            // textStyle:{color:"#fff"} //提示标签字体颜色
        },
        // visualMap的详细配置解析：https://echarts.baidu.com/option.html#visualMap
        // visualMap: { // 左下角的颜色区域
        //     type: 'continuous', // 定义为分段型 visualMap
        //     min: 0,
        //     max: 100,
        //     itemWidth: 10,
        //     itemHeight: 100,
        //     // top: 20,
        //     bottom: 10,
        //     left: 20,
        //     text: ['高', '低'],
        //     textStyle: { // 文字颜色
        //         color: '#ddd'
        //     },
        //     calculable: true, // 是否显示手柄
        //     inRange: {
        //         color: ['#0c1c30', '#216bc2', '#7760f6', '#9900FF'],
        //         // symbolSize: [60, 100] // 大小（这里会影响涟漪散点图的显示，所以去掉）
        //     }
        // },
        // geo配置详解： https://echarts.baidu.com/option.html#geo
        geo: { // 地理坐标系组件用于地图的绘制
            map: 'china', // 表示中国地图
            // roam: true, // 是否开启鼠标缩放和平移漫游
            zoom: 1.2, // 当前视角的缩放比例（地图的放大比例）
            // top:20,
            label: {
                show: true,
                color: '#f2f2f2' // 文字颜色
            },
            itemStyle: { // 地图区域的多边形 图形样式。
                areaColor: '#87CEFA', // 地区默认颜色
                // borderColor: '#678dd6', //片区边框颜色
                borderWidth: 1, // 边框描绘
                borderColor: '#90c5ed', //片区边框颜色
                emphasis: { // 高亮状态下的多边形和标签样式
                    areaColor: '#24cbff', // 高亮区域背景颜色
                    shadowBlur: 20,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series: [
            ...seriesData3, // 中国地图线路特效配置
            {
                // name: '', // 浮动框的标题（上面的formatter自定义了提示框数据，所以这里可不写）
                type: 'map',
                geoIndex: 0,
                label: {
                    show: true
                },
                // 这是需要配置地图上的某个地区的数据，根据后台的返回的数据进行拼接（下面是我定义的假数据）
                // data: [{
                //     'name': '北京',
                //     'value': 2
                // }, {
                //     'name': '上海',
                //     'value': 80
                // }, {
                //     'name': '黑龙江',
                //     'value': 25
                // }, {
                //     'name': '新疆',
                //     'value': 10
                // }, {
                //     'name': '深圳',
                //     'value': 36
                // }, {
                //     'name': '湖北',
                //     'value': 2
                // }, {
                //     'name': '四川',
                //     'value': 60
                // }]
            }
        ]
    }

    chart2.setOption(option2);
    chart3.setOption(option3);
    chart4.setOption(option4);
    chart5.setOption(option5);
</script>


<script>
    $(function () {
        $("#circle").children().mouseenter(function () {
            $(this).addClass("circlewhite").removeClass("circlegrey").siblings().addClass("circlegrey").removeClass("circlewhite")
            var idx = $(this).index();
            // console.log(idx)
            $("#airportanly").children().eq(idx).show().siblings().hide();
        })
    })
</script>
