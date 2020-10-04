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
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body class="text-muted bg-light">
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <%@include file='../sidebar.jsp' %>

    <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <div class="row m-2 mb-4">
            <div class="col">
                <div class="card rounded shadow-sm p-0">
                    <div class="card-header">
                        Departman İstatikleri
                    </div>
                    <div class="card-body">
                        <p class="card-text">Toplam ${toplamDepartmanSayisi} departman bulunmakta.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row m-2 mb-4">
            <div class="col">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Departman - Çalışan sayısı</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-pie pt-4">
                            <div class="chartjs-size-monitor" id="deaprtmanPersonelSayisi">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row m-2 mb-4">
            <div class="col">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Ortalama izin kullanım grafiği</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-pie pt-4">
                            <div class="chartjs-size-monitor" id="izinKullanımGrafiği">
                            </div>
                        </div>
                    </div>
                </div>
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
<script>

    var options = {
        series: [{
            name: 'Çalışan sayısı',
            data: ${sumPer}
        }],
        chart: {
            height: 350,
            type: 'bar'
        },

        plotOptions: {
            bar: {
                columnWidth: '45%',
                distributed: true
            }
        },
        dataLabels: {
            enabled: false
        },
        legend: {
            show: false
        },
        xaxis: {
            categories: ${dep},
            labels: {
                style: {
                    fontSize: '12px'
                }
            }
        },
        yaxis: {
            title: {
                text: 'Çalışan sayısı',
                style: {
                    fontSize: '12px',
                    fontFamily: 'Helvetica',
                    fontWeight: 400
                },
            },
            labels: {
                formatter: function (value) {
                    return value;
                }
            },
        }
    };
    var chart = new ApexCharts(document.getElementById("deaprtmanPersonelSayisi"), options);
    chart.render();


</script>
<script>
    var options = {
        series: [{
            name: 'Yıllık İzin',
            data: ${avgYillikIzin}
        }, {
            name: 'Rapor İzni',
            data: ${avgRaporIzni}
        }, {
            name: 'Mazeret İzni',
            data: ${avgMazeretIzni}
        }],
        chart: {
            type: 'bar',
            height: 350
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%'
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories:${departmanList},
        },
        yaxis: {
            title: {
                text: 'Ortalama izin kulanım miktarı',
                style: {
                    fontSize: '12px',
                    fontFamily: 'Helvetica',
                    fontWeight: 400
                }

            }, labels: {
                formatter: function (value) {
                    return value;
                }
            },
            min: 0,
            max: 30
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val
                }
            }
        }


    };

    var chart = new ApexCharts(document.getElementById("izinKullanımGrafiği"), options);
    chart.render();
</script>
</body>
</html>
