<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, recipe.model.vo.*, common.Attachment"%>
<%

	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	ArrayList<Attachment> files = (ArrayList<Attachment>)request.getAttribute("files");
	
	String[] contents = recipe.getbContent().split("\\|");
	
	String[][] tags = new String[10][3];
	for(int i = 0; i < files.size(); i++) {
		String[] strArr = files.get(i).getTag().split("\\|");
		for(int j = 0; j < strArr.length; j++) {
			tags[i][j] = strArr[j];
		}
	}
	
	int bNo = recipe.getbNo();
	String nickname = (String)request.getAttribute("nickname");
	
	String loginId = "";
	if(loginMember != null) {
		loginId = loginMember.getMid();	
	}
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
      display: none;
    }
    .imageArea {
      width: 525px;
      height: 300px;
    }
    .image {
      width: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
      cursor: pointer;
    }
    .no {
      color: green;
      font-size: 30px;
      font-weight: bold;
    }
    #ad {
      width: 100%;
      max-width: 800px;
      max-height: 200px;
      vertical-align: middle;
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
        <!-- table -->
        <table class="table" style="text-align: center;">
          <thead>
            <tr>
              <th style="width: 100px;">번호</th>
              <th style="width: 300px;">제목</th>
              <th style="width: 100px;">작성자</th>
              <th style="width: 100px;">작성일자</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 100px;"><%= recipe.getbNo() %></td>
              <td style="width: 300px;"><%= recipe.getbTitle() %></td>
              <td style="width: 100px;"><%= nickname %></td>
              <td style="width: 100px;"><%= recipe.getbDate() %></td>
            </tr>
            <tr>
              <td colspan='4' align="center">
              <% for(int i = 0; i < files.size(); i++) { %>
              	<i class="no"><%= i+1 %></i>
              	<div class="imageArea">
              		<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(i).getFileName() %>" class="image">
              	</div>
              	<div class="tag">
	              	 <% for(int j = 0; j < tags[i].length; j++) { %>
	              		<a href="#"><%= tags[i][j] %></a>
	              	<% } %>
	              </div>
	              <div class="content">
	              	<%= contents[i] %>
	              </div>
	              <br><br>
              <% } %>
                <br>
              </td>
            </tr>
          </tbody>
        </table>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="right">
          	<% if(loginMember != null && loginId.equals(recipe.getmId())) { %>
		      <!-- <button type="button">수정</button> -->
		      <button onclick="deleteRecipe()">
		      	삭제</button>
          	<% } %>
          </div>
        </div>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="center">
          	<input type="hidden" value="<%= recipe.getbNo() %>">
            <button type="button" id="up" style="width: 100px; background-color: blue">추천</button>
            <button type="button" id="down" style="width: 100px; background-color: red">비추천</button>
          </div>
        </div>
        <br><br>
        <div class="full-right" align="center">
          <div id="advertisement" style="width: 800px; height: 200px;">
            <img src="<%=request.getContextPath() %>/images/ad.jpg" id="ad">
          </div>
        </div>
        <br>

        <div class="container">
          <hr>
            <table class="table">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>댓글내용</th>
                  <th>작성자</th>
                  <th>작성날짜</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>저도 그래서 나갔어요..</td>
                  <td><a href="#">윤기보</a></td>
                  <td>20-05-09</td>
                  <td><button class="replyBtn">답글 작성</td>
                </tr>
                <tr class="replyText">
                  <form method="get">
                    <td colspan="4">
                      <textarea rows="2" cols="85" name="reply"></textarea>
                    </td>
                    <td>
                      <button type="submit">답글 등록</button>
                    </td>
                  </form>
                </tr>
                <tr>
                  <td>2</td>
                  <td>ㄴ222, 그 조장이란놈 좀 이상해요</td>
                  <td><a href="#">이병현</a></td>
                  <td>20-05-09</td>
                  <td><button class="replyBtn">답글 작성</td>
                </tr>
                <tr class="replyText">
                  <form method="get">
                    <td colspan="4">
                      <textarea rows="2" cols="85" name="reply"></textarea>
                    </td>
                    <td>
                      <button type="submit">답글 등록</button>
                    </td>
                  </form>
                </tr>
              </tbody>
            </table>
              
            <form class="form-horizontal">
                <div class="form-group">
                  <label>댓글</label>
                  <textarea class="form-control" rows="2" id="commentContent"></textarea>
                  <br>
                  <div align="right">
                    <button type="submit">등록</button>
                  </div>
                </div>
            </form>
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
      $(".replyText").hide();
      $(".image").click(function(){
        $(this).next().toggle();
      });
      $(".replyBtn").click(function(){
        $(this).parent().parent().next().toggle();
      });
      $(".image").click(function(){
    	 $(this).parent().next().toggle(); 
      });
    });
    
    function login(){
  		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
  	}
    
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
  	function deleteRecipe() {
  		location.href="<%=request.getContextPath()%>/delete.re?bNo=<%=recipe.getbNo()%>&nCode=<%=recipe.getnCode()%>";
  	}
  	
  	$(function(){
  		$("#up").click(function(){
  			var bNo = $(this).parent().children("input").val();
  			
  			location.href="<%= request.getContextPath() %>/up.re?bNo=" + bNo;
  			
  			alert("추천 +1");
  		});
  		
  		$("#down").click(function(){
  			var bNo = $(this).parent().children("input").val();
  			
  			location.href="<%= request.getContextPath() %>/down.re?bNo=" + bNo;
  			
  			alert("추천 -1");
  		});
  	})
  </script>

</body>
</html>