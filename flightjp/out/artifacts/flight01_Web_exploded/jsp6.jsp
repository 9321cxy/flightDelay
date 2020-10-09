<%--
  Created by IntelliJ IDEA.
  User: 26368
  Date: 2019/9/18
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<link rel="stylesheet" href="/css/main.css"/>

<!-- App favicon -->
<link rel="shortcut icon" href="/images/favicon.ico">
<!-- App css -->
<link href="/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/css/app.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/xsfx.css" />
<link rel="stylesheet" href="/jedate/skin/jedate.css" />
<link rel="stylesheet" href="/css/jquery-labelauty.css" />
<link rel="stylesheet" href="/css/alertify/alertify.min.css" />
<link rel="stylesheet" href="/css/alertify/default.min.css"/>
<!-- App favicon -->
<link rel="shortcut icon" href="/images/favicon.ico">
<!-- App css -->
<link href="/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/css/app.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/css/table.css">
<body style="height: 100%; margin: 0;padding: 0">
<div class="wrapper">
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
                    ！！					<!--航班延误分析-->
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
</div>
<div class="animsition" style="overflow: hidden;padding-left: 250px;z-index: 2;width: 100%">
    <div class="xsfx_tips">
        1.地图颜色深的地区延误情况较严重，请优先调整。<br />
        2.地区中飞机位置为各个机场位置，鼠标悬停显示各个机场的名称、坐标与延误情况。<br />
        <i class="fa fa-close"></i>
    </div>
</div>
<div style="height: 100%; position: relative">
    <div style="position: absolute;z-index: 2;margin-top: 36%;margin-left: 73%;opacity: 0.9" >
        <table id="ver-zebra" summary="Most Favorite Movies">

            <colgroup>

                <col class="vzebra-odd" />

                <col class="vzebra-even" />

                <col class="vzebra-odd" />

                <col class="vzebra-even" />

            </colgroup>

            <thead>

            <tr>

                <th scope="col" id="vzebra-comedy">机场名</th>

                <th scope="col" id="vzebra-adventure">延误情况</th>

                <th scope="col" id="vzebra-action">调整</th>


            </tr>

            </thead>

            <tbody>

            <tr>

                <td>首都机场</td>

                <td>560分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>南苑机场</td>

                <td>800分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>天津机场</td>

                <td>700分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>唐山机场</td>

                <td>55分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>秦皇岛机场</td>

                <td>73分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>承德机场</td>

                <td>25分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>张家口机场</td>

                <td>10分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>石家庄机场</td>

                <td>33分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            <tr>

                <td>邯郸机场</td>

                <td>12分钟</td>

                <td><a href="">Go>>></a></td>

            </tr>

            </tbody>

        </table>
    </div>
    <div id="container" style="height: 100%"></div>
