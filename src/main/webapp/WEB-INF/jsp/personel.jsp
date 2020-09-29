<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

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
