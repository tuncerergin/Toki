<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kayıt Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <%@include file='../sidebar.jsp' %>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <c:choose>
                    <c:when test="${exist!=null}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            Bu Email adresini kullanamazsınız.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:when>
                    <c:when test="${success!=null}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Personel başarı ile kaydedildi, lütfen bekleyin...
                            <div class="spinner-border text-light" role="status">
                                <span class="sr-only">Bekleyin...</span>
                            </div>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <script>
                            setTimeout(function () {
                                window.location.href = "/admin/departman";
                            }, 2500);
                        </script>

                    </c:when>
                </c:choose>
            </div>
        </div>
        <div class="col-md-4 offset-md-4">
            <div class="card justify-content-center">
                <div class="card-header">
                    Personel Kayıt Formu
                </div>
                <div class="card-body">
                    <c:url var="personelKayitLink" value="/admin/personelKayit">
                        <c:param name="departmanId" value="${departmanId}"/>
                    </c:url>
                    <form:form action="${personelKayitLink}" modelAttribute="personel" method="post">
                        <div class="form-group">
                            <label for="ad">Adı</label>
                            <form:input type="input" placeholder="Adı" id="ad" path="ad" cssClass="form-control"
                                        value="${ad}"/>
                        </div>
                        <div class="form-group">
                            <label for="soyad">Soyadı</label>
                            <form:input type="input" placeholder="Soyadı" path="soyad" cssClass="form-control"
                                        value="${soyad}"/>
                        </div>
                        <div class="form-group">
                            <label for="tcKimlikNo">TC Kimlik No</label>
                            <form:input type="input" placeholder="TC Kimlik No" path="tcKimlikNo"
                                        cssClass="form-control"
                                        value="${tcKimlikNo}"/>
                        </div>
                        <div class="form-group">
                            <label for="dogumTarihi">Doğum Tarihi</label>
                            <form:input type="date" placeholder="Doğum Tarihi" path="dogumTarihi"
                                        cssClass="form-control"
                                        max="${now}"
                                        value="${dogumTarihi}"/>
                        </div>
                        <div class="form-group">
                            <label for="email">eMail</label>
                            <form:input type="email" placeholder="Email" path="email" cssClass="form-control"
                                        value="${email}"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Şifre</label>
                            <form:input type="password" placeholder="Şifre" path="password" cssClass="form-control"
                                        value="${password}"/>
                        </div>
                        <div class="form-group">
                            <label for="iseBaslamaTarihi">İşe Başlama Tarihi</label>
                            <form:input type="date" placeholder="İşe Başlama Tarihi" path="iseBaslamaTarihi"
                                        cssClass="form-control"
                                        value="${iseBaslamaTarihi}"/>
                        </div>
                        <div class="form-group">
                            <label for="gorevi">Görevi</label>
                            <form:input type="input" placeholder="Görevi" path="gorevi" cssClass="form-control"
                                        value="${gorevi}"/>
                        </div>
                        <div class="form-group mt-2">
                            <a href="${pageContext.request.contextPath}/admin/listPersons?departmanId=${departmanId}"
                               class="rounded btn btn-primary"><< Geri</a>
                            <input type="submit" value="Kaydet" class="btn btn-warning float-right">

                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>
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
</body>
</html>
