<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div id="content">
        <form:form action="${pageContext.request.contextPath}/login"
                   method="POST">
            <input type="submit" value="Logout" class="btn btn-primary" style="float: right"/>
        </form:form>
        <h3 class="p-1 mb-1 bg-warning text-white text-center rounded">Personel Bilgileri</h3>
        <c:url var="savePersonel" value="/admin/savePersonel">
            <c:param name="departmanId" value="${departman.id==null?personel.departman.id:departman.id}"/>
        </c:url>

        <form:form action="${savePersonel}" modelAttribute="personel" method="post">
            <form:hidden path="id"/>
            <form:hidden path="email"/>
            <form:hidden path="password"/>
            <form:hidden path="departman"/>
            <form:hidden path="role"/>
            <div class="form-group">
                <label for="ad">Adı</label>
                <form:input path="ad" cssClass="form-control" id="ad"/>
            </div>
            <div class="form-group">
                <label for="soyad">Soyad</label>
                <form:input path="soyad" cssClass="form-control" id="soyad"/>
            </div>
            <div class="form-group">
                <label for="tcKimlikNo">TC Kimlik No</label>
                <form:input path="tcKimlikNo" cssClass="form-control" id="tcKimlikNo"/>
            </div>
            <div class="form-group">
                <label for="dogumTarihi">Doğum Tarihi</label>
                <form:input type="date" path="dogumTarihi" cssClass="form-control" value="${dogumTarihi}" max="${now}"/>
            </div>
            <div class="form-group">
                <label for="iseBaslamaTarihi">İşe Başlama Tarihi</label>
                <form:input type="date" path="iseBaslamaTarihi" cssClass="form-control" value="${iseBaslamaTarihi}"/>
            </div>
            <div class="form-group">
                <label for="gorevi">Görevi</label>
                <form:input type="input" placeholder="Görevi" path="gorevi" cssClass="form-control"
                            value="${gorevi}"/>
            </div>
            <a href="${pageContext.request.contextPath}/admin/listPersons?departmanId=${personel.departman.id}"
               class="rounded btn btn-primary"><< Geri</a>

            <input type="submit" value="Kaydet" class="btn btn-warning float-right">

        </form:form>


    </div>
</div>
</body>
</html>
