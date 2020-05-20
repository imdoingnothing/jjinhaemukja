<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member"%>
<% Member loginMember = (Member)session.getAttribute("loginMember"); %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>포인트내역</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/sellerAndStatic.css" rel="stylesheet">
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
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
          <div class="full-row">
            <h3>포인트 내역</h3>
            <hr>
            <div style="text-align: center; height: 200px;">
              <h5>현재 보유하신 포인트는</h5>
              <span style="font-size: 80px;"><%=loginMember.getMpoint()%></span>
              <h1>점 입니다.</h1>
            </div>
          </div>
        </div>
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
  </div>
  <!-- /.container -->
  <br><br><br><br>
  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
  	
 
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  
  </script>

</body>

</html>