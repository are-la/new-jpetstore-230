function dynamicSecurity(){
    //document.getElementById("securitycode").src="validateCode";
    $("#security").attr("src","validateCode?r"+Math.random());//实现局部刷新
}

function checkCode(){
    var check = true;
    //获取用户输入的验证码信息
    var code = $("#checkPIN").val().trim();
    if(code == ''){
        $("#is_right").html("验证码不能为空");
        return false;
    }

    //验证码不为空就进行校验
    $.ajax({
        url:"checkPIN",
        type:"post",
        async:false,
        data:{checkPIN:$("#checkPIN").val()},
        dataType:"text",
        success:function(data){//data是服务器返回的消息
            $("#is_right").html(data);
            if(data == '验证码错误'){
                check = false;
                $("#security").attr("src","validateCode?r"+Math.random());
                document.getElementById('is_right').style.color = '#f00';
                //$("#checkPIN").val("");
            }else {
                document.getElementById('is_right').style.color = '#000';
            }
        }
    })
    return check;
}


// // 输入框清除
// $(function () {
//
//     // 监听输入框内容变动
//     $(".input-group-clear").bind("input propertychange", function () {
//         // 获取输入框的值
//         var inputValue = $(this).children('input').val();
//         // 判断输入框是否有值
//         if (inputValue >= 1) {
//             // 显示清除
//             $(this).children('.input-clear').show();
//         } else {
//             // 隐藏清除
//             $(this).children('.input-clear').hide();
//         }
//
//     });
//
//     // 输入框获取焦点事件，判断输入框是否有值，有值则显示清除
//     $(".input-group-clear").children('input').focus(function () {
//
//         var inputValue = this.value.length;
//
//         if (inputValue >= 1) {
//             $(this).siblings('.input-clear').show();
//         }
//
//     });
//
//     // 点击清除事件
//     $('.input-clear').click(function () {
//         // 清空输入框值
//         $(this).siblings('input').val('');
//         // 隐藏清除
//         $(this).hide();
//
//     });
//
//     // 离开输入框div事件，隐藏清除,此处不能使用blur，因为blur只对输入框有效
//     $(".input-group-clear").focusout(function () {
//
//         var igc = $(this);
//         // 设置一个定时器，离开输入框div，200毫秒后隐藏清除，不设置定时器会出现点击清除无效的情况
//         setTimeout(function () {
//             igc.children('.input-clear').hide();
//         }, 200)
//
//     });
// })
