// <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>先在页面引用一下jquery库
//当页面加载完成后，$(document).ready()函数会执行传入的回调函数。在这个回调函数中，注册表单的处理逻辑将被定义。
//获取注册表单元素：通过$('#form')选择器获取具有id为"form"的表单元素。
//监听表单的提交事件：使用.on()函数在表单元素上绑定submit事件的处理函数。
//阻止表单默认提交行为：使用event.preventDefault()方法阻止表单默认的提交行为，防止页面刷新。
//获取输入框的值：通过$('input[name="username"]').val()和类似的方式获取用户名、密码、以及重复密码输入框的值。
//检查密码是否一致：通过比较密码和重复密码的值，如果不一致，则显示错误提示信息，并使用return语句退出方法。
//发送注册请求：使用$.ajax()函数发送POST请求到/registerRequest的URL。
//url: '/registerRequest' 指定请求的URL。
//type: 'POST' 指定请求的方法为POST。
//dataType: 'json' 指定响应的数据类型为JSON。
//contentType: 'application/json' 指定请求的Content-Type为JSON格式。
//data: JSON.stringify({ username: username, password: password }) 将用户名和密码以JSON格式发送给服务器。
//success 回调函数处理请求成功的逻辑，根据响应的success属性判断注册是否成功。
//error 回调函数处理请求失败的逻辑。
//注册成功的处理逻辑：如果响应的success属性为true，则执行相应的逻辑，如进行下一步操作，如页面跳转或显示成功提示。
//注册失败的处理逻辑：如果响应的success属性为false，则显示错误信息给用户，提示注册失败。
//请求失败的处理逻辑：如果请求过程中出现错误，如网络连接问题，显示错误信息给用户，提示注册请求失败。

$(document).ready(function() {
    // 获取注册表单元素
    var form = $('#form');

    // 监听表单的提交事件
    form.on('submit', function(event) {
        event.preventDefault(); // 阻止表单默认提交行为

        // 获取输入框的值
        var username = $('input[name="username"]').val();
        var password = $('input[name="password"]').val();
        var password1 = $('input[name="password1"]').val();

        // 检查密码是否一致
        if (password !== password1) {
            alert('两次输入的密码不一致！');
            return;
        }

        // 发送注册请求
        $.ajax({
            url: '/registerRequest',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({ username: username, password: password }),

            success: function(response) {
                // 注册成功的处理逻辑
                if (response.success) {
                    // 注册成功，进行下一步操作，如页面跳转或显示成功提示
                } else {
                    // 注册失败，显示错误信息给用户
                    alert('注册失败，请稍后重试！');
                }
            },

            error: function() {
                // 请求失败，显示错误信息给用户
                alert('注册请求失败，请稍后重试！');
            }
        });
    });
});