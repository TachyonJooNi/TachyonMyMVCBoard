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
			if(form.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				form.pass.focus();
				return false;
			}
		}
		</script>
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>자유게시판</small></h3>
            
            <form name="writeFrm" method="post"
				action="../mvcboard/pass.do" onsubmit="return validateForm(this);">
			<input type="hidden" name="idx" value="${param.idx }" >
			<input type="hidden" name="mode" value="${param.mode }" >
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">패스워드</th>
                        <td>
                            <input type="text" class="form-control" 
                                style="width:200px;" name="pass"/>
                        </td>
                    </tr>
                </tbody>
                </table>
                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='../mvcboard/list.do';">
                        	목록돌아가기
                        </button>
                        <button type="reset" class="btn btn-dark">다시입력</button>
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