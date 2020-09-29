<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Dilekçe</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

</head>

<body>
<div class="container border" style=" width: 21cm;
        min-height: 29.7cm;
        padding: 2cm;
        margin: 1cm auto;">

    <div class="row  pb-5">
        <div class="col-md-12">
            <h4 style="text-align: center;">Personel İzin Belgesi</h4>
        </div>
    </div>
    <div class="row pt-5">
        <div class="col-md-6">

            <p>Adı Soyadı: ${personel.ad} ${personel.soyad}</p>
            <p>Görevi: ${personel.gorevi}</p>
            <p>İzin Gerekçesi: ${izin.gerekce}</p>
        </div>
        <div class="col-md-6">
            <p style="float: right;">Tarih: <%= (new java.util.Date()).toLocaleString()%>
            </p>
        </div>
    </div>

    <div class="row pt-5 pb-5">
        <div class="col-md-12">
            <p>${izin.izinBaslangicTarihi} tarihinden ${izin.izinBitisTarihi} tarihine kadar şahsıma ait izin
                verilmesini arz ederim.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"></div>
        <div class="col-md-4" style="text-align: center;">
            <p>Ad Soyad<br/> ${personel.ad} ${personel.soyad}
                <br/>İmza<br/><br/><br/></p>
        </div>
    </div>


    <div class="row">
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p><br/>Personelin izin talebi uygun görülmüştür.<br/><br/></p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <p style="text-align: center;">Personel
                Müdürü<br/>${personel.departman.amir.ad} ${personel.departman.amir.soyad}
                <br/>İmza<br/><br/><br/></p>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-4"></div>
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
