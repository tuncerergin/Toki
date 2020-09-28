<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</head>
<body class="bg-light"
      style="background-image:url('assets/image/background.jpg');background-size: cover;background-repeat: no-repeat;background-attachment: fixed;">
<div class="container h-100 pt-4">

    <div class="row pt-4 ">

        <div class="col-md-4"></div>
        <div class="col-md-4 shadow m-4"
             style="backdrop-filter: blur(20px); background-color: rgba(255,255,255,.3); border-radius: 8px !important;">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 mt-4 mb-4">
                    <lottie-player
                            src="https://assets8.lottiefiles.com/datafiles/XRVoUu3IX4sGWtiC3MPpFnJvZNq7lVWDCa8LSqgS/profile.json"
                            background="transparent" speed="1" style="width: 150px; height: 150px;" loop
                            autoplay></lottie-player>
                </div>
                <div class="col-md-3"></div>

            </div>
            <c:choose>
                <c:when test="${param.error!=null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Kullanıcı adı veya şifre yanlış.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:when>
                <c:when test="${param.logout!=null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Çıkış yapıldı.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:when>
            </c:choose>
            <form:form action="/login" method="POST">
                <div class="row">
                    <div class="col-md-12 form-group">
                        <label class="d-block">Kullanıcı adı: <input type="email" name="username"
                                                                     style="border-radius: 24px;"
                                                                     class="form-control"/> </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 form-group">
                        <label class="d-block">Şifre: <input type="password" name="password"
                                                             style="border-radius: 24px;"
                                                             class="form-control"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 form-group">
                        <input type="submit" class="btn btn-primary btn-block btn-login" style="border-radius: 24px;"
                               value="Giriş Yap">
                    </div>
                </div>
            </form:form></div>
        <div class="col-md-4"></div>

    </div>
</div>


</body>
</html>
