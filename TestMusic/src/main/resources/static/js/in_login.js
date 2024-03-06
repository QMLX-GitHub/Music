// <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>先在页面引用一下jquery库
//获取登录表单元素：通过$('#form')选择器获取具有id为"form"的表单元素。
//监听表单的提交事件：使用.on()函数在表单元素上绑定submit事件的处理函数。
//阻止表单默认提交行为：使用event.preventDefault()方法阻止表单默认的提交行为，避免页面刷新。
//获取用户名和密码的输入框的值：通过$('input[name="username"]').val()和$('input[name="password"]').val()来获取用户名和密码输入框的值。
//发送登录请求：使用$.ajax()函数发送一个POST请求到/loginRequest的URL。
//url: '/loginRequest' 指定请求的URL。
//type: 'POST' 指定请求的方法为POST。
//dataType: 'json' 指定响应的数据类型为JSON。
//contentType: 'application/json' 指定请求的Content-Type为JSON格式。
//data: JSON.stringify({ username: username, password: password }) 将用户名和密码以JSON格式发送给服务器。
//success 回调函数处理请求成功的逻辑，根据响应的success属性来判断登录是否成功。
//error 回调函数处理请求失败的逻辑。
//登录成功的处理逻辑：如果响应的success属性为true，则执行逻辑来进行下一步操作，如页面跳转或显示成功提示。
//登录失败的处理逻辑：如果响应的success属性为false，则显示错误信息给用户，提示登录失败。
//请求失败的处理逻辑：如果请求过程中出现错误，如网络连接问题，显示错误信息给用户，提示登录请求失败。


// 获取登录表单元素
var form = $('#form');

// 监听表单的提交事件
form.on('submit', function(event) {
    event.preventDefault(); // 阻止表单默认提交行为

    // 获取用户名和密码输入框的值
    var username = $('input[name="username"]').val();
    var password = $('input[name="password"]').val();

    // 发送登录请求
    $.ajax({
        url: '/loginRequest',
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify({ username: username, password: password }),

        success: function(response) {
            // 登录成功的处理逻辑
            if (response.success) {

                // 登录成功，进行下一步操作，如页面跳转或显示成功提示
            } else {
                // 登录失败，显示错误信息给用户
                alert('登录失败，请稍后重试！');
            }
        },

        error: function() {
            // 请求失败，显示错误信息给用户
            alert('登录请求失败，请稍后重试！');
        }
    });
});
