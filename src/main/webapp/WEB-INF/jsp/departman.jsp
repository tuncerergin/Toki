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
<div class="container-fluid">
    <div class="header">
        <div class="row text-center bg-success text-white align-items-center">
            <div class="col"><h2 class=" p-2">Admin page</h2></div>
            <div class="col--md-auto">
                <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                    <button type="submit" class="btn btn-danger" style="float: right">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-left"
                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"></path>
                            <path fill-rule="evenodd"
                                  d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"></path>
                        </svg>
                        Çıkış Yap
                    </button>
                </form:form>
            </div>
        </div>
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
