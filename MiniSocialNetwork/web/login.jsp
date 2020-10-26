<%-- 
    Document   : login
    Created on : Sep 17, 2020, 1:13:44 AM
    Author     : PhuongPT 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <style>
            <%@include file="css/style.css"%>
        </style>
    </head>
    <body>
        <div class="container-fluid h-100 container-bg">
            <div class="row justify-content-center h-100 ">
                <div class="my-auto card-form"  id="login">
                    <form class="m-auto w-100" action="DispatchController" method="POST">
                        <span class="text-center font-weight-bold card-form-title">Login</span>
                        <div class="form-group wrap-input">
                            <input type="text" class="card-input" id="email" name="txtEmail"value="">
                            <span class="focus-input" data-placeholder="Email"></span>
                        </div>
                        <div class="form-group wrap-input">
                            <input type="password" class="card-input" id="password" name="txtPassword">
                            <span class="focus-input" data-placeholder="Password"></span>
                        </div>
                        <c:set var="invalid" value="${requestScope.INVALID}" />
                        <c:if test="${not empty invalid}">
                            <div class="alert alert-danger d-flex justify-content-center" role="alert">
                                <small>${invalid}</small>
                            </div>
                        </c:if>
                        <div class="text-center my-3">
                            <div class="wrap-login-form-btn mb-3">
                                <div class="bgbtn-login"></div>
                                <input class="btn btn-login" type="submit" value="Login" name="btAction" /> 
                            </div>

                            <input class="btn btn-reset wrap-login-form-btn" type="reset" value="Reset" />
                        </div>
                    </form>
                    <div class="text-center pt-10">
                        Dont' have an account? 
                        <a class="text-primary register-link font-weight-bold" href="createNewAccount.jsp"> Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('.card-input').each(function () {
                $(this).on('blur', function () {
                    if ($(this).val().trim() != "") {
                        $(this).addClass('has-val');
                    } else {
                        $(this).removeClass('has-val');
                    }
                })
            })
        </script>
        <!--Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
