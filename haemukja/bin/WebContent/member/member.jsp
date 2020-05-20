<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String[] phone = loginMember.getMtel().split("-");
	String [] email = loginMember.getEmail().split("@");
	
	ArrayList<String> ptitle = (ArrayList<String>)request.getAttribute("ptitle");
	ArrayList<String> camount = (ArrayList<String>)request.getAttribute("camount");
	ArrayList<Integer> amprice = (ArrayList<Integer>)request.getAttribute("amprice");
	int allamprice = (Integer)request.getAttribute("allamprice");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 구매 페이지</title>

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
    
</head>

<body>
	
    <div class="reciept">
        <div class="container">
   
            <br>
            <h3>* 주문상품</h3>
            <div class="row">
            <%for(int i =0 ; i< ptitle.size() ; i++){ %>
                <div class="col-md-8">
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <img class="media-object img-thumbnail user-img" style="height: 80px;" alt="User Picture"
                            src="http://via.placeholder.com/80x80">
                    </div>
                   
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <div>
                        
                            <strong><%=ptitle.get(i) %></strong><br>
                          
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

				
                    <div class="form-group">

                        <div class="col-md-4">
                            가격 :
                            <input id="price" name="price"  type="text"  value ="<%=amprice.get(i) %>" style="text-align: right" placeholder="0원" class="form-control" readonly>
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-md-4">
                            구매수량 :
                            <input type="text" name="count" id="count" value="<%=camount.get(i) %>" style="text-align: right" class="form-control" aria-describedby="year-addon" readonly>
                            
                            
                        </div>
                    </div>
                    
            
                </div>
                <%} %>
                
                
            </div>
            
            <div class ="row">
          	  <div class="form-group">
            		<div class= "col-md-12" >
            		
            		    총 결제금액 :
                            <input type="text" name="allamprice" id="allamprice" style="text-align: right; width:100px;" value="<%=allamprice %>" class="form-control" aria-describedby="year-addon" readonly>
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
                                   required autofocus value="<%=loginMember.getMname() %>" readonly >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="orderphone" class="col-md-1 col-form-label text-md-right">전화번호</label>
                            <div class="col-md-3">
                                <input type="text" id="orderphone" class="form-control" name="phone" required
                                    autofocus style="width: 63px" value="<%=phone[0] %>" readonly> - <input type="text" id="join-phone2"
                                    class="form-control" name="phone" required autofocus style="width: 63px" value="<%=phone[1] %>" readonly>-
                                <input type="text" id="join-phone3" class="form-control" name="phone" required
                                    autofocus style="width: 63px" value="<%=phone[2] %>" readonly >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="ordermail" class="col-md-1 col-form-label text-md-right">이메일</label>
                            <div class="col-md-9">
                                <input type="text" id="email" name="email1" class="form-control" required
                                    style="width: 100px" value="<%=email[0] %>" readonly>&nbsp;&nbsp;@
                                <input type="text" id="email" name="email2" class="form-control" required
                                    style="width: 100px" value="<%=email[1] %>" readonly >


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
                                    <input type="text" id="receiverAddress" class="form-control" name="receiverAddress"
                                        required placeholder="도로명/지번 검색"
                                        style="width: 180px">&nbsp;&nbsp;<button>검색</button>
                                    <input type="text" id="receiverAddress" class="form-control" name="receiverAddress"
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
                    
                        <h3>* 포인트 사용</h3>
                        <br>
                        <div class="form-group row">
                            <label for="point" class="col-md-3 col-form-label text-md-right">홍길동님의 현재 보유 포인트는
                                <%=loginMember.getMpoint() %>점입니다</label>
                        </div>
                        <br>
                        <div class="container">
                            <div class="form-group">
                                <label for="point" class="col-md-1 col-form-label text-md-right"></label>
                                <div class="row">
                                    <input name="point" type="text" id="point" >&nbsp;
                                    
                                    <button class="btn btn-success btn-lg" onclick="point();">사용하기</button>
                                </div>
                            </div>
                        </div>
                  
                    <br>
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
                                <input type="radio" id="phonePay" name="payment" value="phonePay" checked>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="deposit" class="col-xs-1 col-form-label text-md-right">무통장입금</label>
                            <div class="col-lg-4">
                                <input type="radio" id="deposit" name="payment" value="deposit" checked>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="bankTrans" class="col-xs-1 col-form-label text-md-right">계좌이체</label>
                            <div class="col-lg-4">
                                <input type="radio" id="bankTrans" name="payment" value="bankTrans" checked>
                            </div>
                        </div>
                        
                        <div class="container">
                            <div class="row">
                           
                                <div class="col text-center">
                                    <button class="btn btn-success btn-lg" type="submit">결제하기</button>
                                </div>
                            </div>
                        </div>
                    
            	</div> 
         
       
        
    	</div><!-- container -->
    </div> <!-- reciept -->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    
	    $(function(){
			$("#pointButton").click(function(){
				var curentPoint	=<%=loginMember.getMpoint()%>; /*현재포인트*/
				var usePoint = $("#point").val();			   /*사용할포인트*/
				var allamprice = <%=allamprice%>;			   /*총가격*/	
				
				
				var resultPrice = allamprice - usePoint;	   /*포인트사용된가격*/
				var resultPoint = curentPoint - usePoint;	   /*남은포인트*/
				
				
				if(resultPrice<0||resultPoint<0 ){
					$("#point").focus();
					$("#point").val("");
					alert("다시입력하세요.")
				}else{
					
				
				$("#allamprice").val(resultPrice);
				$("#pointLabel").html(resultPoint+"점입니다.");
			}
		
		});
			
	});
    	
    </script>
    
    
  </body>
  </html>
   
    