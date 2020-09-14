<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Dilekçe</title>
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
</div>
</body>

</html>
