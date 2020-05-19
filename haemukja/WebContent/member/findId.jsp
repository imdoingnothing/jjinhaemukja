<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	String mid = (String)request.getAttribute("id");

%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>아이디찾기</title>

  <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/idpw.css" rel="stylesheet">
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
</head>

<body>

  <main class="login-form">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">

            <div class="card-header" align="center">
              <img src="<%=request.getContextPath() %>/images/haemukjalogo.png" width="400px">
            </div>

            <div class="card-body">
              <form  action="<%=request.getContextPath()%>/id.me" id="findForm" method="post">
                <div class="form-group row">
                  <label for="idFind-name" class="col-md-4 col-form-label text-md-right">이름</label>
                  <div class="col-md-6">
                    <input type="text" id="idFind-name" class="form-control" name="name" placeholder="이름을 입력하세요" required autofocus>
                  </div>
                </div>
                <br>
                <div class="form-group row">
                  <label for="idFind-email" class="col-md-4 col-form-label text-md-right">이메일</label>
                  <div class="col-md-6">
                    <input type="email" id="idFind-email" class="form-control" name="email" placeholder="abc1234@hamukja.com" required>
                  </div>
                </div>
                <br>
				  	<%if(mid!=null){%>
				  		 <div align="center"><h3>찾으시는 아이디는 '<%=mid %>' 입니다.</h3></div>
				  	<%}else{%>
				  		
				  	
				  	<%}%>
               
                <br>
                <div class="col-md-6 offset-md-4">            
                  <button type="submit" class="btn btn-primary" id="findButton" style="background-color: orange; border: none;">
                  아이디 찾기</button>&nbsp;&nbsp;
                  <button type="button" class="btn btn-primary" style="background-color: orange; border: none;">
                  취소</button><br>
                </div>
              </form>
            </div> <!-- card-body -->
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>
  


  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
 	


  		 
  
 	 
  </script>
  
</body>

</html>