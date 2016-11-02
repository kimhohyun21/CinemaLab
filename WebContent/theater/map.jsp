<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>지도</title>
</head>
<body>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=B89LGmTHAKKmgnTgbizc"></script>
	<div id="map" style="border: 1px solid #000;"></div>
	<script type="text/javascript">
		var cinema;
		if(${theater=='신도림'}){
			cinema=new nhn.api.map.LatLng(37.5081508,126.88806390000002);
		}
		if(${theater=='영등포'}){
			cinema=new nhn.api.map.LatLng(37.5157744,126.90622910000002);
		} 
		/* var oSeoulCityPoint = new nhn.api.map.LatLng(37.5675451, 126.9773356); */
	    var defaultLevel = 11;
	    var oMap = new nhn.api.map.Map(document.getElementById('map'), {
	        point: cinema,
	        zoom: defaultLevel,
	        enableWheelZoom: true,
	        enableDragPan: true,
	        enableDblClickZoom: false,
	        mapMode: 0,
	        activateTrafficMap: false,
	        activateBicycleMap: false,
	        minMaxLevel: [1, 14],
	        size: new nhn.api.map.Size(1000, 480)
	    });
	    var oSlider = new nhn.api.map.ZoomControl();
	    oMap.addControl(oSlider);
	    oSlider.setPosition({
	        top: 10,
	        left: 10
	    });
	
	    var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
	    oMap.addControl(oMapTypeBtn);
	    oMapTypeBtn.setPosition({
	        bottom: 10,
	        right: 80
	    });
	
	    var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
	    oThemeMapBtn.setPosition({
	        bottom: 10,
	        right: 10
	    });
	    oMap.addControl(oThemeMapBtn);
	
	    var oSize = new nhn.api.map.Size(28, 37);
	    var oOffset = new nhn.api.map.Size(14, 37);
	    var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 
	
	    var oInfoWnd = new nhn.api.map.InfoWindow();
	    oInfoWnd.setVisible(false);
	    oMap.addOverlay(oInfoWnd);
	
	    oInfoWnd.setPosition({
	        top: 20,
	        left: 20
	    }); 
	
	    oMap.attach('click', function (oCustomEvent) {
	        var oPoint = oCustomEvent.point;
	        var oTarget = oCustomEvent.target;
	        oInfoWnd.setVisible(false);
	        // 마커 클릭하면
	        if (oTarget instanceof nhn.api.map.Marker) {
	            // 겹침 마커 클릭한거면
	            if (oCustomEvent.clickCoveredMarker) {
	                return;
	            }
	            // - InfoWindow에 들어갈 내용은 setContent로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며,
	            // - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
	            // - 단, DIV의 position style은 absolute가 되면 안되며,
	            // - absolute의 경우 autoPosition이 동작하지 않습니다.
	            oInfoWnd.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">' +
	                    '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' +
	                    'Hello World <br /> ' + oTarget.getPoint()
	                    + '<span></div>');
	            oInfoWnd.setPoint(oTarget.getPoint());
	            oInfoWnd.setPosition({right: 15, top: 30});
	            oInfoWnd.setVisible(true);
	            oInfoWnd.autoPosition();
	            return;
	        }       
	    });
	    var oMarker1 = new nhn.api.map.Marker(oIcon, { title : '' });  //마커 생성 
	    oMarker1.setPoint(cinema); //마커 표시할 좌표 선택
	    oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
	</script>
</body>
</html>