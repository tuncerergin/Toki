<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>İstatistik</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <link rel="stylesheet" href="../assets/css/dashboard.css">

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
                           class="${kalanIzin>0 ? (izinKullanabilir?'tex-decoration-none':'disabled') : 'disabled'} nav-link"
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
                        <a class="nav-link active" href="/personel/istatistik">
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

            <div class="row shadow m-1">
                <div class="col-md-8 align-middle text-center">
                    Merhaba ${personel.ad} ${personel.soyad}
                    <br>
                    Bu yılki 21 günlük izninizden ${kullanilanIzin} gün kullandınız. Geriye ${kalanIzin} gün
                    kullanılmamış
                    izniniz
                    kaldı.
                    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                    <lottie-player class="mx-auto" src="https://assets2.lottiefiles.com/private_files/lf30_kBx3K1.json"
                                   background="transparent" speed="1" style="width: 300px; height: 150px;" loop
                                   autoplay></lottie-player>
                </div>
                <div class="col-md-4">
                    <div id="chart" class="w-25"></div>
                </div>
            </div>

        </main>
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
<script type="text/javascript">
    var options = {
        series: [${kullanilanIzin}, ${kalanIzin}],
        chart: {
            width: 280,
            type: 'donut',
        },
        labels: ["Kullanılan İzin", "Kalan İzin"],
        dataLabels: {
            enabled: false
        },
        legend: {
            position: 'bottom',
            horizontalAlign: 'center'
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]

    };

    var chart = new ApexCharts(document.getElementById('chart'), options);
    chart.render();


</script>
</body>
</html>
