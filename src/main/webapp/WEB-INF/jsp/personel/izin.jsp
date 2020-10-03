<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>İzin talep</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/dashboard.css">
    <script type="text/javascript">
        function confirm() {
            var izinBaslangicTarihi = document.getElementById("izinBaslangicTarihi").value;
            var izinBitisTarihi = document.getElementById("izinBitisTarihi").value;
            var izinTuru = document.getElementById("izinTuru").value;
            if (izinTuru == 1) {
                if (Math.floor((new Date(izinBitisTarihi) - new Date(izinBaslangicTarihi)) / (1000 * 3600 * 24)) >${izinTuruList.get(0).getIzinMiktari()-kullanilanYillikIzin}) {
                    alert("Talep ettiğiniz yıllık izin miktarı kalan izin miktarınızdan fazla.");
                    return false;
                }
            } else if (izinTuru == 2) {
                if (Math.floor((new Date(izinBitisTarihi) - new Date(izinBaslangicTarihi)) / (1000 * 3600 * 24)) >${izinTuruList.get(1).getIzinMiktari()-kullanilanRaporIzin}) {
                    alert("Talep ettiğiniz rapor izin miktarı kalan izin miktarınızdan fazla.");
                    return false;
                }
            } else if (izinTuru == 3) {
                if (Math.floor((new Date(izinBitisTarihi) - new Date(izinBaslangicTarihi)) / (1000 * 3600 * 24)) >${izinTuruList.get(2).getIzinMiktari()-kullanilanMazeretIzin}) {
                    alert("Talep ettiğiniz mazeret izin miktarı kalan izin miktarınızdan fazla.");
                    return false;
                }
            }

            if ((new Date(izinBaslangicTarihi).getTime() >= new Date(izinBitisTarihi).getTime())) {
                alert("İzin başlangıç tarihi bitiş tarihinden büyük olamaz.");
                return false;
            }


        }</script>

</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <div class="row">
        <%@include file='../sidebar.jsp' %>
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
                            <div class="form-group mt-2">
                                <label for="izinTuru">İzin Türü</label>

                                <form:select path="izinTuru" id="izinTuru" cssClass="form-control"
                                             style="border-radius: 24px;">
                                    <option value="none" selected disabled hidden>
                                        İzin türü seçiniz...
                                    </option>
                                    <c:forEach var="izinTuru" items="${izinTuruList}">

                                        <form:option value="${izinTuru.id}" label="${izinTuru.izinTur}"/>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group mt-2">
                                <label for="izinBaslangicTarihi">İzin Başlangıç Tarihi</label>
                                <form:input type="date" id="izinBaslangicTarihi" path="izinBaslangicTarihi"
                                            style="border-radius: 24px;"
                                            cssClass="form-control"
                                            min='${minIzinBaslangic}'
                                            max='${maxIzinBaslangic}'
                                            value="${izinBaslangicTarihi}"/>
                            </div>
                            <div class="form-group mt-2">
                                <label for="izinBitisTarihi">İzin Bitiş Tarihi</label>
                                <form:input type="date" path="izinBitisTarihi" cssClass="form-control"
                                            style="border-radius: 24px;"
                                            id="izinBitisTarihi"
                                            min='${minIzinBaslangic}' value="${izinBitisTarihi}"/>
                            </div>


                            <div class="form-group mt-2">
                                <label for="gerekce">İzin Gerekçesi</label>
                                <form:input type="text" path="gerekce" cssClass="form-control"
                                            style="border-radius: 24px;" id="gerekce"/>
                            </div>
                            <input type="submit" value="Kaydet" class="btn btn-warning float-right mt-2"
                                   style="border-radius: 24px;"
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
