<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2 class="text-center p-3 mb-2 bg-success text-white">Admin page</h2>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-2 pb-3">
            <a href="/admin/departman" class="btn btn-outline-warning"><< Departmanlar</a>
        </div>
        <div class="col-md-8"></div>
        <div class="col-md-2">
            <form:form action="${pageContext.request.contextPath}/login" method="POST">
                <input type="submit" value="Logout" class="btn btn-primary" style="float: right"/>
            </form:form>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <c:url var="updateDepartmanLink" value="/admin/updateDepartman">
            <c:param name="departmanId" value="${departman.id}"/>
        </c:url>
        <div class="card text-center w-100">
            <div class="card-header">
                ${departman.adi} Departmanı
            </div>
            <div class="card-body">
                <h5 class="card-title">Amir: ${departman.amir.ad} ${departman.amir.soyad}</h5>
                <a href="${updateDepartmanLink}" class="btn btn-outline-success">Güncelle</a>
            </div>
        </div>
    </div>

    <div class="row">
        <table class="table table-striped text-center">
            <tr class="p-3 mb-2 bg-primary text-white text-center">
                <th>Adı</th>
                <th>Soyadı</th>
                <th>TC Kimlik No</th>
                <th>Doğum Tarihi</th>
                <th>İşe Başlama Tarihi</th>
                <th>Action</th>
            </tr>
            <c:forEach var="tmpPerson" items="${persons}">
                <c:url var="updateLink" value="/admin/personelupdate">
                    <c:param name="personelId" value="${tmpPerson.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/admin/personeldelete">
                    <c:param name="personelId" value="${tmpPerson.id}"/>
                    <c:param name="departmanId" value="${departman.id}"/>
                </c:url>

                <a href="${listPersons}">
                    <tr>
                        <td> ${tmpPerson.ad} </td>
                        <td> ${tmpPerson.soyad} </td>
                        <td> ${tmpPerson.tcKimlikNo} </td>
                        <td> ${tmpPerson.dogumTarihi} </td>
                        <td> ${tmpPerson.iseBaslamaTarihi} </td>
                        <td><a href="${updateLink}">Güncelle</a> | <a href="${deleteLink}"
                                                                      onclick="if (!(confirm('Emin misiniz?'))) return false">Sil</a>
                        </td>
                    </tr>

                </a>
            </c:forEach>

        </table>
        <c:url var="addPersonelLink" value="/admin/personelKayit">
            <c:param name="departmanId" value="${departman.id}"/>
        </c:url>
        <a href="${addPersonelLink}" class="col text-center rounded p-3 my-3 shadow-sm border text-decoration-none">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                <path fill-rule="evenodd"
                      d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"></path>
            </svg>
            <br>
            Yeni Personel Ekle
        </a>
    </div>
</div>
</body>
</html>
