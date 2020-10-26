<%-- 
    Document   : myArticle
    Created on : Sep 24, 2020, 12:13:16 AM
    Author     : PhuongPT 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Post</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <style>
            <%@include file="css/style.css"%>
        </style>
    </head>
    <body>
        <c:if test="${empty sessionScope}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${not empty sessionScope}">
            <div class="container">
                <div class="header pb-3">
                    <div class="text-center ">
                        <p class="text-white font-weight-bold my-4 navbar-brand welcome-title">
                            WELCOME ${sessionScope.USER_DTO.name}!!!
                        </p>
                    </div>
                    <div class="row ">
                        <nav class="navbar w-100">
                            <ul class="nav w-100 justify-content-between ">
                                <li class="dropdown nav-item">
                                    <button class="btn btn-link nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                        <path fill-rule="evenodd" fill="white" d="M6 8a6 6 0 1112 0v2.917c0 .703.228 1.387.65 1.95L20.7 15.6a1.5 1.5 0 01-1.2 2.4h-15a1.5 1.5 0 01-1.2-2.4l2.05-2.733a3.25 3.25 0 00.65-1.95V8zm6 13.5A3.502 3.502 0 018.645 19h6.71A3.502 3.502 0 0112 21.5z"></path>
                                        </svg>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <c:set var="notify" value="${sessionScope.LIST_NOTIFIES}"/>
                                        <c:if test="${notify != 'None'}">
                                            <c:forEach var="dto" items="${notify}">
                                                <c:url var="detailUrl" value="DispatchController">
                                                    <c:param name="btAction" value="Show details"/>
                                                    <c:param name="txtPostID" value="${dto.postID}"/>
                                                    <c:param name="back" value="${requestScope.BACK_TO_MY_POST}"/>
                                                    <c:param name="page" value="${requestScope.CURRENT_PAGE}"/>
                                                    <c:param name="txtSearchValue" value="${param.txtSearchValue}"/>
                                                </c:url>
                                                <a class="dropdown-item" href="${detailUrl}">
                                                    <c:if test="${dto.type == 'comment'}">
                                                        <p>${dto.name} has just commented to you post: ${dto.title} on ${dto.date}</p>
                                                    </c:if>
                                                    <c:if test="${dto.type == 'like'}">
                                                        <p>${dto.name} has just liked to you post: ${dto.title} on ${dto.date}</p>
                                                    </c:if>
                                                    <c:if test="${dto.type == 'dislike'}">
                                                        <p>${dto.name} has just disliked to you post: ${dto.title} on ${dto.date}</p>
                                                    </c:if>
                                                </a>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${notify == 'None'}">
                                            <a class="dropdown-item" href="#">
                                                <p>There is no notification to show!</p>
                                            </a>
                                        </c:if>
                                    </div>
                                </li>   
                                <div class="navigation">
                                    <li class="nav-item float-left ">
                                        <c:url var="homeUrl" value="DispatchController">
                                            <c:param name="btAction" value="Search"/>
                                        </c:url>
                                        <a href="${homeUrl}" class="nav-link">HOME</a>
                                    </li>
                                    <li class="nav-item float-left">
                                        <c:url var="myPostUrl" value="DispatchController">
                                            <c:param name="btAction" value="My Post"/>
                                        </c:url>
                                        <a class="nav-link" href="${myPostUrl}">MY POST</a>
                                    </li>
                                </div>
                                <c:url var="logoutUrl" value="DispatchController">
                                    <c:param name="btAction" value="Logout"/>
                                </c:url>
                                <li class="nav-item ">
                                    <a class="text-white text-decoration-none nav-link" href="${logoutUrl}">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                        <path fill-rule="evenodd" fill="white" d="M3 3.25c0-.966.784-1.75 1.75-1.75h5.5a.75.75 0 010 1.5h-5.5a.25.25 0 00-.25.25v17.5c0 .138.112.25.25.25h5.5a.75.75 0 010 1.5h-5.5A1.75 1.75 0 013 20.75V3.25zm16.006 9.5l-3.3 3.484a.75.75 0 001.088 1.032l4.5-4.75a.75.75 0 000-1.032l-4.5-4.75a.75.75 0 00-1.088 1.032l3.3 3.484H10.75a.75.75 0 000 1.5h8.256z"></path>
                                        </svg>
                                    </a>   
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
                <div class="main-container" style="position: relative;">
                    <div class="mx-auto col-md-8 my-3"> 
                        <a href="" class="btn btn-link w-100 mx-auto" data-toggle="modal" data-target="#postArticleModal" type="button">+ Post a new Article</a>
                        <!-- Modal -->
                        <div class="modal fade" id="postArticleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Post a new article</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <form action="PostNewArticleServlet" method="POST" enctype="multipart/form-data">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="title">Title:</label>
                                                <input type="text" class="form-control" id="title" name="txtTitle" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="description">Description:</label>
                                                <textarea class="form-control" id="description" rows="5" name="txtDescription"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="upload_file">Upload Image:</label>
                                                <div class="panel">
                                                    <div class="button_outer">
                                                        <div class="btn_upload">
                                                            <input type="file" id="upload_file" name="fileImage" accept="image/png, image/jpeg, image/gif" >
                                                            Upload Image
                                                        </div>
                                                        <div class="processing_bar"></div>
                                                        <div class="success_box"></div>
                                                    </div>
                                                </div>
                                                <div class="uploaded_file_view" id="uploaded_view">
                                                    <span class="file_remove">X</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" class="btn btn-color" name="btAction" value="Save article"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Error Alert -->
                    <c:if test="${not empty requestScope.DELETE_FAIL}">
                        <div class="alert alert-danger alert-dismissible fade show">
                            <strong>Error!</strong> ${requestScope.DELETE_FAIL}
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                    </c:if>

                    <!-- Success Alert -->
                    <c:if test="${not empty requestScope.DELETE_SUCCESS}">
                        <div class="alert alert-success alert-dismissible fade show">
                            <strong>Success!</strong> ${requestScope.DELETE_SUCCESS}
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                    </c:if>

                    <c:set var="searchValue" value="${param.txtSearchValue}"/>
                    <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
                    <c:if test="${not empty result}">
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <ul class="row list-group m-3" id="cardList">
                                <li class="m-1 w-100 list-group-item d-flex justify-content-center list-item-result" >
                                    <c:if test="${not empty dto.image}">
                                        <img class="float-left" style="width: 300px;" src="${dto.image}" alt="Card image cap">
                                    </c:if>                                    
                                    <div class="card-body float-left">
                                        <c:url var="detailUrl" value="DispatchController">
                                            <c:param name="btAction" value="Show details"/>
                                            <c:param name="txtPostID" value="${dto.postID}"/>
                                            <c:param name="searchValue" value="${requestScope.SEARCH_VALUE}"/>
                                            <c:param name="back" value="${requestScope.BACK_TO_MY_POST}"/>
                                            <c:param name="page" value="${requestScope.CURRENT_PAGE}"/>
                                        </c:url>
                                        <a href="${detailUrl}" class="text-title">
                                            <h5 class="card-title">${dto.title}</h5>
                                        </a>
                                        <p class="card-text text-description">${dto.description}</p>
                                        <p class="card-text"><small class="text-muted">${dto.date}</small></p>
                                    </div>
                                    <div class="float-left d-flex justify-content-between align-items-center">
                                        <button class="btn-garbage" type="submit"  data-toggle="modal" data-target="#deleteConfirmationModal${counter.count}">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </li>
                            </ul>
                            <div class="modal fade" id="deleteConfirmationModal${counter.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-center font-weight-bold">
                                            Do you want to delete this article? 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <c:url var="deletePostUrl" value="DispatchController">
                                                <c:param name="btAction" value="Delete"/>
                                                <c:param name="txtPostID" value="${dto.postID}"/>
                                            </c:url>
                                            <a href="${deletePostUrl}" class="btn btn-color" id="deleteBtn">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <nav class="pagination-container">
                            <ul class="pagination justify-content-center" >
                                <c:set var="curPage" value="${requestScope.CURRENT_PAGE}"/>
                                <c:set var="pages" value="${requestScope.NO_OF_PAGES}"/>
                                <c:if test="${curPage != 1}">
                                    <li class="pagination-item pagination-item-previous">
                                        <a class="pagination-link " href="ViewMyPostServlet?page=${curPage - 1}"><span>←</span>Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${1}" end="${pages}">
                                    <li class="pagination-item pagination-item-num">
                                        <a class="pagination-link ${i == curPage ? 'active' : ''} " href="ViewMyPostServlet?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${curPage lt pages}">
                                    <li class="pagination-item pagination-item-next">
                                        <a class="pagination-link" href="ViewMyPostServlet?page=${curPage + 1}">Next<span>→</span></a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </c:if>
                    <c:if test="${empty result}">
                        <p class="text-center">No article to show!</p>
                    </c:if>
                </div>
            </div>

        </c:if>
        <script>
            var btnUpload = $("#upload_file"),
                    btnOuter = $(".button_outer");
            btnUpload.on("change", function (e) {
                btnOuter.addClass("file_uploading");
                setTimeout(function () {
                    btnOuter.addClass("file_uploaded");
                }, 3000);
                var uploadedFile = URL.createObjectURL(e.target.files[0]);
                setTimeout(function () {
                    $("#uploaded_view").append('<img src="' + uploadedFile + '" />').addClass("show");
                }, 3500);
            });
            $(".file_remove").on("click", function (e) {
                $("#uploaded_view").removeClass("show");
                $("#uploaded_view").find("img").remove();
                btnOuter.removeClass("file_uploading");
                btnOuter.removeClass("file_uploaded");
            });
        </script>
        <!--Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
