<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
                width: 500px;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
            .d-none{
                display: none;
            }
            .d-block{
                display: block;
            }
            .d-flex{
                display: flex;
                justify-content: space-between;
            }
            .error{
                background: #FFD6CC;
                padding: 15px;
                margin:  10px 0;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">


            <div class="content">
                <div id="error" class="error" style="display: none">

                </div>
                <div class="title m-b-md">
                    <div class="d-flex">
                        <input width="60%" id="link" type="text">
                        <button id="refresh" style="display: none">Refresh</button>
                        <button id="copy" style="display: none">Copy</button>
                        <button id="goo">Goo</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="/public/jquery-3.5.1.min.js"></script>

        <script>
            const goo = document.getElementById('goo'),
                refresh = document.getElementById('refresh'),
                copy = document.getElementById('copy'),
                link = document.getElementById('link'),
                error = document.getElementById('error');


            function ajaxReq(url, method='GET', callback,  data=null, beforeCallback=null) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
                    }
                });
                $.ajax({
                    url: url,
                    data: data,
                    type: method,
                    contentType: false,
                    cache: false,
                    processData: false,
                    //dataType: 'json',
                    beforeSend: function(){
                        if(beforeCallback != null)
                            beforeCallback();
                    },
                    success: function( data ) {
                        callback(data);
                    },
                    error: function( data ) {
                        console.log(data);

                    }
                });
            }


            goo.addEventListener('click', function (e) {
                e.preventDefault();
                var inputLink = link.value;

                var formData = new FormData;
                formData.append('link', inputLink)

                ajaxReq('/create', 'POST',(data)=>{
                    //console.log(data);
                    goo.innerHTML="Goo";
                    goo.removeAttribute('disabled');
                    if(data.err == 0){
                        link.value=data.link;
                        copy.style["display"] = "block";
                        refresh.style["display"] = "block";
                        error.style["display"] = "none";
                    }else{
                        error.innerHTML=data.msg;
                        error.style["display"] = "block";
                    }

                }, formData,()=>{
                    goo.setAttribute('disabled', 'true');
                    goo.innerHTML="..."
                })


            })

            refresh.addEventListener('click', function (e) {
                goo.setAttribute('disabled', 'true');
                link.value="";
                copy.style["display"] = "none";
                refresh.style["display"] = "none";
                error.style["display"] = "none";
                goo.removeAttribute('disabled');
            })


            copy.addEventListener('click', function (e) {
                e.preventDefault();
                link.select();
                document.execCommand("copy");
            })






        </script>


    </body>
</html>
