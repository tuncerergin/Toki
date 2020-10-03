<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Departman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <main class="row">
        <%@include file='../sidebar.jsp' %>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="col-md-4 offset-md-4">
                <div class="card justify-content-center">
                    <div class="card-header">
                        Departman Bilgileri
                    </div>
                    <div class="card-body">
                        <form:form action="saveDepartman" modelAttribute="departman" method="post">
                            <form:hidden path="id"/>
                            <div class="form-group mt-2">
                                <label for="adi">Departman Adı</label>
                                <form:input path="adi" cssClass="form-control" id="${adi}"/>
                            </div>
                            <th:if test="${amirList!=null}">
                                <div class="form-group mt-2">
                                    <label for="amir">Amir</label>
                                    <form:select path="amir" cssClass="form-control">
                                        <c:forEach var="amir" items="${amirList}">
                                            <form:option value="${amir.id}" label="${amir.ad} ${amir.soyad}"/>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </th:if>
                            <div class="form-group mt-2">

                                <a href="${pageContext.request.contextPath}/admin/listPersons?departmanId=${departman.id}"
                                   class="rounded btn btn-primary"><< Geri</a>
                                <input type="submit" value="Kaydet" class="btn btn-warning float-right">
                            </div>
                        </form:form></div>
                </div>

            </div>
        </main>
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
