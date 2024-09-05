<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="all_component/allCss.jsp"%>

<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.BookDtls"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>

<style type="text/css">


.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3 mt-3">
			<%
					BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list3 = dao3.getAllOldBook();
					for(BookDtls b: list3){
					%>
						<div class="col-md-3">
							<div class="card crd-ho">
								<div class="card-body text-center">
									<img alt="" src="book/<%= b.getPhotoName() %>"
										style="width: 150px; height: 200px" class="img-thumblin">
									<p><%= b.getBookName() %></p>
									<p><%= b.getAuthor() %></p>
									<p>Categories: <%= b.getBookCategory() %></p>
									<div class="row">
										<a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
										<a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %> <i class="fas fa-dollar-sign"></i></a>
									</div>
								</div>
							</div>
						</div>
					<%
					}
				%>
		</div>
	</div>
</body>
</html>