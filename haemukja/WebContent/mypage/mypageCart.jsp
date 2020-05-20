<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,mypage.model.vo.*,java.util.ArrayList"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	ArrayList<MCart> list = (ArrayList<MCart>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>장바구니</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/sellerAndStatic.css" rel="stylesheet">
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
  <style>
    table {
      text-align: center;
    }
    
    .paging {
       font-size: 20px;
       background-color: orange;
     }
  </style>
</head>

<body>

  <!-- Navigation -->
	<%@ include file="../static/top.jsp"%>


  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="list-group">
          <h4><a href="mypageUpdate.jsp">개인정보 수정</a></h4>
          <h4><a href="<%=request.getContextPath()%>/order.my">주문/배송</a></h4>
          <h4><a href="<%=request.getContextPath()%>/refund.my">교환/환불</a></h4>
          <h4><a href="<%=request.getContextPath()%>/cart.my">장바구니</a></h4>
          <h4><a href="<%=request.getContextPath()%>/mypage/mypagePoint.jsp">포인트 내역</a></h4>
        </div>

      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;마이페이지</div>
        </div>
        <!-- /panel -->
        <br>
        <div class="container">
          <div class="row">
            <h3>장바구니</h3>
            <hr>
            <form class="table" id="productRegisterForm" action="<%=request.getContextPath()%>/member.me" method="post">
              <table class="table">
                <thead>
                  <tr align="center">
                    <th>
                      <input type="checkbox" name="checkbox" class="check" id="checkAll">
                    </th>
                    <th style="width: 150px"><span></span></th>
                    <th style="width: 500px;"><span>상품명</span></th>
                    <th>수량</th>
                    <th style="width: 100px">선택</th>
                  </tr>
                </thead>
               
                <tbody>
             
                <%for(int i =0; i<list.size(); i++){ %>
                <input type="hidden" name="price" value="<%=list.get(i).getPprice() %>">
                 <input type="hidden" name="product" value=" <%=list.get(i).getPtitle() %>" >
                  <tr style="height: 90px;">
                    <td style="text-align: left; text-align: center; border-right: none;">
                      <input type="checkbox" name="checkbox" class="check"/>
                    </td>
                    <td style="border-left: none; border-right: none;"><img style="width: 80%;" src="images/mango.jpg">
                    </td>
                   <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
                    	<%=list.get(i).getPtitle() %>
                   </td>
                    <td style="width: 80px;">
                      <input type="number" name="pcount" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="<%=list.get(i).getCamount()%>">
                    </td>
                    <td>
                      <button onclick="location.href='<%=request.getContextPath()%>/member.me?product=<%=list.get(i).getPtitle()%>&pcount=<%=list.get(i).getCamount()%>&price=<%=list.get(i).getPprice()%>'">주문</button>
                      
                    </td>
                  </tr>
                
                   
                  <%} %>
                  
                  
                </tbody>
              
              </table> <!-- table -->
              <div class="row" align="right">
                <div class="col-lg-12"><button type="submit">선택 주문</button>&nbsp;&nbsp;<button type="submit" >전체 주문</button></div>
              </div>
              
              
            </form>
          </div>
        </div>

        <br>
        
      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
          <%=loginMember.getMnickname() %>님<br>반갑습니다!<br><br>
          <a href="mypage_update.html" style="color: white; margin-bottom: 10px;">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
         <!-- 맨 처음으로(<<) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=1'"> << </button>
         
         <!-- 이전 페이지로(<) -->
         <%if(currentPage == 1){ %>
         <button class="paging" disabled> < </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=currentPage - 1 %>'"> < </button>
         <%} %>
         
         <!-- 10개의 페이지 목록 -->
         <%for(int p = startPage ; p<=endPage ; p++){ %>
            <%if(currentPage == p){ %>
               <button class="paging" disabled><%=p %></button>
            <%} else {%>
               <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=p %>'"><%=p %></button>
            <%} %>
         <%} %>
         <!-- 다음 페이지로(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="paging" disabled> > </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=currentPage + 1 %>'"> > </button>
         <%} %>
         
         <!-- 맨 끝으로(>>) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=maxPage%>'"> >> </button>
      </div>
    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
	<%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
  	
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
	$(function(){ //전체선택 체크박스 클릭 
  		$("#checkAll").click(function(){
  		//만약 전체 선택 체크박스가 체크된상태일경우 
  		if($("#checkAll").prop("checked")) {
  		//해당화면에 전체 checkbox들을 체크해준다 
  		$("input[type=checkbox]").prop("checked",true); 
  		// 전체선택 체크박스가 해제된 경우 
  		} else { 
  		//해당화면에 모든 checkbox들의 체크를해제시킨다. 
  		$("input[type=checkbox]").prop("checked",false);
  			} 
  			}) 
  		}) 
  		
  	
  </script>
</body>

</html>