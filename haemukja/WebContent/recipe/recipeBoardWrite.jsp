<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	String nCode = request.getParameter("nCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>레시피게시판</title>

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

    .tag {
      text-align: center;
      background-color: rgb(230, 230, 230);
      width: 550px;
      padding: 5px;
      display: none;
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
        <%@ include file="../static/sideMenu.jsp"%>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;한국</div>
        </div>
        <br>
        <!-- /panel -->
        <div class="container">
          <div class="center-block">
            <form action="<%=request.getContextPath()%>/insert.re" method="post" enctype="multipart/form-data">
              <label for="title"><h5>제목 : </h5></label>
              <input type="text" name="title" style="width: 740px">
              <label for="thumbnail"><h5>썸네일 : </h5></label>
              <input type="file" id="thumbnail" name="image1">
              <br><br>
              <h6 style="color: red; font-weight: bold">
                ※ 최대 10개까지 업로드 가능<br>태그는 이미지 하나당 최대 3개<br>썸네일은 반드시 등록해주세요 ※<br>
                (태그 거는 법 : 해당 판매글 번호 입력)
              </h6>
              <h5>1.</h5>
              <input type="file" id="image1" name="image2"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>2.</h5>
              <input type="file" id="image2" name="image3"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>3.</h5>
              <input type="file" id="image3" name="image4"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>4.</h5>
              <input type="file" id="image4" name="image5"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>5.</h5>
              <input type="file" id="image5" name="image6"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>6.</h5>
              <input type="file" id="image6" name="image7"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>7.</h5>
              <input type="file" id="image7" name="image8"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>8.</h5>
              <input type="file" id="image8" name="image9"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>9.</h5>
              <input type="file" id="image9" name="image10"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br>
              <h5>10.</h5>
              <input type="file" id="image10" name="image11"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
                <input type="text" name="tag">
              </div>
              <textarea name="content" cols="110" rows="3">내용을 입력하세요</textarea>
              <br><br><br>
              <input type="hidden" name="nCode" value="<%= nCode %>">
              <button type="submit" class="btn">저장</button>
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">마이페이지</a>
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
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <br><br>
  <!-- footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    $(function(){
      $(".tagBtn").click(function(){
        console.log($(this).next().toggle());
      });
    });
    
    function login(){
  		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
  	}
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  </script>

</body>
</html>