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

// String stoNum = (String) session.getAttribute("stoNum");
String stoNum = "000-00-00000"; // 테스트 코드
System.out.println(stoNum);


// ** (작업중) **


//=====================================================================================
// 여기는 손님이 원하는 메뉴 카테고리를 눌렀는지 여부를 확인하는 구간(if문)
String clickCategory = (String)request.getParameter("clickCategory");
System.out.println("clickCategory : "+clickCategory);

CategoryDto dto = new CategoryDto(); // 초기화 작업 : 사업자번호와 카테고리 동시관리
List<CategoryDto> categoryList = null; // 초기화 작업 : 카테고리 list 관리
Random random = new Random(); // 초기화 작업 : 랜덤번호 관리
List<String> row = new ArrayList<>(); // 초기화 작업 : 카테고리 list를 랜덤으로 관리
List<String> sto = new ArrayList<>(); // 초기화 작업 : 정확도를 위해 db에서 가져온 사업자번호 관리
String randomCategory = null; // 초기화 작업 : 랜덤으로 선택된 최종 타이틀 카테고리를 관리
List<MenuDto> menuList = new ArrayList<>(); // 초기화 작업 : 최종 타이틀 카테고리의 메뉴들 관리

MenuDao menuDao = MenuDao.getInstance();
categoryList = MenuDao.getInstance().getCategory(stoNum);
System.out.println("등록한 카테고리들 : "+categoryList.size()+"개");

if(clickCategory==null){ // 만약 클릭해둔 카테고리가 없다면
	
	//=====================================================================================
	// 여기는 사장님이 로그인 후 장사를 시작했다고 가정하여 고객님들이 키오스크를 눌렀을 때 메뉴를 가져오기 위한 첫번째 작업

	try {// 일단 카테고리 등록여부 확인
		if (categoryList.isEmpty()) { // 그 와중에 사장님이 장사할 생각이 없는지 아직 등록하지 않았을 경우
			System.out.println("장사할 생각이 없네");
			dto.setStoNum(stoNum);
			dto.setCategory("장사할 생각이 없음");
			categoryList.add(dto);
		}

	} catch (Exception e) {
		System.err.println("category error :" + e);

	} finally {
		request.setAttribute("category", categoryList); // List<CategoryDto> type
	}

	// =====================================================================================	
	// 두번째 작업으로 고객이 처음 마주할 때 첫화면을 랜덤으로 카테고리 하나 선택 후 'category' 변수에 담아서 메뉴 리스트를 뽑는다.

	categoryList = (List) request.getAttribute("category");  // List<CategoryDto> type

	for (CategoryDto tmp : categoryList) {
		row.add(tmp.getCategory());
		sto.add(tmp.getStoNum());
		System.out.println("카테고리 값 :"+row);
	}

	int rowNum = random.nextInt(row.size());
	System.out.println(rowNum+"번째 row 배열 정보를 가져온다.");

	randomCategory = row.get(rowNum);

	if(row.get(0).equals("장사할 생각이 없음")){ // 장사할 생각이 없는 경우
		
		MenuDto dtoNull=new MenuDto();
		dtoNull.setStoNum(stoNum);
		dtoNull.setName("장사접음");
		dtoNull.setPrice(0);
		dtoNull.setDescription("없어 돌아가");
		dtoNull.setSell("NO");
		
		menuList.add(dtoNull);
	}else{
		
		System.out.println(randomCategory);
		dto.setStoNum(stoNum);
		dto.setCategory(randomCategory);

		menuList = MenuDao.getInstance().getList(dto); // List<MenuDto> type
		System.out.println("메뉴 개수 :"+menuList.size()+"개");
	}

	request.setAttribute("titleCategory", randomCategory); // String type
	request.setAttribute("menuList", menuList); // List<MenuDto> type
	
}else{ // 원하는 카테고리를 눌렀을 경우
	
	System.out.println("선택한 카테고리 : "+clickCategory);

	request.setAttribute("category", clickCategory); // List<CategoryDto> type
	
	dto.setStoNum(stoNum);
	dto.setCategory(clickCategory);
	
	menuList = MenuDao.getInstance().getList(dto); // List<MenuDto> type
	System.out.println("메뉴 개수 :"+menuList.size()+"개");
	
	request.setAttribute("titleCategory", clickCategory); // String type
	request.setAttribute("menuList", menuList); // List<MenuDto> type
}
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
			<h1>${titleCategory}</h1>
		</div>

		<div id="main">

			<!-- 첫화면 접속시 작동할 코드, c:forEach 이건 웹브라우저 로딩 이후 사라짐-->
			<c:forEach var="tmp" items="${menuList}">
			
			<article class="thumb">
				<c:choose>
					<c:when test="${tmp.imageUrl eq null}">
						<a href="${pageContext.request.contextPath}/images/prepare.jpg" class="image"><img src="${pageContext.request.contextPath}/images/prepare.jpg" alt="" /></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/upload/${tmp.imageUrl}" class="image"><img src="${pageContext.request.contextPath}/upload/${tmp.imageUrl}" alt="" /></a>		
					</c:otherwise>
				</c:choose>
				<h2>${tmp.name}</h2>
				<h3>${tmp.description}</h3>
				<h3>${tmp.price}원</h3>
				<button>장바구니 추가</button>
			</article>
			
			</c:forEach>
			<!-- 첫화면 접속시 작동할 코드, c:forEach 이건 웹브라우저 로딩 이후 사라짐-->
			
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
								<li>
									<a href="javascript:" class="category-list" >${tmp.category}</a>
								</li>
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

