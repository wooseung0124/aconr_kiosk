<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dto.CategoryDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String stoNum = (String) session.getAttribute("stoNum");
System.out.println(stoNum);
MenuDao menuDao = MenuDao.getInstance();
List<CategoryDto> categoryList = MenuDao.getInstance().getCategory(stoNum);

try {// 일단 카테고리 등록여부 확인
	if (categoryList.isEmpty()) { // 그 와중에 사장님이 장사할 생각이 없는지 아직 등록하지 않았을 경우
		CategoryDto dto = new CategoryDto();
		dto.setStoNum(stoNum);
		dto.setCategory("장사할 생각이 없음");
		categoryList.add(dto);
	}

} catch (Exception e) {
	System.err.println("category error :" + e);

} finally {
	request.setAttribute("category", categoryList);
}

// =====================================================================================	

categoryList = (List) request.getAttribute("category");

// 첫화면은 랜덤으로 카테고리 하나 선택 후 'category' 변수에 담기
Random random = new Random();
List<String> row = new ArrayList<>();
List<String> sto = new ArrayList<>();
List<MenuDto> menuList = new ArrayList<>();
CategoryDto dto = new CategoryDto();

for (CategoryDto tmp : categoryList) {
	row.add(tmp.getCategory());
	sto.add(tmp.getStoNum());
}

int rowNum = random.nextInt(row.size());
String randomCategory = row.get(rowNum);
System.out.println(randomCategory);

dto.setStoNum(stoNum);
dto.setCategory(randomCategory);

menuList = MenuDao.getInstance().getList(dto);

