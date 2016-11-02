<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>����</title>
</head>
<body>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=B89LGmTHAKKmgnTgbizc"></script>
	<div id="map" style="border: 1px solid #000;"></div>
	<script type="text/javascript">
		var cinema;
		if(${theater=='�ŵ���'}){
			cinema=new nhn.api.map.LatLng(37.5081508,126.88806390000002);
		}
		if(${theater=='������'}){
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
	        // ��Ŀ Ŭ���ϸ�
	        if (oTarget instanceof nhn.api.map.Marker) {
	            // ��ħ ��Ŀ Ŭ���ѰŸ�
	            if (oCustomEvent.clickCoveredMarker) {
	                return;
	            }
	            // - InfoWindow�� �� ������ setContent�� �����Ӱ� ���� �� �ֽ��ϴ�. �ܺ� css�� �̿��� �� ������,
	            // - �ܺ� css�� ����� class�� �̿��ϸ� �ش� class�� ��Ÿ���� �ٷ� ������ �� �ֽ��ϴ�.
	            // - ��, DIV�� position style�� absolute�� �Ǹ� �ȵǸ�,
	            // - absolute�� ��� autoPosition�� �������� �ʽ��ϴ�.
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
	    var oMarker1 = new nhn.api.map.Marker(oIcon, { title : '' });  //��Ŀ ���� 
	    oMarker1.setPoint(cinema); //��Ŀ ǥ���� ��ǥ ����
	    oMap.addOverlay(oMarker1); //��Ŀ�� �������� ǥ�� 
	</script>
</body>
</html>