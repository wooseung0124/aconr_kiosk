<%@page import="kiosk.order.dto.OrderDto"%>
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
// 여기는 사장님이 장사 오픈 전에 로그인 여부를 확인하여 DB에서 어떤 사장님의 메뉴를 가져올 지 판단하는 구간
// 만약 로그인이 안된 상태로 접근할 경우 예외처리 페이지를 보여줘야 한다.
String stoNum = (String) session.getAttribute("stoNum");
String categoryName = request.getParameter("categoryName");

// (작업중)

//=====================================================================================
// 여기는 사장님이 로그인 후 장사를 시작했다고 가정하여 고객님들이 키오스크를 눌렀을 때 메뉴를 가져오기 위한 첫번째 작업

MenuDao menuDao = MenuDao.getInstance();
List<CategoryDto> categoryList = MenuDao.getInstance().getCategory(stoNum);

//카테고리가 없을 시 -> empty view 생성
boolean isEmpty = categoryList.isEmpty();
pageContext.setAttribute("isEmpty", isEmpty);

// =====================================================================================	
// 두번째 작업으로 고객이 처음 마주할 때 첫화면을 랜덤으로 카테고리 하나 선택 후 'category' 변수에 담아서 메뉴 리스트를 뽑는다.
String randomCategory = "";
Random random = new Random();
List<String> row = new ArrayList<>();
List<String> sto = new ArrayList<>();
List<MenuDto> menuList = new ArrayList<>();
CategoryDto dto = new CategoryDto();

if (!isEmpty && categoryName == null) {
	for (CategoryDto tmp : categoryList) {
		row.add(tmp.getCategory());
		sto.add(tmp.getStoNum());
	}

	int rowNum = random.nextInt(row.size());

	randomCategory = row.get(rowNum);

	dto.setStoNum(stoNum);
	dto.setCategory(randomCategory);
	menuList = MenuDao.getInstance().getList(dto);

	request.setAttribute("menuList", menuList);
	request.setAttribute("category", categoryList);
} else if (categoryName != null) {
	//카테고리이름에 해당하는 것만 가져오게하면됨 
	for (CategoryDto tmp : categoryList) {
		if (tmp.getCategory().equals(categoryName)) {
			row.add(tmp.getCategory());
			sto.add(tmp.getStoNum());
			break;
		}
	}
	randomCategory = row.get(0);
	dto.setStoNum(stoNum);
	dto.setCategory(row.get(0));
	menuList = MenuDao.getInstance().getList(dto);
	request.setAttribute("menuList", menuList);
	request.setAttribute("category", categoryList);
}

pageContext.setAttribute("randomCategory", randomCategory);

