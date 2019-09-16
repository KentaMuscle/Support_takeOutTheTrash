// 現在地取得処理
function initMap() {
    // Geolocation APIに対応している
    if (navigator.geolocation) {
        // 現在地を取得
        navigator.geolocation.getCurrentPosition(
            // 取得成功した場合
            function(position) {
                // 緯度・経度を変数に格納
                var current_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                // マップオプションを変数に格納
                var mapOptions = {
                    zoom : 15,          // 拡大倍率
                    center : current_location  // 緯度・経度
                };
                // マップオブジェクト作成
                var map = new google.maps.Map(
                    document.getElementById("map"), // マップを表示する要素
                    mapOptions         // マップオプション
                );
                //　マップにマーカーを表示する
                var marker = new google.maps.Marker({
                    map : map,             // 対象の地図オブジェクト
                    position : current_location   // 緯度・経度
                });
                var geocoder = new google.maps.Geocoder;
                document.getElementById("submit-reverse-geocoding").addEventListener("click", function() {
                    geocodeLatLng(geocoder, map, current_location);
                })

            },
            // 取得失敗した場合
            function(error) {
                // エラーメッセージを表示
                switch(error.code) {
                    case 1: // PERMISSION_DENIED
                        alert("位置情報の利用が許可されていません");
                        break;
                    case 2: // POSITION_UNAVAILABLE
                        alert("現在位置が取得できませんでした");
                        break;
                    case 3: // TIMEOUT
                        alert("タイムアウトになりました");
                        break;
                    default:
                        alert("その他のエラー(エラーコード:"+error.code+")");
                        break;
                }
            }
        );
        // Geolocation APIに対応していない
    } else {
        alert("この端末では位置情報が取得できません");
    }
}

//取得した現在地を経度緯度から住所に変換する
function geocodeLatLng(geocoder, map, current_location) {
    geocoder.geocode({'location': current_location}, function(results, status) {
        if (status === 'OK') {
            console.log(results);
            var address = results[0].formatted_address;
            //下のsplitにより、[国名、郵便番号], [住所], [名称]に分割される
            address = address.split(' ');
            document.getElementById('free').innerHTML = address[1];
            console.log(document.getElementById('free').innerHTML);
        }else{
            window.alert('Geocoder failed due to: ' + status);
        }
    });
}