<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/dashboard.css">
    <script type="text/javascript">
        function confirm() {
            var izinBaslangicTarihi = document.getElementById("izinBaslangicTarihi").value;
            var izinBitisTarihi = document.getElementById("izinBitisTarihi").value;

            if ((new Date(izinBaslangicTarihi).getTime() >= new Date(izinBitisTarihi).getTime())) {
                alert("İzin başlangıç tarihi bitiş tarihinden büyük olamaz.");
                return false;
            }
            if (Math.floor((new Date(izinBitisTarihi) - new Date(izinBaslangicTarihi)) / (1000 * 3600 * 24)) >${kalanIzin}) {
                alert("Talep ettiğiniz izin miktarı kalan izin miktarınızdan fazla.");
                return false;
            }
        }</script>

</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav nav-tabs flex-column">

                    <li class="nav-item">
                        <a class="nav-link" href="/personel/person">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door-fill"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z"/>
                                <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                            </svg>
                            Ana sayfa
                        </a>
                    </li>
                    <li class="nav-item">
                        <c:url var="yeniIzinLink" value="/personel/izinTalep">
                            <c:param name="personelId" value="${personel.id}"/>
                        </c:url>
                        <a href="${kalanIzin>0 ? (izinKullanabilir?yeniIzinLink:'javascript: void(0);'):'javascript: void(0);'}"
                           class="${kalanIzin>0 ? (izinKullanabilir?'tex-decoration-none':'disabled') : 'disabled'} nav-link active"
                           style="${kalanIzin>0 ? 'pointer-events: auto;' : 'pointer-events: none; color:gray'}">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-earmark-plus"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
                                <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
                                <path fill-rule="evenodd"
                                      d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
                            </svg>
                            İzin talep et
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/personel/istatistik">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-fill"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <rect width="4" height="5" x="1" y="10" rx="1"/>
                                <rect width="4" height="9" x="6" y="6" rx="1"/>
                                <rect width="4" height="14" x="11" y="1" rx="1"/>
                            </svg>
                            İstatikler<span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <c:url var="izinKaydet" value="/personel/izinKaydet">
                <c:param name="personelId" value="${personel.id}"/>
            </c:url>
            <div class="col-md-4 offset-md-4">
                <div class="card justify-content-center">
                    <div class="card-header">
                        İzin Bilgileri
                    </div>
                    <div class="card-body">
                        <form:form action="${izinKaydet}" modelAttribute="izin" method="post">
                            <form:hidden path="id"/>
                            <div class="form-group">
                                <label for="izinTuru">İzin Türü</label>
                                <form:select path="izinTuru" cssClass="form-control">
                                    <c:forEach var="izinTuru" items="${izinTuruList}">
                                        <form:option value="${izinTuru.id}" label="${izinTuru.izinTur}"/>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="izinBaslangicTarihi">İzin Başlangıç Tarihi</label>
                                <form:input type="date" id="izinBaslangicTarihi" path="izinBaslangicTarihi"
                                            cssClass="form-control"
                                            min='${minIzınBaslangic}' max='${maxIzinBaslangic}'
                                            value="${izinBaslangicTarihi}"/>
                            </div>
                            <div class="form-group">
                                <label for="izinBitisTarihi">İzin Bitiş Tarihi</label>
                                <form:input type="date" path="izinBitisTarihi" cssClass="form-control"
                                            id="izinBitisTarihi"
                                            min='${minIzınBaslangic}' value="${izinBitisTarihi}"/>
                            </div>


                            <div class="form-group">
                                <label for="gerekce">İzin Gerekçesi</label>
                                <form:input path="gerekce" cssClass="form-control" id="gerekce"/>
                            </div>
                            <input type="submit" value="Save" class="btn btn-warning float-right"
                                   onClick="return confirm();">

                        </form:form></div>
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