/* ===========================
카테고리별로 반복문 돌려서 데이터 주입
	
<article class="thumb">
	<a href="${pageContext.request.contextPath}/images/prepare.jpg" class="image"><img src="${pageContext.request.contextPath}/images/prepare.jpg" alt="" /></a>
	<h2>${tmp.name}</h2>
	<h3>${tmp.description}</h3>
	<h3>${tmp.price}원</h3>
	<button>장바구니 추가</button>
</article>

============================== */

	// 여기는 사용자가 카테고리를 선택했을 때 fetch를 이용하여 정보를 getParameter로 전달 후 웹페이지 새로 언로드
	document.querySelectorAll(".category-list").forEach(item=>{
		item.addEventListener("click",(e) => {
			//이벤트가 발생한 폼의 참조값은 e.target 이다
			
			let clickCategory =e.target.innerText;
			console.log(clickCategory+" 카테고리 버튼을 누름");
			
			//fetch() 함수를 이용해서 get 방식으로 입력한 닉네임을 보내고 사용가능 여부를 json으로 응답받는다.
			fetch("${pageContext.request.contextPath}/customer/menu_list.jsp?clickCategory="+clickCategory)// get방식 파라미터를 쿼리 문자열로 전달
			.then(res=>res.json())
			.then(data=>{
				//data 는 글 정보가 들어 있는  [{},{},{},...] 이런형식의 배열이다. 
				console.log(data.clickCategory+" json 문자열로 카테고리 받아오기 성공");
				
				location.href='${pageContext.request.contextPath}/customer/order_menu.jsp?clickCategory='+data.clickCategory;
			})
		});
	}); // category-list
	
/* ===========================
위에 자바스크립트가 동작되기 전 웹브라우저 코드모습 

<div>
	<section>
		<h2>CHOOSE CATEGORY</h2>
		<ul class="action">
			<li>
				<a href="javascript:" class="category-list" >(기존에 있던 문자열 정보)</a>
			</li>
			
			...
			
			(기존에 만들어둔 코드 개수만큼 존재함)
			
			...
			
			li>
			<a href="javascript:" class="category-list" >(기존에 있던 문자열 정보)</a>
		</li>
		</ul>
	</section>
</div>
	
============================== */

	// 여기는 현재 페이지에서 새로 언로드 되었을 때 getParameter 정보 확인 후 null이 아닌 경우 위에 코드에 적용시키기
	document.querySelectorAll(".category-list").forEach(item=>{
		item.addEventListener("click",(e) => {
			//이벤트가 발생한 폼의 참조값은 e.target 이다
			
			let clickCategory =e.target.innerText;
			console.log(clickCategory+" 카테고리 버튼을 누름");
			
			//fetch() 함수를 이용해서 get 방식으로 입력한 닉네임을 보내고 사용가능 여부를 json으로 응답받는다.
			fetch("${pageContext.request.contextPath}/customer/menu_list.jsp?clickCategory="+clickCategory)// get방식 파라미터를 쿼리 문자열로 전달
			.then(res=>res.json())
			.then(data=>{
				//data 는 글 정보가 들어 있는  [{},{},{},...] 이런형식의 배열이다. 
				console.log(data.clickCategory+" json 문자열로 카테고리 받아오기 성공");
				
				location.href='${pageContext.request.contextPath}/customer/order_menu.jsp?clickCategory='+data.clickCategory;
			})
		});
	}); // category-list
	
</script>

</body>
</html>