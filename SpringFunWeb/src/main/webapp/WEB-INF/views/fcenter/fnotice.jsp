<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
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
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="${pageContext.request.contextPath}/board/list">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="${pageContext.request.contextPath}/board/flist">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<article>
<h1>Driver Download</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    
 <c:forEach var="dto" items="${boardList}">
  	<tr onclick="location.href='${pageContext.request.contextPath }/board/fcontent?num=${dto.num}'">
 	<td>${dto.num}</td>
    <td class="left">
    <%-- <c:if test="${dto.re_lev > 0 }">
    	<c:set var="wid" value="${dto.re_lev * 10 }"></c:set>
    	<img src="${pageContext.request.contextPath }/resources/images/center/level.gif" width="${wid }" height="15"> 
     	<img src="${pageContext.request.contextPath }/resources/images/center/re.gif">
    </c:if> --%>
    ${dto.subject}</td>
    <td>${dto.name}</td>
    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/></td>
    <td>${dto.readcount}</td></tr>  
 </c:forEach>   
    
  <%
//   for(int i=0;i<boardList.size();i++){
// 	  BoardDTO dto=boardList.get(i);
	  %>
<%-- <tr onclick="location.href='BoardContent.bo?num=<%=dto.getNum()%>'"><td><%=dto.getNum() %></td> --%>
<!--     <td class="left"> -->
    <%
    //답글 찾아서 들여쓰기 이미지, 답글 이미지
//     if(dto.getRe_lev() > 0){
//     	int wid=dto.getRe_lev()*10;
    	%>
<%--     	<img src="images/center/level.gif" width="<%=wid%>" height="15"> --%>
<!--     	<img src="images/center/re.gif"> -->
    	<%
//     }
    %>
<%--     <%=dto.getSubject() %></td> --%>
<%--     <td><%=dto.getName() %></td> --%>
<%--     <td><%=dateFormat.format(dto.getDate()) %></td> --%>
<%--     <td><%=dto.getReadcount() %></td></tr>	   --%>
	  <%
//   }
  %>   
</table>

<div id="table_search">

	<c:if test="${! empty sessionScope.id }">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='${pageContext.request.contextPath }/board/fwrite'">
	</c:if>

</div>

<div id="table_search">
<form action="${pageContext.request.contextPath }/board/list" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>
<div class="clear"></div>
<div id="page_control">
<%

// if(search==null){
	//검색어 없음
	
	//10페이지 이전
//	if(startPage > pageBlock){
		%>
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
		<a href="${pageContext.request.contextPath}/board/flist?pageNum=${pageDTO.startPage-pageDTO.pageBlock}&search=${pageDTO.search}">Prev</a>
	</c:if>
		<%
//	}

//	for(int i=startPage;i<=endPage;i++){
		%>
	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<a href="${pageContext.request.contextPath}/board/flist?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
	</c:forEach> 
		<%
//	}

	//10페이지 다음
//	if(endPage < pageCount){
		%>
	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
		<a href="${pageContext.request.contextPath}/board/flist?pageNum=${pageDTO.startPage+pageDTO.pageBlock}&search=${pageDTO.search}">Next</a>
	</c:if>
		<%
//	}
	
// }else{
	//검색어 있음
	//10페이지 이전
//	if(startPage > pageBlock){
		%>
	<%-- <a href="${pageContext.request.contextPath }/board/list?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">Prev</a> --%>
		<%
//	}

//	for(int i=startPage;i<=endPage;i++){
		%>
		<%-- <a href="${pageContext.request.contextPath }/board/list?pageNum=<%=i%>&search=<%=search%>"><%=i %></a>  --%>
		<%
//	}

	//10페이지 다음
//	if(endPage < pageCount){
		%>
	<%-- <a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">Next</a> --%>
		<%
//	}
//} 

%>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>