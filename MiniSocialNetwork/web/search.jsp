<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : search
    Created on : Sep 17, 2020, 4:34:04 PM
    Author     : PhuongPT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
                    <div class="row">
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
                    <div class="row">
                        <form class="mx-auto col-md-8 my-3" action="DispatchController">
                            <div class="form-group row d-flex justify-content-center">
                                <input type="text" class="form-control col-md-8" 
                                       name="txtSearchValue" placeholder="Search..." 
                                       value="${param.txtSearchValue}">
                                <button class="btn ml-2 btn-search my-auto" type="submit" value="Search" name="btAction" >
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16">
                                    <path fill-rule="evenodd" d="M11.5 7a4.499 4.499 0 11-8.998 0A4.499 4.499 0 0111.5 7zm-.82 4.74a6 6 0 111.06-1.06l3.04 3.04a.75.75 0 11-1.06 1.06l-3.04-3.04z"></path>
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </div>            
                </div>

                <div class="main-container">
                    <c:set var="searchValue" value="${param.txtSearchValue}"/>
                    <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
                    <c:if test="${not empty result}">
                        <ul class="row list-group m-3" id="cardList">
                            <c:forEach var="dto" items="${result}" varStatus="counter">
                                <li class="m-1 w-100 list-group-item d-flex justify-content-center list-item-result">
                                    <c:if test="${not empty dto.image}">
                                        <img class="float-left" style="width: 300px;" src="${dto.image}" alt="Card image cap">
                                    </c:if>
                                    <div class="card-body float-left">
                                        <c:url var="detailUrl" value="DispatchController">
                                            <c:param name="btAction" value="Show details"/>
                                            <c:param name="txtPostID" value="${dto.postID}"/>
                                            <c:param name="back" value="${requestScope.BACK_TO_MY_POST}"/>
                                            <c:param name="txtSearchValue" value="${param.txtSearchValue}"/>
                                            <c:param name="page" value="${requestScope.CURRENT_PAGE}"/>
                                        </c:url>
                                        <a href="${detailUrl}" class="text-title">
                                            <h5 class="card-title">${dto.title}</h5>
                                        </a>
                                        <p class="card-text text-description">${dto.description}</p>
                                        <p class="card-text"><small class="text-muted">${dto.date}</small></p>


                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <nav class="pagination-container">
                            <ul class="pagination justify-content-center" id="pagination">
                                <c:set var="curPage" value="${requestScope.CURRENT_PAGE}"/>
                                <c:set var="pages" value="${requestScope.NO_OF_PAGES}"/>
                                <c:if test="${curPage != 1}">
                                    <li class="pagination-item pagination-item-previous">
                                        <a class="pagination-link " href="SearchArticleServlet?page=${curPage - 1}&txtSearchValue=${param.txtSearchValue}"><span>←</span>Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${1}" end="${pages}">
                                    <li class="pagination-item pagination-item-num">
                                        <a class="pagination-link ${i == curPage ? 'active' : ''} " href="SearchArticleServlet?page=${i}&txtSearchValue=${param.txtSearchValue}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${curPage lt pages}">
                                    <li class="pagination-item pagination-item-next">
                                        <a class="pagination-link" href="SearchArticleServlet?page=${curPage + 1}&txtSearchValue=${param.txtSearchValue}">Next<span>→</span></a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </c:if>
                    <c:if test="${empty result}">
                        <c:if test="${not empty param.txtSearchValue}">
                            <p class="text-center">We could not find anything for "${param.txtSearchValue}".</p>
                        </c:if>
                        <c:if test="${empty param.txtSearchValue}">
                            <p class="text-center">No article to show!</p>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </c:if>

        <!--Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>

</html>
