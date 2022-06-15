<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./commons/header.jsp" %>
<body> 
<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
       	<script type="text/javascript">
		//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
		function validateForm(form) {
			if(form.name.value == "") {
				alert("작성자를 입력하세요.");
				form.name.focus();
				return false;
			}
			if(form.title.value == "") {
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if(form.content.value == "") {
				alert("내용을 입력하세요.");
				form.content.focus();
				return false;
			}
		}
		</script>
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>자유게시판</small></h3>
            
            <form name="writeFrm" method="post" enctype="multipart/form-data"
				action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
			<input type="hidden" name="idx" value="${dto.idx }">
			<input type="hidden" name="preOfile" value="${dto.ofile }">
			<input type="hidden" name="preSfile" value="${dto.sfile }">
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <input type="text" class="form-control" 
                                style="width:100px;" name="name" value="${dto.name }"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" class="form-control" name="title" value="${dto.title }"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea rows="5" class="form-control" name="content">${dto.content }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" name="ofile"/>
                            <c:if test="${dtp.sfile != 'null' }">
                            	<div class="form-check m-2">
                           			<input class="form-check-input" type="checkbox" name="check" value="delete">${dto.ofile }&nbsp;기존파일삭제
								</div>
                            </c:if>
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">작성 완료</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='../mvcboard/list.do';">
                        	목록보기
                        </button>
                        <button type="reset" class="btn btn-dark">다시쓰기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>