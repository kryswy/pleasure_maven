<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>享乐客服</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/chat.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    var countRecord = 0;
    var countRecord2 = 1;
    function message() {
        var a = $.blinkTitle.show();
        setTimeout(function () {
            $.blinkTitle.clear(a)
        }, 8e3)
    }
    $(function () {
        $("#d1").ready(function () {
            setInterval('show()',1000);
        });
    });

    function show() {
        var userName = '${user.userName}';
        $.post(
                "recordget.do",
                { userName: userName},
                function (data) {
                    if (countRecord2>countRecord){
                        countRecord = countRecord2;
                        $(".mes" + 3).empty();
                        $.each(data,function (i, item) {
                            var n = "";
                            var ii = "";
                            var f = item.createtime;
                            var g = item.msg;
                            if (item.direction == 1){
                                n = "享乐客服";
                                ii = "<div class='message clearfix'><div class='user-logo'>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix' style='color: #ff4d35'>"+n+"</h5>" + "<div>" + g + "</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>" + "</div>";

                            }else {
                                n = userName;
                                ii = "<div class='message clearfix'><div class='user-logo'>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix'>"+n+"</h5>" + "<div>" + g + "</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>" + "</div>";

                            }
                            $(".mes" + 3).append(ii), $(".chat01_content").scrollTop($(".mes" + 3).height());

                        });
                    }
                },
                "json");
        setTimeout('changeCount()',200);
    };

    function changeCount() {
        $.post("countrecords.do",
                null,
                function (data) {
                    console.log(data);
                    countRecord2 = data;
                });
    }

    $(document).ready(function () {
        function e() {
            function h() {
                -1 != g.indexOf("*#emo_") && (g = g.replace("*#", "<img src='img/").replace("#*", ".gif'/>"), h())
            }

            var e = new Date, f = "";
            f += e.getFullYear() + "-", f += e.getMonth() + 1 + "-", f += e.getDate() + "  ", f += e.getHours() + ":", f += e.getMinutes() + ":", f += e.getSeconds();
            var g = $("#textarea").val();
            h();
            var userName = '${user.userName}';

            var i = "<div class='message clearfix'><div class='user-logo'>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix'>"+userName+"</h5>" + "<div>" + g + "</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>" + "</div>" ;
            var ii =  "<div class='message clearfix'>" + "<div class='user-logo'>" + "<img src='" + c + "'/>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix'>" + d + "</h5>" + "<div>" + g + "\u7684\u56de\u590d\u5185\u5bb9</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>";

            if (g!=null&&g!=""&&g!=" "){
                $.post("sendmsg.do",
                        {
                            userName:userName,
                            msg:g,
                            createtime:f,
                            direction:0,
                            isread:0
                        },null,null);

            $("#textarea").val("");
            }
            else {
                alert("消息不能为空！");
            }
        }

        var a = 3, b = "img/head/2024.jpg", c = "img/head/2015.jpg", d = "\u738b\u65ed";
        $(".close_btn").click(function () {
            $(".chatBox").hide()
        }), $(".chat03_content li").mouseover(function () {
            $(this).addClass("hover").siblings().removeClass("hover")
        }).mouseout(function () {
            $(this).removeClass("hover").siblings().removeClass("hover")
        }), $(".chat03_content li").dblclick(function () {
            var b = $(this).index() + 1;
            a = b, c = "img/head/20" + (12 + a) + ".jpg", d = $(this).find(".chat03_name").text(), $(".chat01_content").scrollTop(0), $(this).addClass("choosed").siblings().removeClass("choosed"), $(".talkTo a").text($(this).children(".chat03_name").text()), $(".mes" + b).show().siblings().hide()
        }), $(".ctb01").mouseover(function () {
            $(".wl_faces_box").show()
        }).mouseout(function () {
            $(".wl_faces_box").hide()
        }), $(".wl_faces_box").mouseover(function () {
            $(".wl_faces_box").show()
        }).mouseout(function () {
            $(".wl_faces_box").hide()
        }), $(".wl_faces_close").click(function () {
            $(".wl_faces_box").hide()
        }), $(".wl_faces_main img").click(function () {
            var a = $(this).attr("src");
            $("#textarea").val($("#textarea").val() + "*#" + a.substr(a.indexOf("img/") + 4, 6) + "#*"), $("#textarea").focusEnd(), $(".wl_faces_box").hide()
        }), $(".chat02_bar img").click(function () {
            e()
        }), document.onkeydown = function (a) {
            var b = document.all ? window.event : a;
            return 13 == b.keyCode ? (e(), !1) : void 0
        }, $.fn.setCursorPosition = function (a) {
            return 0 == this.lengh ? this : $(this).setSelection(a, a)
        }, $.fn.setSelection = function (a, b) {
            if (0 == this.lengh)return this;
            if (input = this[0], input.createTextRange) {
                var c = input.createTextRange();
                c.collapse(!0), c.moveEnd("character", b), c.moveStart("character", a), c.select()
            } else input.setSelectionRange && (input.focus(), input.setSelectionRange(a, b));
            return this
        }, $.fn.focusEnd = function () {
            this.setCursorPosition(this.val().length)
        }
    }), function (a) {
        a.extend({
            blinkTitle: {
                show: function () {
                    var a = 0, b = document.title;
                    if (-1 == document.title.indexOf("\u3010"))var c = setInterval(function () {
                        a++, 3 == a && (a = 1), 1 == a && (document.title = "\u3010\u3000\u3000\u3000\u3011" + b), 2 == a && (document.title = "\u3010\u65b0\u6d88\u606f\u3011" + b)
                    }, 500);
                    return [c, b]
                }, clear: function (a) {
                    a && (clearInterval(a[0]), document.title = a[1])
                }
            }
        })
    }(jQuery);
