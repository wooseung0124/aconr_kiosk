<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/customer/order_menu.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/order_assets/css/main.css" />
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/order_assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="${pageContext.request.contextPath}/index.jsp"><strong>home</strong></a></h1>
						<nav>
							<ul>
								<li><a href="#footer" class="icon solid fa-info-circle">Category</a></li>
							</ul>
						</nav>
					</header>

				<!-- Main -->
					<div class="category">
					<h1>커피</h1>
					</div>
					<div id="main">
					<!-- 이부분을 jstl의 반복을 사용해서 db에서 불러오면 됨 지금은 단순한 hard coding -->
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/americano.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/americano.jpg" alt="" /></a>
							<h2>아메리카노</h2>
							<h3>깊고 진한 향의 여유를 한 모금에 담다</h3>
							<h3>2000원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" alt="" /></a>
							<h2>카페 라떼</h2>
							<h3>부드러운 우유 거품이 입안 가득 퍼지는 고소한 행복</h3>
							<h3>2500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/apogato.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/apogato.jpg" alt="" /></a>
							<h2>아포가토</h2>
							<h3>바닐라 아이스크림 위에 부어진 진한 에스프레소의 완벽한 조화</h3>
							<h3>4500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/americano.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/americano.jpg" alt="" /></a>
							<h2>아메리카노</h2>
							<h3>깊고 진한 향의 여유를 한 모금에 담다</h3>
							<h3>2000원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" alt="" /></a>
							<h2>카페 라떼</h2>
							<h3>부드러운 우유 거품이 입안 가득 퍼지는 고소한 행복</h3>
							<h3>2500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/apogato.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/apogato.jpg" alt="" /></a>
							<h2>아포가토</h2>
							<h3>바닐라 아이스크림 위에 부어진 진한 에스프레소의 완벽한 조화</h3>
							<h3>4500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/americano.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/americano.jpg" alt="" /></a>
							<h2>아메리카노</h2>
							<h3>깊고 진한 향의 여유를 한 모금에 담다</h3>
							<h3>2000원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" alt="" /></a>
							<h2>카페 라떼</h2>
							<h3>부드러운 우유 거품이 입안 가득 퍼지는 고소한 행복</h3>
							<h3>2500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/apogato.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/apogato.jpg" alt="" /></a>
							<h2>아포가토</h2>
							<h3>바닐라 아이스크림 위에 부어진 진한 에스프레소의 완벽한 조화</h3>
							<h3>4500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/americano.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/americano.jpg" alt="" /></a>
							<h2>아메리카노</h2>
							<h3>깊고 진한 향의 여유를 한 모금에 담다</h3>
							<h3>2000원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" alt="" /></a>
							<h2>카페 라떼</h2>
							<h3>부드러운 우유 거품이 입안 가득 퍼지는 고소한 행복</h3>
							<h3>2500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/apogato.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/apogato.jpg" alt="" /></a>
							<h2>아포가토</h2>
							<h3>바닐라 아이스크림 위에 부어진 진한 에스프레소의 완벽한 조화</h3>
							<h3>4500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/americano.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/americano.jpg" alt="" /></a>
							<h2>아메리카노</h2>
							<h3>깊고 진한 향의 여유를 한 모금에 담다</h3>
							<h3>2000원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/cafe_latte.jpg" alt="" /></a>
							<h2>카페 라떼</h2>
							<h3>부드러운 우유 거품이 입안 가득 퍼지는 고소한 행복</h3>
							<h3>2500원</h3>
						</article>
						<article class="thumb">
							<a href="${pageContext.request.contextPath}/images/fulls/apogato.jpg" class="image"><img src="${pageContext.request.contextPath}/images/fulls/apogato.jpg" alt="" /></a>
							<h2>아포가토</h2>
							<h3>바닐라 아이스크림 위에 부어진 진한 에스프레소의 완벽한 조화</h3>
							<h3>4500원</h3>
						</article>
					</div>
				<!-- Footer -->
					<footer id="footer" class="panel">
						<div class="inner split">
							<div>
								<section>
									<h2>향기로운 휴식, 당신을 위한 카페 Acorn Cafe</h2>
									<p>당신의 일상에 여유를 선사하는 카페 오아시스를 소개합니다. 저희 카페에서는 정성스레 내린 커피, 신선한 빵, 그리고 달콤한 디저트를 즐기실 수 있습니다. 각 계절마다 변화하는 메뉴를 통해 자연의 맛을 전달하고자 하며, 건강을 생각한 메뉴 선택도 다양하게 준비되어 있습니다.

아늑한 분위기에서 편안한 대화를 나누거나, 조용히 책을 읽으며 시간을 보내실 수 있습니다. 카페 오아시스는 단순히 음료를 마시는 곳이 아니라, 삶에 휴식을 주는 공간입니다. 여기에서 소중한 순간을 만끽하세요.</p>
								</section>
								<section>
									<h2>Follow me on ...</h2>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
										<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
										<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
									</ul>
								</section>
								<p class="copyright">
									&copy; Acorn Order. Design: Team1.
								</p>
							</div>
							<div>
								<section>
									<h2>CHOOSE CATEGORY</h2>
									<ul class="action">
										<li>커피</li>
										<li>빵</li>
										<li>디저트</li>
										<li>등등 디비에 저장되어있는 카테고리의 갯수를 가져옴</li>
										<li>각 list를 클릭하게 되면 페이지를 열때 get방식을 통해(category정보를 전달) 설정해놓은 servlet에서 해당 카테고리의 정보만 가진 list를 저장한후 다시 현재 페이지로 이동</li>
										<li>그렇게 되면 현재 페이지에서는 저장된 리스트에 있는 데이터만 화면 에 뿌려주기에 원하는 카테고리의 결과만 얻을 수 있다.</li>
										<li>그렇다면 모든것을 보려면 어떻게 해야할까? 예를 들어 처음 화면에 들어오게되면 servlet을 통해 들어오지않고 index.jsp에서 들어오기에 아무것도 get을 통해 전달되는 게 없다.</li>
										<li>그러면 servlet에서 parameter의 값이 null이 될테이니 null이면 전체의 메뉴를 list에 넣어주는 로직을 짜서 저장해주면 된다.</li>
									</ul>
								</section>
							</div>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/order_assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/order_assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/order_assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/order_assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/order_assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/order_assets/js/main.js"></script>

	</body>
</html>