<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%

   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller");
   
%>
<!-- 내겐 너무 어려운 깃허브 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>해먹자</title>
  
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
  
  <!-- Custom styles for this template -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
  
  <style>
  @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
  </style>
  
</head>
<body>
  <!-- Navigation -->
  <%@ include file="static/top.jsp"%>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <form>
          <div class="input-group">
            <select id="searchOption">
              <option id="id" name="id">ID</option>
              <option id="title" name="title">제목</option>
              <option id="content" name="content">내용</option>
            </select>&nbsp;
            <input type="text"placeholder="검색어를 입력하세요" style="width: 100px;">
            <span class="input-group-btn" style="margin-top: 5px;">
              <button type="submit" style="background-color: orange; width: 160px;">레시피 찾기!</button>
            </span>
          </div>
        </form>
        <%@ include file="static/sideMenu.jsp"%>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">  
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;주간 베스트 레시피</div>
        </div>
        <br>
        <!-- /panel -->
        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">1위</h4>
                <h5><a href="#">지옥에서온 물조장 고범석!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">2위</h4>
                <h5><a href="#">지옥에서온 고범따리!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">3위</h4>
                <h5><a href="#">지옥에서온 피자!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">4위</h4>
                <h5><a href="#">지옥에서온 고범석!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">5위</h4>
                <h5><a href="#">지옥에서온 딸기케이크!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">6위</h4>
                <h5><a href="#">지옥에서온 초코케이크!</a></h5>
                <p class="card-text">작성자 : <a href="#">고범석</a></p>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="mypage/mypagePoint.jsp" style="color: white; margin-bottom: 10px;">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
        <%} else if (loginMember == null && loginSeller != null){ %>
          <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginSeller.getCompany() %><br>반갑습니다!<br><br>
          <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/seller/sellerPageInsert.jsp'">판매관리페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
      <%} else if (loginMember == null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button>
        </div>
        <%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button>
        </div>   
        <%}%>
        <script> // 두 계정이 혹시나 모두 로그인 되어있다면 로그아웃 시켜주기
           $(function(){
              <%if (loginMember != null && loginSeller != null) {%>
                 alert('두 계정이 접속되어 로그아웃 작업이 진행됩니다.');
                 logout();
              <%}%>              
           });
        </script>
      </div>
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
  <%@ include file="static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
     function login(){
        location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
     }
     function logout(){
        location.href="<%=request.getContextPath()%>/logout.me";
     }
     function memberJoin(){
        
     }
  </script>
</body>
</html>