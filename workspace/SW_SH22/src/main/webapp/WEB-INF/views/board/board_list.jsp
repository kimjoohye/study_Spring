<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<c:set var="resources" value="/resources"/>
<c:set var="CP_RES" value="${CP}${resources}"/>

<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>게시 목록</title>
    
    <!-- 부트스트랩 -->
    <link href="${CP_RES }/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CP_RES }/js/jquery-1.12.4.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES }/js/eclass.js"></script>
    <!-- 사용자 정의 function, isEmpty -->
    <script src="${CP_RES }/js/eUtil.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CP_RES }/js/bootstrap.min.js"></script>
    <!-- jquery_bootstrap paging -->
    <script type="text/javascript" src="${CP_RES}/js/jquery.bootpag.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function(){
            console.log("document.ready");
            
            function doRetrieve(page) {
                console.log("function doRetrieve");
                console.log("page: " + page);
                
                let url = "${CP}/board/doRetrieve.do";
                let method = "GET";
                let async = true;
                let parameters = {
                        searchDiv: $("#searchDiv").val(),
                        searchWord: $("#searchWord").val(),
                        pageSize: $("#pageSize").val(),
                        pageNum: page,
                        div: $("#div").val()
                };
                
                EClass.callAjax(url, parameters, method, async, function(data) {
                    console.log("EClass.callAjax data : " + data);
                })
                
            }
            
            $("#doRetrieve").on("click", function(e) {
                console.log("doRetrieve");
                doRetrieve(1);
            });
        });
    </script>
    
</head>
<body>
       <!-- div container -->
       <div class="container">
          <!-- 제목 -->
          <div class="page-header">
              <h2>게시 목록</h2>
          </div>
          <!--// 제목 ----------------------------------------------------------->
          
          <!-- 검색영역 -->
          <div class="row">
            <form action="#" class="form-inline col-sm-12 col-md-12 col-lg-12 text-right">
               <input type="text" name="div" id="div" value="${vo.getDiv()}">
               <div class="form-group ">
                 <select class="form-control  input-sm" name="searchDiv" id="searchDiv">
                    <option value="">전체</option>
                    <option value="10">제목</option>
                    <option value="20">내용</option>
                 </select>
                 <input type="text" class="form-control  input-sm" name="searchWord" id="searchWord" placeholder="검색어" />
                 <select class="form-control  input-sm" name="pageSize" id="pageSize">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                 </select>  
               <input type="button" id="doRetrieve" class="btn btn-primary btn-sm" value="목록" />
               <input type="button" id="doRetrieve" class="btn btn-primary btn-sm" value="등록" />                              
               </div>
            </form>
          
          </div>
          <!--// 검색영역 ----------------------------------------------------------->
          
          vo : ${vo}
          <!-- table -->
          <div class="table-responsive">
           <table class="table table-striped table-bordered table-hover table-condensed">
               <thead class="bg-primary">
                 <tr>
                     <th class="text-center col-sm-1 col-md-1 col-lg-1">번호</th>
                     <th class="text-center col-sm-6 col-md-6 col-lg-8">제목</th>
                     <th class="text-center col-sm-2 col-md-2 col-lg-1">작성자</th>
                     <th class="text-center col-sm-2 col-md-2 col-lg-1">작성일</th>
                     <th class="text-center col-sm-1 col-md-1 col-lg-1">조회수</th>
                     <th style="display:none;">boardId</th>
                 </tr>
               </thead>
               <tbody>
                <!-- 문자: 왼쪽, 숫자: 오른쪽, 같은면: 가운데 -->
                <c:choose>
                    <c:when test="${list.size() > 0}">
                        <c:forEach var="vo" items = "${list}">
                             <tr>
                                 <td class="text-center col-sm-1 col-md-1 col-lg-1">${vo.num}</td>
                                 <td class="text-left   col-sm-6 col-md-6 col-lg-8">${vo.title}</td>
                                 <td class="text-center col-sm-2 col-md-2 col-lg-1">${vo.modId}</td>
                                 <td class="text-center col-sm-2 col-md-2 col-lg-1">${vo.modDt}</td>
                                 <td class="text-right  col-sm-1 col-md-1 col-lg-1">${vo.readCnt}</td>
                                 <th style="display:none;">${vo.seq}</th>
                             </tr>                         
                        </c:forEach>
                    </c:when>  
                    <c:otherwise>
                        <tr>
                            <td>No data found</td>
                        </tr>
                    </c:otherwise>            
                 </c:choose>                                               
               </tbody>
           </table>
          </div>
          <!--// tabble ----------------------------------------------------------->
          <!-- pagenation -->
        <div  class="text-center">
           <nav>
              <ul class="pagination">
                <li>
                  <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                  <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>         
        </div>        
          <!--//pagenation ------------------------------------------------------>
          
       </div>
       <!--// div container --------------------------------------------------->
       
</body>
</html>