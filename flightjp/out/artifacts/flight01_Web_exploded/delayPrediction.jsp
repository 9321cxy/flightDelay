<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/2 0002
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--    <meta name="viewport" content="width=device-width,initial-scale=1" />-->
    <meta charset="UTF-8">
    <title></title>
    <%--    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/xsfx.css"/>
    <link rel="stylesheet" href="/jedate/skin/jedate.css"/>
    <link rel="stylesheet" href="/css/jquery-labelauty.css"/>
    <link rel="stylesheet" href="/css/alertify/alertify.min.css"/>
    <link rel="stylesheet" href="/css/alertify/default.min.css"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="/images/favicon.ico">
    <!-- App css -->
    <link href="/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/app.min.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.tablesorter.min.js"></script>
    <style>
        th{
            line-height: 150%;
            border: 1px solid #CCCCCC;
            background: #676d7d;
            padding: 9px;
            color: white;
            width: 161px;
            height:65px;
            font-weight: 600;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<!-- <%--菜单栏--%> -->
<script type="text/javascript">
    $(document).ready(function() {
        $("#sortTable").tablesorter( {sortList: [[0,0], [1,0]]} );
    });
</script>

<div>
    <div style="text-align: center">
        京津冀机场群飞机延误情况总览
    </div>
    <table id="sortTable" class="tablesorter">
        <thead>
        <tr>
            <th>机场</th>
            <th>航班号</th>
            <th>起飞时间</th>
            <th id="thd">预计延误状况（min）</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>北京</td>
            <td>123456777</td>
            <td>23：20</td>
            <td>50</td>
        </tr>
        <tr>
            <td>天津</td>
            <td>1</td>
            <td>23：20</td>
            <td>18</td>
        </tr>
        <tr>
            <td>大兴</td>
            <td>123456777</td>
            <td>23：20</td>
            <td>23</td>
        </tr>
        <tr>
            <td>大兴</td>
            <td>123456777</td>
            <td>23：20</td>
            <td>23</td>
        </tr>
        <tr>
            <td>大兴</td>
            <td>123456777</td>
            <td>23：20</td>
            <td>23</td>
        </tr>
        </tbody>
    </table>
</div>


</body>
</html>

