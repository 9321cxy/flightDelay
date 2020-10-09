$(function () {
    var flightdata;
    var grade;
    var json = '';
    var delayStr= new Array();
    //页面加载完成后，加载数据
    $.ajax({
        type: "POST",
        url: "controller/tabaleData",
        dataType: "json",
        async: false,
        success: function (data) {
            flightdata = data;
            //接收延误航班的数据，解析json字符串
        },
        error: function () {
            alert("失败");
        }
    });
    //表格内容填充
    $.each(flightdata, function (n, item) {
        if (n < flightdata.length - 1) {
            //设置拼接的字符串
            var cel;
            // console.log(typeof item.grade)
            switch (parseInt(item.grade)) {
                case 0:
                    cel = $("<tr><td>" + item.originairport + "</td><td>" + item.flightnumber + "</td><td>" + item.crsdepTime + "</td><td style='color: green'>" + item.grade + "</td><tr/>");
                    break;
                case 1:
                    cel = $("<tr><td>" + item.originairport + "</td><td>" + item.flightnumber + "</td><td>" + item.crsdepTime + "</td><td style='color: #ffb500'>" + item.grade + "</td><tr/>");
                    break;
                case 2:
                    cel = $("<tr><td>" + item.originairport + "</td><td>" + item.flightnumber + "</td><td>" + item.crsdepTime + "</td><td style='color: #ff522c'>" + item.grade + "</td><tr/>");
                    break;
                case 3:
                    cel = $("<tr><td>" + item.originairport + "</td><td>" + item.flightnumber + "</td><td>" + item.crsdepTime + "</td><td style='color: #f80300'>" + item.grade + "</td><tr/>");
            }
            // console.log(item.grade);
            //将等字符串转化为json格式,并存入grade数组
            json += '\"' + item.flightnumber + '\":' + item.tasktype + ',';
            // 拼接字符串到html上
            $("#filterBody").append(cel);
            //将表格不同延误等级用不同颜色表示
        } else {
            delayStr = item.delayflight.split(',');
            // console.log(delayStr);
        }
    });


    //将json数组转化为json字符串
    json = "{" + json;
    json = json.substring(0, json.length - 1) + '}';
    // console.log(json);
    grade = JSON.parse(json);
    // console.log(grade.CA1119);

    //表格排序
    $("table.tablesorter").tablesorter({
        sortList: [[3, 1]],
        headers: {
            0: {sorter: false},
            1: {sorter: false},
            2: {sorter: false},
        }
    });
    //鼠标移入表格显示相应等级事件echart
    var x = 15;
    var y = 10;
    $("table.tablesorter>#filterBody>tr").mouseover(function (e) {
        var conditions = [];
        for (var i = 0; i < 4; i++) {
            conditions[i] = 'grade.' + $(this).children().eq(1).text() + '.grade' + i;
        }
        var str = "<div>" + "不延误概率：" + eval(conditions[0]) + "</div>" + "<div>" + "轻度延误概率：" + eval(conditions[1]) + "</div>"
            + "<div>" + "中度延误概率：" + eval(conditions[2]) + "</div>" + "<div>" + "重度延误概率：" + eval(conditions[3]) + "</div>";
        var tooltip = "<div id = 'tooltip'>" + str + "</div>";

        $("body").append(tooltip);
        $("#tooltip").css({"top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px"}).show("fast");
    }).mouseout(function () {
        $("#tooltip").remove();
    }).mousemove(function (e) { //当鼠标指针从元素上移动时
        $("#tooltip").css({"top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px"});
    });

    //提示框关闭
    // $('.xsfx_tips').mouseenter(function () {
    //     $(this).parent().slideUp();
    // });
    $('.checkbox>input').click(function () {
        $(".checkbox>input:checked").each(function () {
            switch ($(this).index()) {
                case 0:
                    $('#filterBody>tr').hide().filter(":contains('" + '北京' + "')").show();
                    break;
                case 1:
                    $('#filterBody>tr').hide().filter(":contains('" + '大兴' + "')").show();
                    break;
                case 2:
                    $('#filterBody>tr').hide().filter(":contains('" + '天津' + "')").show();
                    break;
                case 3:
                    $('#filterBody>tr').hide().filter(":contains('" + '石家庄' + "')").show();
                    break;
                case 4:
                    $('#filterBody>tr').show();
                    break;
            }
            ;
        });
        $(".checkbox>input:not(:checked)").each(function () {
            switch ($(this).index()) {
                case 0:
                    $('#filterBody>tr').filter(":contains('" + '北京' + "')").hide();
                    break;
                case 1:
                    $('#filterBody>tr').filter(":contains('" + '大兴' + "')").hide();
                    break;
                case 2:
                    $('#filterBody>tr').filter(":contains('" + '天津' + "')").hide();
                    break;
                case 3:
                    $('#filterBody>tr').filter(":contains('" + '石家庄' + "')").hide();
                    break;
                case 4:
                    $('#filterBody>tr').show();
                    break;
            }
        });
    });
    echart(delayStr);
})
