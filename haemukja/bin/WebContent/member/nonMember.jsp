<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 구매 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/sellerAndStatic.css" rel="stylesheet">
    <link href="../css/writeBoard.css" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
        integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
        integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
        crossorigin="anonymous"></script>
</head>

<body>
	
    <div class="reciept">
        <div class="container">
        <form action="<%=request.getContextPath()%>/nonmember.me" method="post">
            <br>
            <h3>* 주문상품</h3>
            <div class="row">
                <div class="col-md-8">
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <img class="media-object img-thumbnail user-img" style="height: 80px;" alt="User Picture"
                            src="http://via.placeholder.com/80x80">
                    </div>
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <div>
                            <strong name="product">삼겹살</strong><br>
                            기보의 손맛 1kg
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

				
                    <div class="form-group">

                        <div class="col-md-4">
                            가격 :
                            <input id="price" name="price" type="text" placeholder="0원" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-md-4">
                            구매수량 :
                            <select name="count" id="count" class="form-control" aria-describedby="year-addon">
                                <option selected="selected" value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            
            
          
                
                    <br>
                    <div align="left">
                        <h3>* 주문자 정보 입력</h3>
                        <br>
                        <div class="form-group row">
                            <label for="orderer" class="col-md-1 col-form-label text-md-right">주문자</label>
                            <div class="col-md-3">
                                <input type="text" id="orderer" class="form-control" name="orderer"
                                   required autofocus>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="orderphone" class="col-md-1 col-form-label text-md-right">전화번호</label>
                            <div class="col-md-3">
                                <input type="text" id="orderphone" class="form-control" name="phone1" required
                                    autofocus style="width: 
                                    63px" > - <input type="text" id="join-phone2"
                                    class="form-control" name="phone2" required autofocus style="width: 63px"> -
                                <input type="text" id="join-phone3" class="form-control" name="phone3" required
                                    autofocus style="width: 63px" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="ordermail" class="col-md-1 col-form-label text-md-right">이메일</label>
                            <div class="col-md-9">
                                <input type="text" id="email" name="email" required
                                    style="width: 100px" >&nbsp;&nbsp;@
                                <select name="email2">
                                    <option selected></option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="google.com">google.com</option>
                                </select>

                            </div>
                        </div>
                    
                        <br>
                        <hr>
                     
                            <h3>* 수령인 정보 입력</h3>
                            <br>
                            <div class="form-group row">
                                <label for="receiver" class="col-md-1 col-form-label text-md-right">수령인</label>
                                <div class="col-md-3">
                                    <input type="text" id="receiver" class="form-control" name="receiver"
                                        placeholder="이름을 입력하세요" required autofocus>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="receiverPhone" class="col-md-1 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-3">
                                    <input type="text" id="receiverPhone" class="form-control" name="receiverPhone"
                                        required autofocus style="width: 63px"> - <input type="text" id="receiverPhone"
                                        class="form-control" name="receiverPhone" required autofocus
                                        style="width: 63px"> - <input type="text" id="receiverPhone"
                                        class="form-control" name="receiverPhone" required autofocus
                                        style="width: 63px">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="receiverAddress" class="col-md-1 col-form-label text-md-right">주소</label>
                                <div class="col-md-4">
                                    <input type="text" id="receiverAddress" class="form-control" name="receiverAddress1"
                                        required placeholder="도로명/지번 검색"
                                        style="width: 180px">&nbsp;&nbsp;<button>검색</button>
                                    <input type="text" id="receiverAddress" class="form-control" name="receiverAddress2"
                                        required placeholder="상세주소 입력">
                                </div>
                            </div>
                        
                        <div class="form-group row">
                            <label for="shipMemo" class="col-md-1 col-form-label text-md-right">배송메모</label>
                            <div class="col-md-3">
                                <textarea class="form-control" rows="2" id="shipMemo" placeholder="내용을 입력하세요">
                                        </textarea>
                            </div>
                        </div>
                  
                    <hr>
                    <br>
                  
                        <h3>* 결제수단 </h3>
                        <br>

                        <div class="form-group row">
                            <label for="credit" class="col-xs-1 col-form-label text-md-right">신용카드</label>
                            <div class="col-lg-4">
                                <input type="radio" id="credit" name="payment" value="credit" checked>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="phonePay" class="col-xs-1 col-form-label text-md-right">휴대폰결제</label>
                            <div class="col-lg-4">
                                <input type="radio" id="phonePay" name="payment" value="phonePay">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="deposit" class="col-xs-1 col-form-label text-md-right">무통장입금</label>
                            <div class="col-lg-4">
                                <input type="radio" id="deposit" name="payment" value="deposit" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="bankTrans" class="col-xs-1 col-form-label text-md-right">계좌이체</label>
                            <div class="col-lg-4">
                                <input type="radio" id="bankTrans" name="payment" value="bankTrans">
                            </div>
                        </div>
                        
                        <div class="container">
                            <div class="row">
                            
                                <div class="col text-center">
                                    <button class="btn btn-success btn-lg" onclick="payment();">결제하기</button>
                                </div>
                            </div>
                        </div>
                    
            	</div> 
            </form>
       
        
    	</div><!-- container -->
    </div> <!-- reciept -->
    
    
  </body>
  </html>
   
