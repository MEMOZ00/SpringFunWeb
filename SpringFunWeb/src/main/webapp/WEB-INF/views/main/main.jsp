<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
//jQuery 준비 => 대상.함수()
//			        반복해서 출력 .each()
//		 				alert(index);
//		 				alert(item.subject);
//		 				alert(item.date);
//		                태그 뒤부분에 추가해서 넣기 append()
	$(document).ready(function(){ // j쿼리 start
		$('.brown').click(function(){
			alert("클릭");
			//초기화
			$('table').html('');
			
			$.ajax({
				url:'${pageContext.request.contextPath }/board/listjson',
				dataType:'json',
				success:function(arr){
					$.each(arr,function(index,item){
						$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
					});
				}
			});

		});
	}); // j쿼리 end
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="${pageContext.request.contextPath }/resources/images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
			<%
// 			BoardDAO dao=new BoardDAO();
// 			List<BoardDTO> boardList=dao.getBoardList(1, 5);
// 			for(int i=0;i<boardList.size();i++){
// 				BoardDTO dto=boardList.get(i);
				%>
<%-- 	<tr><td class="contxt"><a href="#"><%=dto.getSubject() %></a></td>  --%>
<%--     <td><%=dto.getDate() %></td></tr>			 --%>
				<%
// 			}
			%>
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
<!-- <tr><td class="contxt"><a href="#">Vivans....</a></td> -->
<!--     <td>2012.11.02</td></tr> -->
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>