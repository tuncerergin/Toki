<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

</head>
<body class="bg-light"
      style="background-image:url('assets/image/background.jpg');background-size: cover;background-repeat: no-repeat;background-attachment: fixed;">
<div class="container h-100 pt-4">

    <div class="row pt-4 ">

        <div class="col-md-4"></div>
        <div class="col-md-4 shadow m-4 p-4"
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
                <div class="row p-2">
                    <div class="col-md-12 form-group">
                        <label class="d-block">Kullanıcı adı: <input type="email" name="username"
                                                                     style="border-radius: 24px;"
                                                                     class="form-control"/> </label>
                    </div>
                </div>
                <div class="row p-2">
                    <div class="col-md-12 form-group">
                        <label class="d-block">Şifre: <input type="password" name="password"
                                                             style="border-radius: 24px;"
                                                             class="form-control"/></label>
                    </div>
                </div>
                <div class="row p-2">
                    <div class="col-md-12 form-group">
                        <input type="submit" class="btn btn-primary btn-block btn-login" style="border-radius: 24px;"
                               value="Giriş Yap">
                    </div>
                </div>
            </form:form></div>
        <div class="col-md-4"></div>

    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
        integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</body>
</html>
