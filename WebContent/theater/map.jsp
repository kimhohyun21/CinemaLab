<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="theater/style.css">
</head>
<body>
	<table width="1000" id="map_table">
		<tr>
			<td id="title">
				<h3>${theater } �Ե��ó׸� ��ġ����</h3>
			</td>
		</tr>
		<tr>
			<td id="map" style="border: 1px solid #000; margin-top: 10px; margin-bottom: 10px;"></td>
		</tr>
		<tr>
			<td id="addr">
				<c:if test="${theater=='�ŵ���' }">
					�ּ� : ����Ư���� ���α� ���η� 662 (�ŵ�����, ��ť���Ƽ 7��)
				</c:if>
				<c:if test="${theater=='������' }">
					�ּ� : ����Ư���� �������� ���η�102�� 13 (��������, �ó׸��� 7��)
				</c:if>
				<c:if test="${theater=='ȫ���Ա�' }">
					�ּ� : ����Ư���� ������ ��ȭ�� 176 (������, ��������ũ 8��)
				</c:if>
				<c:if test="${theater=='����' }">
					�ּ� : ��⵵ ���ν� ó�α� �ݷɷ� 86 (�跮�嵿)
				</c:if>
				<c:if test="${theater=='����' }">
					�ּ� : ��⵵ ������ �Ǽ��� ��ȭ�� 134 (���е�, �Ե��� 5��)
				</c:if>
				<c:if test="${theater=='�Ȼ�' }">
					�ּ� : ��⵵ �Ȼ�� ��ϱ� ����� 427 (������, �Ե���Ʈ �Ȼ��� 4��)
				</c:if>
				<c:if test="${theater=='�˴�' }">
					�ּ� : ��õ������ ���� ������ 163 (�ձ浿)
				</c:if> 
				<c:if test="${theater=='����' }">
					�ּ� : ��õ������ ���� ������ 66 (����, �ٿ�Ÿ���Ϸ��� 6��~10��)
				</c:if> 
				<c:if test="${theater=='��õ' }">
					�ּ� : ��õ������ ������ ������ 148 (������, �Ե���ȭ�� 7��)
				</c:if> 
				<c:if test="${theater=='����' }">
					�ּ� : �뱸������ ���� �Ƚɷ� 80 (���ϵ�)
				</c:if> 
				<c:if test="${theater=='����' }">
					�ּ� : �뱸������ �޼��� ����� 247 (���ε�, ���ݷδ� 6��)
				</c:if> 
				<c:if test="${theater=='����' }">
					�ּ� : �뱸������ �޼��� ������ 414 (�̰)
				</c:if> 
				<c:if test="${theater=='�ؿ��' }">
					�ּ� : �λ걤���� �ؿ�뱸 �ؿ��� 802 (�µ�, ���Žó׾�Ʈ 7��)
				</c:if>
				<c:if test="${theater=='����' }">
					�ּ� : �λ걤���� �λ����� ��õ�� 92 (������, NC��ȭ�� 6��)
				</c:if>
				<c:if test="${theater=='�λ�' }">
					�ּ� : �λ걤���� �λ����� ���ߴ�� 772 (������, �Ե���ȭ�� 10��)
				</c:if> 
			</td>
		</tr>
	</table>
	<div ></div>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=B89LGmTHAKKmgnTgbizc"></script>
	<script type="text/javascript">
	var cinema;
	if(${theater=='�ŵ���'}){
		cinema=new nhn.api.map.LatLng(37.5081508,126.88806390000002);
	}
	if(${theater=='������'}){
		cinema=new nhn.api.map.LatLng(37.515887, 126.907472);
	}
	if(${theater=='ȫ���Ա�'}){
		cinema=new nhn.api.map.LatLng(37.557237, 126.924949);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(37.235082, 127.205942);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(37.264242, 126.997365);
	}
	if(${theater=='�Ȼ�'}){
		cinema=new nhn.api.map.LatLng(37.317965, 126.846104);
	}
	if(${theater=='�˴�'}){
		cinema=new nhn.api.map.LatLng(37.601659, 126.658063);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(37.493481, 126.726511);
	}
	if(${theater=='��õ'}){
		cinema=new nhn.api.map.LatLng(37.447034, 126.701232);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(35.867837, 128.694069);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(35.816619, 128.539320);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(35.854459, 128.507832);
	}
	if(${theater=='�ؿ��'}){
		cinema=new nhn.api.map.LatLng(35.169167, 129.176596);
	}
	if(${theater=='����'}){
		cinema=new nhn.api.map.LatLng(35.157090, 129.063113);
	}
	if(${theater=='�λ�'}){
		cinema=new nhn.api.map.LatLng(35.156689, 129.056118);
	}
	
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