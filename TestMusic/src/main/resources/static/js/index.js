
    function ajax(opt) {
        opt = opt || {};
        opt.method = opt.method.toUpperCase() || 'POST';
        opt.url = opt.url || '';
        opt.async = opt.async || true;
        opt.data = opt.data || null;
        opt.success = opt.success || function () {};
        var xmlHttp = null;
        xmlHttp = new XMLHttpRequest()||new ActiveXObject('Microsoft.XMLHTTP');
        var params = [];
        for (var key in opt.data){
            params.push(key + '=' + opt.data[key]);
        }
        var postData = params.join('&');
        if (opt.method.toUpperCase() === 'POST') {
            xmlHttp.open(opt.method, opt.url, opt.async);
            xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8');
            xmlHttp.send(postData);
        }
        else if (opt.method.toUpperCase() === 'GET') {
            xmlHttp.open(opt.method, opt.url + '?' + postData, opt.async);
            xmlHttp.send(null);
        } 
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                 opt.success(xmlHttp.responseText);
            }
        };

        document.getElementsByClassName(".btn").addEventListener('click',()=>{
            ajax({
                url: "http://localhost:3000/playlist/detail",
                data: {
                    id: 2344558859
                },
                method: 'GET',
                success: function (response) {
                    var playlist = JSON.parse(response);
                    console.log(playlist);
     
                    var aPlayList = playlist.playlist.tracks;
                    for (var item in aPlayList) {
                        var oLi = document.createElement('li');
                        oLi.innerHTML = `<li>
                        <a href="javascript:;">${aPlayList[item].name}</a>
                    </li>`
                        oSongContainer.appendChild(oLi);
                    }
                }
            }).then(result => {
                console.log(result)
            }).catch(error => {
                console.log(error);
            });
        })
        
    
    
    }
       
    