//=====================================================================================	
// 세번째 작업으로 고객이 원하는 메뉴를 눌러 장바구니를 눌렀을 경우 장바구니 리스트 최신화 및 화면에 정보를 담는다.
List<OrderDto> shoplist = (List<OrderDto>)session.getAttribute("shoplist");
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
			<c:choose>
				<c:when test="${isEmpty}">
					<h1>메뉴 준비중</h1>
				</c:when>
				<c:otherwise>
					<h1>${randomCategory}</h1>
				</c:otherwise>
			</c:choose>
		</div>

		<div id="main" style="display: flex; flex-wrap: wrap;">
			<!-- 첫화면 접속시 작동할 코드 -->
			<c:choose>
				<c:when test="${empty menuList}">
					<img src="${pageContext.request.contextPath}/images/empty.jpg" alt="" />
				</c:when>
				<c:otherwise>
					<c:forEach var="tmp" items="${menuList}">
						<article class="thumb"
							style="width: 25%; box-sizing: border-box; padding: 10px; display: inline-block;">
							<c:choose>
								<c:when test="${tmp.imageUrl eq null}">
									<a
										href="${pageContext.request.contextPath}/images/fulls/prepare.jpg"
										class="image"><img
										src="${pageContext.request.contextPath}/images/fulls/prepare.jpg"
										alt="" /></a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/upload/${tmp.imageUrl}"
										class="image"><img
										src="${pageContext.request.contextPath}/upload/${tmp.imageUrl}"
										alt="" /></a>
								</c:otherwise>
							</c:choose>
							<h2 id="name">${tmp.name}</h2>
							<h3>${tmp.description}</h3>
							<h3>${tmp.price}원</h3>
							<button onclick="basketBtn('${tmp.name}','${tmp.price}','${tmp.category}')">장바구니 추가</button>

						</article>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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

				<!-- categories -->
				<div>
					<section>
						<h2>CHOOSE CATEGORY</h2>
						<ul class="action">
							<c:forEach var="tmp" items="${requestScope.category}">
								<li><a
									href="${pageContext.request.contextPath}/customer/order_menu.jsp?categoryName=${tmp.category}"
									class="category-list">${tmp.category}</a></li>
							</c:forEach>
						</ul>
					</section>
				</div>
				<!-- categories -->
				
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

							<!-- 이거 자체 테스트입니다. 다 바꿔야 합니다. -->
								<c:forEach var="tmp" items="${shoplist}">
									<tr class="shopping-menu">
										<td class="name">${tmp.name}</td>
										<td>
											<button class="minus">-</button>
											<span class="count">1<!-- (수량 바꾸기) --></span>
											<button class="plus">+</button>
										</td>
										<td class="price">${tmp.price}</td>
										<td class="total">총액 <!-- 계산하는 곳 --></td>
										<td><button class="shopping-delete">X</button></td>
									</tr>
								</c:forEach>
	
							</tbody>
							
							<tfoot>
								<tr>
									<td>총합계</td>
									<td id="shopping-total" colspan='3'>20000원</td>
									<td><button id="order-button">주문하기</button></td>
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
	function basketBtn(name, price, category) {
		
		fetch("${pageContext.request.contextPath}/customer/data.jsp?name="+name+"&price="+price)
		.then(res=>res.json())
		.then(data=>{
			// 웹브라우저 F12에서 콘솔메시지 확인 가능
			let shoplist = data.shoplist
			console.log(shoplist);
			href="${pageContext.request.contextPath}/customer/order_menu.jsp?categoryName="+category
		})
	}; // function basketBtn
	
	/*
	<tbody>
	<!-- 이거 자체 테스트입니다. 다 바꿔야 합니다. -->
		
			<tr class="shopping-menu">
				<td class="name">${tmp.name}</td>
				<td class="count">
					<button class="minus">-</button>
					<span class="count"><!-- (수량 바꾸기) --></span>
					<button class="plus">+</button>
				</td>
				<td class="price">${tmp.price}원</td>
				<td class="total">총액 <!-- 계산하는 곳 --></td>
				<td><button class="shopping-delete">X</button></td>
			</tr>
		
	</tbody>
	
	<tfoot>
		<tr>
			<td>총합계</td>
			<td id="shopping-total" colspan='3'>20000원</td>
			<td><button id="order-button">주문하기</button></td>
		</tr>
	</tfoot>
	========================================= */
	
	// 고객이 특정 메뉴의 장바구니를 눌렀을 경우 시작
	
	
	let listTotal = document.querySelector("#shopping-total");
	let LT = listTotal.innerText; // 이건 총액 값 초기화

		document.querySelectorAll(".shopping-menu").forEach((menu)=>{
			// 메뉴 1개당 정보
			let name = menu.querySelector(".name");
			let count = menu.querySelector(".count");
			let minus = menu.querySelector(".minus");
			let plus = menu.querySelector(".plus");
			let price = menu.querySelector(".price");
			let total = menu.querySelector(".total");
			
			let num = count.innerText; // 맨처음 장바구니 들어왔을 때 1로 초기화
			
			let p = price.innerText; // 맨처음 장바구니 들어왔을 때 1개당 가격 초기화
			price.innerText = p+"원";
			
			let calculation = p; // 각 메뉴별로 수량*가격
			total.innerText = calculation+"원";
			
			LT = calculation;
			listTotal.innerText = LT+"원";
			
			minus.addEventListener("click", ()=>{
				
				if(num > 1){
					num --;
				}
				
				count.innerText = num;
				total.innerText = calculation * num + "원";
				
				
			}); // minus button
			
			plus.addEventListener("click", ()=>{
				num ++;
				
				count.innerText = num;
				total.innerText = calculation * num + "원";
				
				
			}); // plus button
		});
		
	document.querySelector("#order-button").addEventListener("click", ()=>{
		// 
	})
	
	// fetch()
	// order 메뉴를 jsp에 전달 후 그곳에서 request 혹은 session 으로 dto와 list 저장
	// 여기는 그냥 fetch 함수 data 잘 받아왔는지 확인하는 정도로 끝내기
	// 그리고 현재 페이지 reload
		
	</script>
</body>
</html>