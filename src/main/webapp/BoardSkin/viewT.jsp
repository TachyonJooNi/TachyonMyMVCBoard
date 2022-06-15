<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./commons/header.jsp" %>
<html>
<body>
<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>
            <form>
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="30%"/>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            ${dto.name }
                        </td>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성일</th>
                        <td>
                            ${dto.postdate }
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">이메일</th>
                        <td>
                            nakjasabal@naver.com
                        </td>
                        <th class="text-center" 
                            style="vertical-align:middle;">조회수</th>
                        <td>
                            ${dto.visitcount }
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td colspan="3">
                            ${dto.title }
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td colspan="3">
                            ${dto.content }
                            <br>
                            <c:choose>
								<c:when test="${result eq 'img' or result eq 'png'}">
		                            <img id="imgTest" src="../Uploads/${dto.sfile }" width="150">
								</c:when>
								<c:when test="${result eq 'mp3'}">
		                            <audio id="audioTest" src="../Uploads/${dto.sfile }" controls></audio>
								</c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td colspan="3">
                            <c:if test='${not empty dto.ofile}'>
					        ${dto.ofile }
					        <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">
					        	[다운로드]
					        </a>
					        </c:if>
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <button type="button" class="btn btn-secondary" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">
                       		수정하기
                        </button>
                        <button type="button" class="btn btn-success" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">
                        	삭제하기
                        </button>
                        <button type="button" class="btn btn-warning" onclick="location.href='../mvcboard/list.do';">
                        	목록보기
                        </button>
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