</div>
<script type="text/javascript" src="/js/echarts.min.js"></script>
<script type="text/javascript" src="/js/echarts-gl.min.js"></script>
<script type="text/javascript" src="/js/ecStat.min.js"></script>
<script type="text/javascript" src="/js/dataTool.min.js"></script>
<script type="text/javascript" src="/js/china.js"></script>
<script type="text/javascript" src="/js/world.js"></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=wvGuSDMA4xjj0t1dPqEtibPvXY5gyN4U"></script>
<script type="text/javascript" src="/js/bmap.min.js"></script>
<script type="text/javascript" src="/js/simplex.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    var data = [
        {name: '承德机场', value:25},
        {name: '张家口机场',value:10},
        {name: '邯郸机场',value:12},
        {name: '唐山三女河机场',value:55},
        {name: '秦皇岛山海关机场',value:73},
        {name: '石家庄正定机场',value:33},
        {name: '天津', value:700},
        {name: '首都机场',value:560},
        {name: '南苑机场',value:800},

    ];

    var geoCoordMap = {
        '邯郸机场':[114.2548,36.3126],
        '唐山三女河机场':[118.00086,39.43028],
        '秦皇岛山海关机场':[119.73448,39.96991],
        '石家庄正定机场':[114.69976,38.27772],
        '首都机场':[116.5867,40.07577],
        '南苑机场':[116.39534,39.79076],
        '海门':[121.15,31.89],
        '鄂尔多斯':[109.781327,39.608266],
        '招远':[120.38,37.35],
        '舟山':[122.207216,29.985295],
        '齐齐哈尔':[123.97,47.33],
        '盐城':[120.13,33.38],
        '赤峰':[118.87,42.28],
        '青岛':[120.33,36.07],
        '乳山':[121.52,36.89],
        '金昌':[102.188043,38.520089],
        '泉州':[118.58,24.93],
        '莱西':[120.53,36.86],
        '日照':[119.46,35.42],
        '胶南':[119.97,35.88],
        '南通':[121.05,32.08],
        '拉萨':[91.11,29.97],
        '云浮':[112.02,22.93],
        '梅州':[116.1,24.55],
        '文登':[122.05,37.2],
        '上海':[121.48,31.22],
        '攀枝花':[101.718637,26.582347],
        '威海':[122.1,37.5],
        '承德机场':[117.93,40.97],
        '厦门':[118.1,24.46],
        '汕尾':[115.375279,22.786211],
        '潮州':[116.63,23.68],
        '丹东':[124.37,40.13],
        '太仓':[121.1,31.45],
        '曲靖':[103.79,25.51],
        '烟台':[121.39,37.52],
        '福州':[119.3,26.08],
        '瓦房店':[121.979603,39.627114],
        '即墨':[120.45,36.38],
        '抚顺':[123.97,41.97],
        '玉溪':[102.52,24.35],
        '张家口机场':[114.87,40.82],
        '阳泉':[113.57,37.85],
        '莱州':[119.942327,37.177017],
        '湖州':[120.1,30.86],
        '汕头':[116.69,23.39],
        '昆山':[120.95,31.39],
        '宁波':[121.56,29.86],
        '湛江':[110.359377,21.270708],
        '揭阳':[116.35,23.55],
        '荣成':[122.41,37.16],
        '连云港':[119.16,34.59],
        '葫芦岛':[120.836932,40.711052],
        '常熟':[120.74,31.64],
        '东莞':[113.75,23.04],
        '河源':[114.68,23.73],
        '淮安':[119.15,33.5],
        '泰州':[119.9,32.49],
        '南宁':[108.33,22.84],
        '营口':[122.18,40.65],
        '惠州':[114.4,23.09],
        '江阴':[120.26,31.91],
        '蓬莱':[120.75,37.8],
        '韶关':[113.62,24.84],
        '嘉峪关':[98.289152,39.77313],
        '广州':[113.23,23.16],
        '延安':[109.47,36.6],
        '太原':[112.53,37.87],
        '清远':[113.01,23.7],
        '中山':[113.38,22.52],
        '昆明':[102.73,25.04],
        '寿光':[118.73,36.86],
        '盘锦':[122.070714,41.119997],
        '长治':[113.08,36.18],
        '深圳':[114.07,22.62],
        '珠海':[113.52,22.3],
        '宿迁':[118.3,33.96],
        '咸阳':[108.72,34.36],
        '铜川':[109.11,35.09],
        '平度':[119.97,36.77],
        '佛山':[113.11,23.05],
        '海口':[110.35,20.02],
        '江门':[113.06,22.61],
        '章丘':[117.53,36.72],
        '肇庆':[112.44,23.05],
        '大连':[121.62,38.92],
        '临汾':[111.5,36.08],
        '吴江':[120.63,31.16],
        '石嘴山':[106.39,39.04],
        '沈阳':[123.38,41.8],
        '苏州':[120.62,31.32],
        '茂名':[110.88,21.68],
        '嘉兴':[120.76,30.77],
        '长春':[125.35,43.88],
        '胶州':[120.03336,36.264622],
        '银川':[106.27,38.47],
        '张家港':[120.555821,31.875428],
        '三门峡':[111.19,34.76],
        '锦州':[121.15,41.13],
        '南昌':[115.89,28.68],
        '柳州':[109.4,24.33],
        '三亚':[109.511909,18.252847],
        '自贡':[104.778442,29.33903],
        '吉林':[126.57,43.87],
        '阳江':[111.95,21.85],
        '泸州':[105.39,28.91],
        '西宁':[101.74,36.56],
        '宜宾':[104.56,29.77],
        '呼和浩特':[111.65,40.82],
        '成都':[104.06,30.67],
        '大同':[113.3,40.12],
        '镇江':[119.44,32.2],
        '桂林':[110.28,25.29],
        '张家界':[110.479191,29.117096],
        '宜兴':[119.82,31.36],
        '北海':[109.12,21.49],
        '西安':[108.95,34.27],
        '金坛':[119.56,31.74],
        '东营':[118.49,37.46],
        '牡丹江':[129.58,44.6],
        '遵义':[106.9,27.7],
        '绍兴':[120.58,30.01],
        '扬州':[119.42,32.39],
        '常州':[119.95,31.79],
        '潍坊':[119.1,36.62],
        '重庆':[106.54,29.59],
        '台州':[121.420757,28.656386],
        '南京':[118.78,32.04],
        '滨州':[118.03,37.36],
        '贵阳':[106.71,26.57],
        '无锡':[120.29,31.59],
        '本溪':[123.73,41.3],
        '克拉玛依':[84.77,45.59],
        '渭南':[109.5,34.52],
        '马鞍山':[118.48,31.56],
        '宝鸡':[107.15,34.38],
        '焦作':[113.21,35.24],
        '句容':[119.16,31.95],
        '北京':[116.46,39.92],
        '徐州':[117.2,34.26],
        '衡水':[115.72,37.72],
        '包头':[110,40.58],
        '绵阳':[104.73,31.48],
        '乌鲁木齐':[87.68,43.77],
        '枣庄':[117.57,34.86],
        '杭州':[120.19,30.26],
        '淄博':[118.05,36.78],
        '鞍山':[122.85,41.12],
        '溧阳':[119.48,31.43],
        '库尔勒':[86.06,41.68],
        '安阳':[114.35,36.1],
        '开封':[114.35,34.79],
        '济南':[117,36.65],
        '德阳':[104.37,31.13],
        '温州':[120.65,28.01],
        '九江':[115.97,29.71],
        '邯郸':[114.47,36.6],
        '临安':[119.72,30.23],
        '兰州':[103.73,36.03],
        '沧州':[116.83,38.33],
        '临沂':[118.35,35.05],
        '南充':[106.110698,30.837793],
        '天津':[117.35881,39.13081],
        '富阳':[119.95,30.07],
        '泰安':[117.13,36.18],
        '诸暨':[120.23,29.71],
        '郑州':[113.65,34.76],
        '哈尔滨':[126.63,45.75],
        '聊城':[115.97,36.45],
        '芜湖':[118.38,31.33],
        '唐山':[118.02,39.63],
        '平顶山':[113.29,33.75],
        '邢台':[114.48,37.05],
        '德州':[116.29,37.45],
        '济宁':[116.59,35.38],
        '荆州':[112.239741,30.335165],
        '宜昌':[111.3,30.7],
        '义乌':[120.06,29.32],
        '丽水':[119.92,28.45],
        '洛阳':[112.44,34.7],
        '秦皇岛':[119.57,39.95],
        '株洲':[113.16,27.83],
        '石家庄':[114.48,38.03],
        '莱芜':[117.67,36.19],
        '常德':[111.69,29.05],
        '保定':[115.48,38.85],
        '湘潭':[112.91,27.87],
        '金华':[119.64,29.12],
        '岳阳':[113.09,29.37],
        '长沙':[113,28.21],
        '衢州':[118.88,28.97],
        '廊坊':[116.7,39.53],
        '菏泽':[115.480656,35.23375],
        '合肥':[117.27,31.86],
        '武汉':[114.31,30.52],
        '大庆':[125.03,46.58]
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

    // function judge(data){
    //     var color1 =[];
    //     for (var i = 0; i< data.length; i++) {
    //         //根据下边visual map的max与min计算分三等
    //         if ((data[i].value <500)&&(data[i].value>=0)){
    //             color1.push({name: data[i].name,
    //                 value :'#15ff06'});
    //         }else if((data[i].value>=500)&&(data[i].value<1000)){
    //             color1.push({name: data[i].name,
    //                 value: '#fff105'});
    //         }else if ((data[i].value>=1000)&&(data[i].value<=1500)) {
    //             color1.push({name: data[i].name,
    //                 value: '#ff1706'});
    //         }
    //         return color1;
    //     }
    // }

    option = {

        title:{
            text: '京津冀航班延误情况',
            x: 'center',
            textStyle: {
                color: '#080808',
                fontSize:35,
                fontFamily:"华文楷体",
            }
        },
        backgroundColor: '#03caf2',
        tooltip: {},
        visualMap: {
            min: 0,
            max: 1500,
            left: 'left',
            top: 'bottom',
            text: ['High','Low'],
            seriesIndex: [1],
            inRange: {
                color: ['#e0ffff', "#006edd"]
            },
            calculable : true
        },
        geo: {
            center:[117.35881,39.13081],
            zoom:7,
            map: 'china',
            roam: false,
            label: {
                normal: {
                    show: true,
                    textStyle: {
                        color: 'rgba(0,0,0,0.4)'
                    }
                }
            },
            itemStyle: {
                normal:{
                    borderColor: 'rgba(0, 0, 0, 0.2)'
                },
                emphasis:{
                    areaColor: null,
                    shadowOffsetX: 0,
                    shadowOffsetY: 0,
                    shadowBlur: 20,
                    borderWidth: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series : [
            {
                type: 'scatter',
                coordinateSystem: 'geo',
                data: convertData(data),
                symbolSize: 30,
                symbol: 'path://M562.1 414.5c-0.7 17.9 6 29.8 21.5 39.4 68.6 42.1 136.8 85 205 127.8 17.3 10.8 27.4 46.1 18.3 64-4.2 8.3-11 6.5-18.1 4.2-50-15.7-100.1-31.3-150.1-46.9-19.1-5.9-38.1-11.9-57.3-17.6-14.6-4.4-19-1.7-19.1 13-0.3 44.1-0.2 88.1 0 132.2 0 11.7 5 21.2 14.6 28.2 9.3 6.8 18.2 14.2 27.6 20.7 14 9.6 20.6 22.3 19.4 39.5-1.1 16.5-5.3 20.1-21.9 15.5-21.2-5.8-42.4-11.6-63.3-18.2-15.4-4.9-30.3-4.8-45.6-0.1-21.4 6.6-43.1 12.7-64.7 18.7-15.4 4.3-19.8 0.3-20.8-15.3-1.2-17.7 5.7-30.3 20-40.7 48-35.2 40.8-25.4 41.5-82.2 0.3-31.5 0.2-63.1-0.1-94.6-0.2-19.1-3.4-21.5-21.5-15.9-66.7 20.7-133.4 41.6-200.2 62.4-20.6 6.4-22.5 4-24.4-17.3-2.3-26.5 6.9-43.2 30.6-57.2 66.3-39.2 130.8-81.4 196.4-121.8 14.1-8.7 19.4-19.8 19.3-35.9-0.5-47.6-0.4-95.2 0.1-142.7 0.3-23.9 14-42 34.3-47.5 19.2-5.3 39.6 2.7 50.9 20 6 9.1 7.9 19.3 7.8 30-0.1 12 0 24 0 36.1V347c0 22.5 0.7 45-0.2 67.5z',
                symbolRotate: 35,
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: true
                    }

                },
                itemStyle: {
                    normal: {
                        color: '#dd0863'
                    }
                }
            },
            {
                name: '延误情况',
                type: 'map',
                geoIndex: 0,
                // tooltip: {show: false},
                data:[
                    {name: '北京', value: (data[7].value+data[8].value)},
                    {name: '天津', value: data[6].value},
                    {name: '河北', value: (data[0].value+data[1].value+data[2].value+data[3].value+data[4].value+data[5].value)}
                ]
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
<script src="/js/jquery-latest.js"></script>
<script src="/js/jquery.tablesorter.min.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="assets/layer/layer.js"></script>
<script src="/js/alertify.min.js"></script>
<script src="/js/jquery.validate.js"></script>
<script src="/js/jquery.cityselect.js"></script>
<script src="/jedate/jquery.jedate.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/select-widget-min.js"></script>
<script src="/js/jquery.animsition.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script src="/js/macarons%20.js"></script>

<!--<script src="js/common.js"></script>-->



<script>
    var $j=jQuery.noConflict();
    //初始化切换

    $j(".animsition").animsition({

        inClass               :   'fade-in-right',
        outClass              :   'fade-out',
        inDuration            :    1500,
        outDuration           :    800,
        linkElement           :   '.animsition-link',
        // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
        loading               :    true,
        loadingParentElement  :   'body', //animsition wrapper element
        loadingClass          :   'animsition-loading',
        unSupportCss          : [ 'animation-duration',
            '-webkit-animation-duration',
            '-o-animation-duration'
        ],
        //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
        //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".

        overlay               :   false,

        overlayClass          :   'animsition-overlay-slide',
        overlayParentElement  :   'body'
    });

    //关闭提示
    $j('.xsfx_tips  i').on('click',function(){
        $j(this).parent().slideUp();
    });

    //表单筛选
    $j("#jsForm").validate({
        submitHandler: function() {   //提交成功回调
            //alert($('input[type=email]').val())
        }
    });

    //配置通用的默认提示语
    $j.extend($j.validator.messages, {
        required: '必填',
        equalTo: "请再次输入相同的值",
        url : "网址不对",
        email : "邮箱不对"
    });


    jQuery.validator.addMethod("num", function (value, element) {
        var num = /^[1-9]*[1-9][0-9]*$/;
        return this.optional(element) || (num.test(value));
    }, "请输入有效数字");

    $j('#shaixuan').click(function(){
        $j('#jsForm').submit();
    });
    $j('#czbtn').on('click',function(){
        $j('#jsForm')[0].reset();
        $('label.error').css('display','none');
    });

    //全选
    $j('#check_all').on('click',function(){
        var len = $j('.sp_check').length;
        var my_change = $j(this).prop('checked');
        for(var i=0; i<len; i++){
            $j('.sp_check').eq(i).prop('checked',my_change);
        };
        $j('#my_se_layer').slideUp();
    });

    //表格排序
    $("#sphg_table").tablesorter({
        // pass the headers argument and assing a object
        headers: {
            // assign the secound column (we start counting zero)
            0: {
                // disable it by setting the property sorter to false
                sorter: false
            }
        }
    });

    //商品下拉点击
    $j('#my_select').on('click',function () {
        //alert(1)
    });
    $j('#my_se_layer li').on('click',function () {
        $j('#my_se_layer li').removeClass('layer_active');
        $j(this).addClass('layer_active');
        $j('#my_se_layer').slideUp();
    });
    $j('#my_select').on('click',function () {
        $j('#my_se_layer').slideToggle();
    });

    $j('.tablesorter tbody tr').hover(function () {
        $(this).css('background','#d9edf7');
    },function () {
        $(this).css('background','none');
    })
    /*document.onclick = function () {
        var html = '<tr><td><label><input type="checkbox" class="sp_check" />商品名称</label></td><td>1234</td><td>1%</td><td>1%</td><td>1%</td><td>16</td><td>10</td><td>11</td></tr>';
        $j('#sphg_table').append(html);
        $("table").trigger("update");
    }*/
</script>
</body>
</html>
