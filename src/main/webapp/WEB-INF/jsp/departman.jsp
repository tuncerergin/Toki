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
    <div id="content">
        <h3 class="p-1 mb-1 bg-warning text-white text-center rounded">Departman Bilgileri</h3>
        <form:form action="saveDepartman" modelAttribute="departman" method="post">
            <form:hidden path="id"/>
            <div class="form-group">
                <label for="adi">Adı</label>
                <form:input path="adi" cssClass="form-control" id="${adi}"/>
            </div>
            <div class="form-group">
                <label for="amir">Amir</label>
                <form:select path="amir" cssClass="form-control">
                    <c:forEach var="amir" items="${amirList}">
                        <form:option value="${amir.id}" label="${amir.ad} ${amir.soyad}"/>
                    </c:forEach>
                </form:select>
            </div>
            <a href="${pageContext.request.contextPath}/admin/departman" class="rounded btn btn-primary"><< Geri</a>
            <input type="submit" value="Save" class="btn btn-warning float-right">
        </form:form>


    </div>
</div>
</body>
</html>
