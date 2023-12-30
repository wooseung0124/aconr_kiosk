<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원호출목록</title>
<style>
    .container {
        text-align: center;
    }

    .callmenu {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around; /* 요소들을 주변에 배치 */
    }

    .item {
        border: 1px solid #000; /* 테두리 스타일 지정 */
        padding: 10px; /* 각 아이템의 안쪽 여백 지정 */
        margin: 5px; /* 아이템 간의 간격 지정 */
        text-align: center; /* 가운데 정렬 */
        flex-basis: calc(25% - 20px); /* 네모 상자 4개로 나누어지도록 설정 */
    }

    .item a {
        text-decoration: none; /* 링크의 밑줄 제거 */
        color: #000; /* 링크의 색상 지정 */
    }
</style>
</head>
<body>
    <div class="container">
        <h3>직원 호출 메뉴 </h3>
        <div class="callmenu">
            <div class="item"><a href="#">냅킨</a></div>    
            <div class="item"><a href="#">물티슈</a></div>    
            <div class="item"><a href="#">물리필</a></div>    
            <div class="item"><a href="#">얼음</a></div>    
            <div class="item"><a href="#">기본안주리필</a></div>    
            <div class="item"><a href="#">젖가락</a></div>
            <div class="item"><a href="#">앞접시</a></div>
            <div class="item"><a href="#">국그릇</a></div>
            <div class="item"><a href="#">유아식기</a></div>
            <div class="item"><a href="#">담요</a></div>
            <div class="item"><a href="#">포장</a></div>        
            <div class="item"><a href="#">결제</a></div>    
        </div>
    </div>
</body>
</html>