</script>
<script src="js/IE7.js" type="text/javascript"></script>
<script src="js/iepng.js" type="text/javascript"></script>
<script type="text/javascript">
EvPNG.fix('body, div, ul, img, li, input, a, span ,label'); 
</script>
</head>
<body>

    <div class="content">
        <div class="chatBox">
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">
                        <ul class="talkTo">
                            <li><a href="javascript:;">享乐服务</a></li></ul>
                        <a class="close_btn" href="javascript:;"></a>
                    </div>
                    <div class="chat01_content">
                        <div class="message_box mes1">
                        </div>
                        <div class="message_box mes2">
                        </div>
                        <div class="message_box mes3" style="display: block;">
                        </div>
                        <div class="message_box mes4">
                        </div>
                        <div class="message_box mes5">
                        </div>
                        <div class="message_box mes6">
                        </div>
                        <div class="message_box mes7">
                        </div>
                        <div class="message_box mes8">
                        </div>
                        <div class="message_box mes9">
                        </div>
                        <div class="message_box mes10">
                        </div>
                    </div>
                </div>
                <div class="chat02">
                    <div class="chat02_title">
                        <a class="chat02_title_btn ctb01" href="javascript:;"></a>
                        <div class="wl_faces_box">
                            <div class="wl_faces_content">
                                <div class="title">
                                    <ul>
                                        <li class="title_name">常用表情</li><li class="wl_faces_close"><span>&nbsp;</span></li></ul>
                                </div>
                                <div class="wl_faces_main">
                                    <ul>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_01.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_02.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_03.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_04.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_05.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_06.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_07.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_08.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_09.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_10.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_11.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_12.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_13.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_14.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_15.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_16.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_17.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_18.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_19.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_20.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_21.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_22.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_23.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_24.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_25.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_26.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_27.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_28.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_29.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_30.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_31.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_32.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_33.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_34.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_35.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_36.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_37.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_38.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_39.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_40.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_41.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_42.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_43.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_44.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_45.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_46.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_47.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_48.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_49.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_50.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_51.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_52.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_53.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_54.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_55.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_56.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_57.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="img/emo_58.gif" /></a></li><li><a href="javascript:;">
                                                <img src="img/emo_59.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="img/emo_60.gif" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="wlf_icon">
                            </div>
                        </div>
                    </div>
                    <div class="chat02_content">
                        <textarea id="textarea"></textarea>
                    </div>
                    <div class="chat02_bar">
                        <ul>
                            <li style="left: 20px; top: 10px; padding-left: 30px;">来源：<a href="#" target="_blank">享乐</a></li>
                            <li style="right: 5px; top: 5px;"><a href="javascript:;">
                                <img src="img/send_btn.jpg"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div style="clear: both;">
            </div>
        </div>
    </div>
    <br><br>
</body>
</html>