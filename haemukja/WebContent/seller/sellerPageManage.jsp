<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>제품관리</title>

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
  
  .paging {
  	  font-size: 20px;
  	  background-color: orange;
  	}
  </style>
  
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-default bg-white">
    <div class="container">
      <a class="navbar-brand" href="../index.html">
        <img class="logo" src="../images/haemukjalogo.png" />
      </a>
      <a class="navbar-brand" align="right" href="#">
        <img class="logo" src="../images/haemukshoplogo.png" />
      </a>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="list-group">
          <h4><a href="<%=request.getContextPath() %>/seller/sellerPageInsert.jsp">제품 등록</a></h4>
          <h4><a href="<%=request.getContextPath() %>/seller/sellerPageExplain.jsp">제품 설명</a></h4>
          <h4><a href="<%=request.getContextPath() %>/seller/sellerPageManage.jsp">제품 관리</a></h4>
          <h4><a href="sellerpage_order.html">주문 관리</a></h4>
          <h4><a href="sellerpage_qna.html">문의글 답변</a></h4>
          <h4><a href="<%=request.getContextPath() %>/seller/sellerPageEdit.jsp">상세페이지 수정</a></h4>
        </div>

      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;판매관리페이지</div>
        </div>
        <!-- /panel -->
        <br>
        <div class="container">
          <div class="row">
            <h3>제품 관리</h3>
            <hr>
              <table class="table" style="text-align: center;">
                <thead>
                  <tr>
                    <th style="width: 100px;">제품번호</th>
                    <th style="width: 350px;">제품명</th>
                    <th style="width: 100px;">제품 삭제</th>
                    <th style="width: 100px;">판매 여부</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px;">
                      1
                      <input type="hidden" value="">
                    </td>
                    <td style="width: 350px;">
                      고등어
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="delete()">삭제하기</button>
                    </td>
                    <td style="width: 100px;">
                      <button type="button" onclick="updateSoldOut()">품절처리</button>
                    </td>
                  </tr>
                </tbody>
              </table>
          </div>
        </div>
      </div>
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
    </div>
    <!-- /.row -->
    <br><br>
    <div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
        <button onclick="" class="paging"> << </button>
        <button onclick="" class="paging"> < </button>
        <button onclick="" class="paging"> 1 </button>
        <button onclick="" class="paging"> 2 </button>
        <button onclick="" class="paging"> 3 </button>
        <button onclick="" class="paging"> 4 </button>
        <button onclick="" class="paging"> 5 </button>
        <button onclick="" class="paging"> 6 </button>
        <button onclick="" class="paging"> 7 </button>
        <button onclick="" class="paging"> 8 </button>
        <button onclick="" class="paging"> 9 </button>
        <button onclick="" class="paging"> 10 </button>
        <button onclick="" class="paging"> > </button>
        <button onclick="" class="paging"> >> </button>
      </div>
    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
  <footer>
    <div class="container">
      <br>
      <div class="row">
        <div class="col-md-12" style="text-align: center">
          <h5>Copyright &copy; 2020</h5>
          <h5>김예지 지정수 조정규 박두리 김소현 고범석</h5>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
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