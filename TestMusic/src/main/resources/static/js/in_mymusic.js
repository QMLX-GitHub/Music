//<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
//<script src="../js/in_mymusic.js"></script>
//上边两个路径添加到mymusic.html
$(document).ready(function() {
    // 发送AJAX请求到后端API
    $.ajax({
        url: '后端API的URL', // 替换为您的后端API的URL
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            // 处理响应数据并在页面上渲染
            var songData = response.songData; // 假设响应包含一个歌曲数据的数组

            // 循环遍历歌曲数据并生成每行的HTML
            var html = '';
            for (var i = 0; i < songData.length; i++) {
                html += '<tr>';
                html += '<td><a href="#">' + songData[i].title + '</a></td>';
                html += '<td><a href="#">' + songData[i].artist + '</a></td>';
                html += '<td>' + songData[i].album + '</td>';
                html += '</tr>';
            }

            // 将生成的HTML追加到表格的tbody中
            $('#songData').html(html);
        },
        error: function(xhr, status, error) {
            console.log(error); // 处理错误情况
            alert('发生错误，请稍后再试!'+error); // 创建警告弹窗
        }
    });
});