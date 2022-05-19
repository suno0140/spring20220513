<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/app01"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
	<my:navBar></my:navBar>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>${board.id }번게시물</h1>

				<c:url value="/ex17/board/modify" var="modifyLink"></c:url>

				<form action="${modifyLink }" method="post" id="form1">
					<input type="hidden" name="id" value="${board.id }" />

					제목 :
					<input class="form-control" type="text" value="${board.title }"
						name="title" />
					<br />

					본문 :
					<textarea class="form-control" cols="30" rows="10" name="body">${board.body }</textarea>
					<br />

					작성일시 :
					<input class="form-control" type="datetime-local"
						value="${board.inserted }" readonly />
					<br />

				</form>

				<c:url value="/ex17/board/remove" var="removeLink" />
				<form action="${removeLink }" method="post" id="form2">

					<input type="hidden" name="id" value="${board.id }" />

				</form>
				<button type="submit" form="form1" class="btn btn-outline-info">수정</button>
				<button type="submit" form="form2" class="btn btn-outline-dark">삭제</button>
			</div>
		</div>
	</div>
	<hr />

	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<h3>댓글 ${board.numOfReply} 개</h3>


				<form action="${appRoot }/ex18/reply/add" method="post">
					<input type="hidden" name="boardId" value="${board.id }" />
					댓글 
					<input type="text" name="content" size="50" />

					<button>쓰기</button>
				</form>

				<hr />

				<div>
					<ul class="list-group">
						<c:forEach items="${replyList }" var="reply">
							<li class="list-group-item">

								${reply.inserted } : ${reply.content }

								<c:url value="/ex18/reply/modify" var="replyModifyLink" />
								<form action="${replyModifyLink }" method="post"
									id="form3${reply.id }">
									<input type="hidden" value="${reply.id }" name="id" />
									<input type="hidden" name="boardId" value="${board.id }" />
									<input type="text" value="${reply.content }" name="content" />

								</form>



								<c:url value="/ex18/reply/remove" var="replyRemoveLink" />
								<form action="${replyRemoveLink}" method="post"
									id="form4${reply.id }">
									<input type="hidden" name="id" value="${reply.id }" />
									<input type="hidden" name="boardId" value="${board.id }" />

								</form>
								
								<button type="submit" form="form3${reply.id }"
									class="btn btn-outline-info">
									<i class="fa-solid fa-square-pen"></i>
								</button>

								<button type="submit" form="form4${reply.id }"
									class="btn btn-outline-dark">
									<i class="fa-solid fa-trash"></i>
								</button>

							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>