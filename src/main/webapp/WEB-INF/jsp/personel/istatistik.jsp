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
    <script type="text/javascript">
        function drawChart(chartID, kullanilanIzin, kalanIzin) {
            var options = {
                series: [kullanilanIzin, kalanIzin],
                chart: {
                    width: 200,
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
                            position: 'top'
                        }
                    }
                }]

            };

            var chart = new ApexCharts(document.getElementById(chartID), options);
            chart.render();
        }
    </script>
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

            <div class="row m-2 mb-4">
                <div class="col-md-4">
                    <div class="card shadow p-0">
                        <div class="card-header">
                            Yıllık izin
                        </div>
                        <div class="card-body">
                            <p class="card-text">Bu yılki ${izinTuruList.get(0).getIzinMiktari()} günlük yıllık
                                izninizden ${kullanilanYillikIzin} gün kullandınız.
                                Geriye ${izinTuruList.get(0).getIzinMiktari()-kullanilanYillikIzin} gün kullanılmamış
                                izniniz kaldı.</p>

                            <div id="yillikIzinChart"></div>
                            <script type="text/javascript">
                                drawChart('yillikIzinChart', ${kullanilanYillikIzin}, ${izinTuruList.get(0).getIzinMiktari()-kullanilanYillikIzin})</script>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow p-0">
                        <div class="card-header">
                            Rapor izni
                        </div>
                        <div class="card-body">
                            <p class="card-text">Bu yılki ${izinTuruList.get(1).getIzinMiktari()} günlük rapor
                                izninizden ${kullanilanRaporIzin} gün kullandınız.
                                Geriye ${izinTuruList.get(1).getIzinMiktari()-kullanilanRaporIzin} gün kullanılmamış
                                izniniz kaldı.</p>

                            <div id="raporIzinChart"></div>
                            <script type="text/javascript">
                                drawChart('raporIzinChart', ${kullanilanRaporIzin}, ${izinTuruList.get(1).getIzinMiktari()-kullanilanRaporIzin})</script>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow p-0">
                        <div class="card-header">
                            Mazeret izni
                        </div>
                        <div class="card-body">
                            <p class="card-text">Bu yılki ${izinTuruList.get(2).getIzinMiktari()} günlük mazeret
                                izninizden ${kullanilanMazeretIzin} gün kullandınız.
                                Geriye ${izinTuruList.get(2).getIzinMiktari()-kullanilanMazeretIzin} gün kullanılmamış
                                izniniz kaldı.</p>

                            <div id="mazeretIzinChart"></div>
                            <script type="text/javascript">
                                drawChart('mazeretIzinChart', ${kullanilanMazeretIzin}, ${izinTuruList.get(2).getIzinMiktari()-kullanilanMazeretIzin})</script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row shadow m-2">
                <div id="timeline" class="timeline"></div>
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
        series: [${jsonData}
        ],
        chart: {
            height: 350,
            type: 'rangeBar'
        },
        plotOptions: {
            bar: {
                horizontal: true,
                barHeight: '50%'
            }
        },
        xaxis: {
            type: 'datetime',
            min: new Date(new Date().getFullYear(), 0, 1).getTime(),
            max: new Date(new Date().getFullYear(), 11, 31).getTime(),
            labels: {
                datetimeFormatter: {
                    year: 'yyyy',
                    month: 'dd.MM.yyyy',
                    day: 'dd MM'
                }
            }

        },
        stroke: {
            width: 0
        },
        fill: {
            type: 'solid',
            opacity: 0.6
        },
        legend: {
            position: 'top',
            horizontalAlign: 'left'
        }
    };

    var chart = new ApexCharts(document.getElementById("timeline"), options);
    chart.render();
</script>
</body>
</html>
