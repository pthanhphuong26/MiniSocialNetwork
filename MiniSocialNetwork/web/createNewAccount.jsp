<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createNewAccount
    Created on : Sep 18, 2020, 1:38:18 PM
    Author     : PhuongPT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <style>
            <%@include file="css/style.css"%>
        </style>
    <body>
        <div class="container-fluid h-100 container-bg">
            <div class="row justify-content-center h-100">
                <form class="m-auto card-form" id="signup" action="DispatchController" method="POST">
                    <div class="text-center font-weight-bold card-form-title">Sign Up</div>
                    <c:set var="createErr" value="${requestScope.CREATE_ERROR}"/>
                    <div class="form-group  wrap-input">
                        <input type="text" class="card-input" id="email" name="txtEmail" value="">
                        <span class="focus-input" data-placeholder="Email"></span>
                    </div>
                    <c:if test="${not empty createErr.emailWrongFormatErr}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.emailWrongFormatErr}</small>
                        </div>
                    </c:if>
                    <c:if test="${not empty createErr.emailLengthErr}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.emailLengthErr}</small>
                        </div>
                    </c:if>
                    <c:if test="${not empty createErr.emailIsExisted}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.emailIsExisted}</small>
                        </div>
                    </c:if>

                    <div class="form-group  wrap-input">
                        <input type="password" class="card-input" id="password" name="txtPassword">
                        <span class="focus-input" data-placeholder="Password"></span>

                    </div>

                    <c:if test="${not empty createErr.passwordLengthErr}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.passwordLengthErr}</small>
                        </div>
                    </c:if>

                    <div class="form-group  wrap-input">
                        <input type="password" class="card-input" id="confirm" name="txtConfirm">
                        <span class="focus-input" data-placeholder="Confirm"></span>
                    </div>

                    <c:if test="${not empty createErr.confirmNotMatched}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.confirmNotMatched}</small>
                        </div>
                    </c:if>

                    <div class="form-group  wrap-input">
                        <input type="text" class="card-input" id="fullname" name="txtName" value="">
                        <span class="focus-input" data-placeholder="Full name"></span>
                    </div>

                    <c:if test="${not empty createErr.fullNameLengthErr}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.fullNameLengthErr}</small>
                        </div>
                    </c:if>
                    <c:if test="${not empty createErr.emptyInputErr}">
                        <div class="alert alert-danger d-flex justify-content-center" role="alert">
                            <small>${createErr.emptyInputErr}</small>
                        </div>
                    </c:if>

                    <div class="text-center my-3">
                        <div class="wrap-login-form-btn mb-3">
                            <div class="bgbtn-login"></div>
                            <input class="btn btn-login" type="submit" value="Sign Up" name="btAction" /> 
                        </div>

                        <input class="btn btn-reset wrap-login-form-btn" type="reset" value="Reset" />
                    </div>
                    </br>

                    <div class="text-center pt-10">
                        Have an account?
                        <a class="text-primary register-link font-weight-bold" href="login.jsp"> Back to Login</a>
                    </div>
                </form>
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
