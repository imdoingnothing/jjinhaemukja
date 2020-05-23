<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>해먹샵판매글</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');

    * {
      font-family: 'Nanum Gothic', sans-serif;
      font-size: 13px;
    }

    .logo {
      height: 80px;
    }

    .list-group-item {
      border-style: none;
    }

    .panel-heading {
      background-color: orange;
      line-height: 50px;
      vertical-align: middle;
      color: white;
      font-size: 30px;
    }

    #login {
      background-color: rgb(188, 188, 188);
      text-align: center;
      width: 150px;
      height: 200px;
      border-radius: 15px;
    }

    #loginBtn {
      background-color: rgb(50, 50, 50);
      text-align: center;
      border: none;
      border-radius: 3px;
      color: white;
    }

    a {
      color: black;
      text-decoration: none
    }

    a:hover {
      color: orange;
      text-decoration: none;
    }

    footer {
      background-color: rgb(230, 230, 230);
      height: 200px;
    }

    #shopmenubar{
      width: 100%;
      background-color: orange;


    }

    #menuname li a{
      font-size: 1.5em;
    }

   

    #loginbutton{
      font-size: 20px;

    }

    .carousel slide my-4{
      width: 100%;
    }

    .col-lg-9{
      flex: 0 0 50%;
      max-width: 100%;
    }
   
   .carousel-item{

    flex: 0 0 100%;
      max-width: 100%;

    }
    .d-block{
      width: 100%;
      height: 350px;
    }

     .card-img-top{
      width: 348px;
      height: 231px;
    }

    #count{
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 50px;
    }


    .cart-buy-button{
    
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 100px;
      height: 40px


    }

    #buy{
      background-color: darkgray;
    }

    #saleDetail{
      padding-top: 20px;
    }

    .sellerComment{
      background-color: lightgray;
    }

    #contentSubmit{
      background-color: lightgray;

    }

    #forList{
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 80px;
      height: 30px;
    }
    .table{
      text-align: center;
    }

    #qna{
       border-radius: .25rem;
      border: 1px solid #ced4da;
    }

    #detail{
       border-radius: .25rem;
      border: 1px solid #ced4da;
    }
    .contentBox{
      width: 100%;
      height: 50px;
      border: 1px solid lightgray;
      border-radius: .25rem;
      border: 1px solid #ced4da;
      background-color: lightgray;
    }

    .sell-detail-img{
      width: 100%;
    }

    button {
      background-color: rgb(50, 50, 50);
      text-align: center;
      border: none;
      border-radius: 3px;
      color: white;
      height: 30px;
    }

    li>a {
      margin-left: 60px;
    }

    .replyText{
      display: none;
    }

    #thumbnail{
      width: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
    }

    div

  </style>
</head>

<body>

  <div class="container" style="height: 120px; padding: 20px;">
    <div class="row">
      <div class="col-lg-4">
        <a href="index.html"><img class="logo" src="<%=request.getContextPath()%>/images/haemukjalogo_size.png"></a>
      </div>

      <div class="col-lg-4" align="center">
        <a href="haemukshop_main.html"><img class="logo" src="<%=request.getContextPath()%>/images/haemukshoplogo.png"></a>
      </div>

      <div class="col-lg-4" align="right">
        <div class="user" style="border: 2px solid orange; width: 200px;" align="center">
          <h4>비회원</h4>
          <a href="../member/loginHaemukja.jsp" style="font-size: 15px;">로그인</a><br>
          <a href="join.html" style="font-size: 15px">회원가입</a>
        </div>
      </div>
    </div>
  </div> 

  <!-- Page Content -->
  <div class="container">
    <div class="row">
     
     <nav class="navbar navbar-expand-lg navbar-light " id="shopmenubar">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav" id="menuname">
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">채소</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">과일 견과 쌀</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">수산 해산 건어물</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">정육 계란</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">음료 우유</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;">베이커리 치즈</a>
            </li>
          </ul>
        </div>
      </nav>
      
      <br>
       
      <div class="col-lg-9" >
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" style="width: 525px; height: 300px;">
          <img src="../images/apple.jpg" id="thumbnail">
        </div>
      </div>

      <div class="col-lg-9" id="saleDetail" >
        <form>
          <h3 id="saleTitle">GAP 인증 사과 한봉지 6개</h3>
          <br>
          <h4 id="price">5,900원</h4>
          <br>
          <hr>
          <br>
          <h5 style="display: inline-block;">원산지</h5>
          <h5 id="origin" style="display: inline-block;">국산</h5>
          <hr>
          <br>
          <h5 style="display: inline-block;">구매수량</h5>
          <input type="number" id="count" name="count" min="0" max="100" step="1" placeholder="0">
          <br>
          <br>
          <br>
          
          <div align="right">
            <button type="submit">장바구니</button>
            <button type="submit">구매하기</button>
          </div>
        </form>
      </div>

    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <div class="container" id="button-box"> 
    <div align="right">
      <button type="button" id="detail" name="detail">상세내용</button>
      <button type="button" id="review" nmae="review">리뷰확인</button>
      <button type="button" id="qna" name="qna">문의하기</button>
    </div>
    <hr>
  </div>

  <div class="container" id="detail-box">
    <img src="images/apple.jpg" class="sell-detail-img">
    <h3>맛있는 사과</h3>
    <span>싱싱하고 맛있습니다~~</span>
  </div>

  <div class="container" id="reviewBox" style="display: none">
    <table class="table">
      <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>리뷰내용</th>
          <th>구매날짜</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>3</td>
          <td>예지</td>
          <td>존맛탱</td>
          <td>2020.05.14</td>
        </tr>
        <tr>
          <td>3</td>
          <td>예지</td>
          <td>존맛탱</td>
          <td>2020.05.14</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div  class="container" id="qnaBox" style="display: none">
    <table class="table">
      <thead>
        <tr>
          <th>번호</th>
          <th>문의글내용</th>
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
          <td><button class="replyBtn">답글 작성</button></td>
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
          <td><button class="replyBtn">답글 작성</button></td>
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
      <div id="qnaRegister" class="full-row" align="right">
        <form>
          <textarea cols="180" rows="5"></textarea>
          <br>
          <button type="submit">등록</button>
        </form>
      </div>
  </div>
  
  <br>
  <div align="center"><button type="button">목록으로</button></div>
  <br>

  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
      $('#detail').click(function(){
        $('#detail-box').show();
        $('#qnaBox').hide();
        $('#reviewBox').hide();
      });

      $('#qna').click(function(){
        $('#detail-box').hide();
        $('#qnaBox').show();
        $('#reviewBox').hide();
       });

      $('#review').click(function(){
        $('#detail-box').hide();
        $('#qnaBox').hide();
        $('#reviewBox').show();
      });

      $(".replyBtn").click(function(){
        console.log($(this).parent().parent().next().toggle());
      });
  </script>

</body>

</html>