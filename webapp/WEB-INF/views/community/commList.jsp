<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 소통창구</title>
<link href="${pageContext.request.contextPath}/assets/css/community/myAddress.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/community/commList.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- header&nav -->
	<jsp:include page="/WEB-INF/views/global/header.jsp"></jsp:include>
	
	<div class="contents">		
		<div class="subtitle">
			<h1>우리동네 소통창구</h1>
			<!-- 글쓰기 버튼 -->
			<ul class="mine">
				<button class="badge text-bg-primary">  
					<a class="aTag" href="${pageContext.request.contextPath}/comm/insert" >글쓰기</a>
				</button>&nbsp;
				<a class="aTags" href=""> 내 소식 </a>&nbsp;
				<a class="aTags" href=""> 내 게시글 </a>&nbsp;
				<a class="aTags" href=""> 내 댓글 </a>
			</ul>
		</div>	
			
		<div class="search">		
			<div class="address">
				<span class="myColor">천호동</span>&nbsp; <i class="fa-regular fa-square-caret-down"></i>
			</div>			
			
			<div>
				<button class="img-button" type="submit" name="click" value="">
				<i class="fas fa-search"></i>
				</button>	
				<input type="text" class="box" value="검색">			
			</div>								
		</div>			
		<div class="content">		
			<div id="aside">
				<ul>
					<div class="click-box" id="asideBox"><li href="">&nbsp;전체</li></div>
					<div id="asideBox"><li href="">&nbsp;소식</li></div>
					<div id="asideBox"><li href="">&nbsp;정보</li></div>
					<div id="asideBox"><li href="">&nbsp;질문</li></div>
				</ul>
			</div>
			
			
			
			<div id="contentList">
			
			    <table class="commRead">			        
			        <div class="content-info">            
			            
			            <div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;
				            	<a id="title" href="${pageContext.request.contextPath}/comm/read">제목입니다</a>				            
				            </div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>	
			            	
			        </div>			        
			       
			        <!-- ------------------------------------------------------------------------------------------------------ -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/234.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;제목입니다</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/234.jpg"></a>
				        </div>	
			         </div>
			         
			          <!-- ------------------------------------------------------------------------------------------------------ -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/123.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;제목입니다</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/123.jpg"></a>
				        </div>	
			         </div>
			         
			          <!-- ------------------------------------------------------------------------------------------------------ -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;제목입니다</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>	
			         </div>
			         
			          <!-- ------------------------------------------------------------------------------------------------------ -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/234.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;제목입니다</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/234.jpg"></a>
				        </div>	
			         </div>
			         
			          <!-- ------------------------------------------------------------------------------------------------------ -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;제목입니다</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기에는 시기가 늦어버린답니다. 
				            그러니 적당한 시기보다도 견주님이 안전하게 대리고 다니시는게 가장 좋습니다. 
				            예를 들어 반려견을 안고다니시거나, 강아지유모차를 사용하는 방법도 좋고 2차접종이 끝난후 다른 아이들과 
				            접촉을 피하면서 짧게 산책을 하는 것이 ...</div>
				            <div class="like"> <i class="fa-solid fa-heart"></i> 12&nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>
			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>	
			         </div>
			        		        
			    </table>
			</div>
				
			
		</div>
				
	</div>
	
</body>
</html>