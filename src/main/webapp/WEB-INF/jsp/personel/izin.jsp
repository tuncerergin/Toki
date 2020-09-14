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
<div id="wrapper">
    <div id="header">
        <h2 class="text-center p-3 mb-2 bg-success text-white">Personel page</h2>
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
</body>
</html>