request.setAttribute("menuList", menuList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/order_menu.jsp</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/order_assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/order_assets/css/noscript.css" />
</noscript>
<style>
td {
	text-align: center;
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="${pageContext.request.contextPath}/index.jsp"><strong>home</strong></a>
			</h1>
			<nav>
				<ul>
					<li><a href="#footer2">장바구니</a></li>
					<li><a href="#footer" class="icon solid fa-info-circle">Category</a></li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div class="category">
			<h1><%=randomCategory%></h1>
		</div>

		<div id="main">

			<!-- 첫화면 접속시 작동할 코드 -->
			<c:forEach var="tmp" items="${menuList}">
				<article class="thumb">
					<!-- 사진링크는 추후에 ${tmp.imageUrl}로 바꿀 예정 -->
					<a
						href="${pageContext.request.contextPath}/images/fulls/americano.jpg"
						class="image"><img
						src="${pageContext.request.contextPath}/images/fulls/americano.jpg"
						alt="" /></a>
					<h2>${tmp.name}</h2>
					<h3>${tmp.description}</h3>
					<h3>${tmp.price}원</h3>
					<button>장바구니 추가</button>
				</article>
			</c:forEach>

			<!-- 고객이 원하는 카테고리 선택시 작동할 코드 -->
			<article class="thumb">
				<!-- 사진링크는 추후에 ${tmp.imageUrl}로 바꿀 예정 -->
				<a
					href="${pageContext.request.contextPath}/images/fulls/an_empty_glass.jpeg"
					class="image"><img
					src="${pageContext.request.contextPath}/images/fulls/an_empty_glass.jpeg"
					alt="" /></a>
				<h2></h2>
				<h3></h3>
				<h3></h3>
				<button>장바구니 추가</button>
			</article>

		</div>

		<!-- Footer -->
		<footer id="footer" class="panel">
			<div class="inner split">
				<div>
					<section>
						<h2>향기로운 휴식, 당신을 위한 카페 Acorn Cafe</h2>
						<p>당신의 일상에 여유를 선사하는 카페 오아시스를 소개합니다. 저희 카페에서는 정성스레 내린 커피, 신선한
							빵, 그리고 달콤한 디저트를 즐기실 수 있습니다. 각 계절마다 변화하는 메뉴를 통해 자연의 맛을 전달하고자 하며,
							건강을 생각한 메뉴 선택도 다양하게 준비되어 있습니다. 아늑한 분위기에서 편안한 대화를 나누거나, 조용히 책을 읽으며
							시간을 보내실 수 있습니다. 카페 오아시스는 단순히 음료를 마시는 곳이 아니라, 삶에 휴식을 주는 공간입니다.
							여기에서 소중한 순간을 만끽하세요.</p>
					</section>
					<section>
						<h2>Follow me on ...</h2>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span
									class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span
									class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span
									class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span
									class="label">GitHub</span></a></li>
							<li><a href="#" class="icon brands fa-dribbble"><span
									class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon brands fa-linkedin-in"><span
									class="label">LinkedIn</span></a></li>
						</ul>
					</section>
					<p class="copyright">&copy; Acorn Order. Design: Team1.</p>
				</div>

				<div>
					<section>
						<h2>CHOOSE CATEGORY</h2>
						<ul class="action">
							<c:forEach var="tmp" items="${requestScope.category}">
								<li @click="getList">${tmp.category}</li>
							</c:forEach>
						</ul>
					</section>
				</div>

			</div>
		</footer>

		<footer id="footer2" class="panel">
			<div class="inner split">
				<div>
					<section>
						<h2>장바구니 목록</h2>
						<table>
							<thead>
								<td>메뉴 이름</td>
								<td>수량</td>
								<td>상품 금액</td>
								<td>주문 금액</td>
								<td>삭제</td>
							</thead>
							<tbody>
								<tr>
									<td>아메리카노</td>
									<td>2개</td>
									<td>2000원</td>
									<td>4000원</td>
									<td><button>X</button></td>
								</tr>
								<tr>
									<td>아메리카노</td>
									<td>2개</td>
									<td>2000원</td>
									<td>4000원</td>
									<td><button>X</button></td>
								</tr>
								<tr>
									<td>아메리카노</td>
									<td>2개</td>
									<td>2000원</td>
									<td>4000원</td>
									<td><button>X</button></td>
								</tr>
								<tr>
									<td>아메리카노</td>
									<td>2개</td>
									<td>2000원</td>
									<td>4000원</td>
									<td><button>X</button></td>
								</tr>
								<tr>
									<td>아메리카노</td>
									<td>2개</td>
									<td>2000원</td>
									<td>4000원</td>
									<td><button>X</button></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td>총합계</td>
									<td colspan='3'>20000원</td>
									<td><button>주문하기</button></td>
								</tr>
							</tfoot>
						</table>

					</section>
				</div>
				<div>
					<section>
						<h2>향기로운 휴식, 당신을 위한 카페 Acorn Cafe</h2>
						<p>당신의 일상에 여유를 선사하는 카페 오아시스를 소개합니다. 저희 카페에서는 정성스레 내린 커피, 신선한
							빵, 그리고 달콤한 디저트를 즐기실 수 있습니다. 각 계절마다 변화하는 메뉴를 통해 자연의 맛을 전달하고자 하며,
							건강을 생각한 메뉴 선택도 다양하게 준비되어 있습니다. 아늑한 분위기에서 편안한 대화를 나누거나, 조용히 책을 읽으며
							시간을 보내실 수 있습니다. 카페 오아시스는 단순히 음료를 마시는 곳이 아니라, 삶에 휴식을 주는 공간입니다.
							여기에서 소중한 순간을 만끽하세요.</p>
					</section>
					<section>
						<h2>Follow me on ...</h2>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span
									class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span
									class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span
									class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span
									class="label">GitHub</span></a></li>
							<li><a href="#" class="icon brands fa-dribbble"><span
									class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon brands fa-linkedin-in"><span
									class="label">LinkedIn</span></a></li>
						</ul>
					</section>
					<p class="copyright">&copy; Acorn Order. Design: Team1.</p>
				</div>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/order_assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/order_assets/js/jquery.poptrox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/order_assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/order_assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/order_assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/order_assets/js/main.js"></script>
	
	<script> 
	// 여기는 사용자가 카테고리를 선택했을 때 즉각즉각 데이터를 웹브라우저에서 요청하고 응답하도록 구현
	
	new Vue({
		el:"#wrapper",
		data:{
			menuList:[],
			fristMake:true,
			secondMake:false
		},
		methods:{
			getList(e){
				this.fristMake=false;
				this.secondMake=true;
				//서버에 글 목록을 fetch() 함수를 이용해서 요청 
                fetch("${pageContext.request.contextPath}/customer/menu_list.jsp",{ // 서버에 요청하는 방식 : 링크, form전송 + 자바스크립트로 요청법(fetch)
                        // fetch의 옵션설정
                        method:"get", // 메소드 전송방식
                        headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"}, // 요청헤더
                        body:`category=e.target.innerText` // 요청몸통
                    })
                .then(res=>res.json())
                .then(data=>{
                    //data 는 글 정보가 들어 있는  [{},{},{},...] 이런형식의 배열이다. 
                	this.menuList=data.menuList;
                });
            }
		}
	});
	</script>

</body>
</html>