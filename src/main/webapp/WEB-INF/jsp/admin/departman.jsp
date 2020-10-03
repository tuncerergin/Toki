<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Departman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <main class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav  nav-tabs  flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/departman">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-building" fill="currentColor"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"></path>
                                <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"></path>
                            </svg>
                            Departmanlar
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/addDepartman">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                                <path fill-rule="evenodd"
                                      d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"></path>
                            </svg>
                            Departman Ekle
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#urlModal">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-right"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"></path>
                            </svg>
                            Personel Aktarımı
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/istatistik">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-fill"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <rect width="4" height="5" x="1" y="10" rx="1"></rect>
                                <rect width="4" height="9" x="6" y="6" rx="1"></rect>
                                <rect width="4" height="14" x="11" y="1" rx="1"></rect>
                            </svg>
                            İstatikler
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
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
                                <a href="${pageContext.request.contextPath}/admin/departman"
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
