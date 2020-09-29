<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

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
<div class="container-fluid">
    <div class="header">
        <div class="row text-center bg-success text-white align-items-center">
            <div class="col"><h2 class=" p-2">Personel page</h2></div>
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

    <div class="row justify-content-md-center mb-4 p-4 shadow" style="    text-align: center;">
        Merhaba ${personel.ad} ${personel.soyad}
        <br>
        Bu yılki 21 günlük izninizden ${kullanilanIzin} gün kullandınız. Geriye ${kalanIzin} gün kullanılmamış izniniz
        kaldı.
    </div>
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
                                    min='${minIzınBaslangic}' max='${maxIzinBaslangic}' value="${izinBaslangicTarihi}"/>
                    </div>
                    <div class="form-group">
                        <label for="izinBitisTarihi">İzin Bitiş Tarihi</label>
                        <form:input type="date" path="izinBitisTarihi" cssClass="form-control" id="izinBitisTarihi"
                                    min='${minIzınBaslangic}' value="${izinBitisTarihi}"/>
                    </div>


                    <div class="form-group">
                        <label for="gerekce">İzin Gerekçesi</label>
                        <form:input path="gerekce" cssClass="form-control" id="gerekce"/>
                    </div>
                    <input type="submit" value="Save" class="btn btn-warning float-right" onClick="return confirm();">

                </form:form></div>
        </div>

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
