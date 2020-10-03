<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
          integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <link rel="stylesheet" href="../assets/css/dashboard.css">

</head>
<body>
<%@include file='../header.jsp' %>
<div class="container-fluid">
    <div class="row">
        <%@include file='../sidebar.jsp' %>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="row">
                <table class="table table-striped text-center">
                    <tr class="p-3 mb-2 bg-primary text-white text-center">
                        <th>#</th>
                        <th>Gerekçe</th>
                        <th>İzin Türü</th>
                        <th>İzin Başlangıç Tarihi</th>
                        <th>İzin Bitiş Tarihi</th>
                        <th>Onay</th>
                        <th>Onay Tarihi</th>
                        <th>Amir</th>
                        <th>Action</th>
                    </tr>

                    <c:forEach var="izin" items="${izinler}" varStatus="status">
                        <tr>
                            <td> ${status.count} </td>
                            <td> ${izin.gerekce} </td>
                            <td> ${izin.izinTuru.izinTur} </td>
                            <td> ${izin.izinBaslangicTarihi} </td>
                            <td> ${izin.izinBitisTarihi} </td>
                            <td><c:choose>
                                <c:when test="${izin.onay=='e'}">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check2" fill="green"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
                                    </svg>
                                    Onaylandı</c:when>
                                <c:when test="${izin.onay=='h'}">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-circle" fill="red"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                                        <path fill-rule="evenodd"
                                              d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"></path>
                                    </svg>
                                    Reddedildi</c:when>
                                <c:when test="${izin.onay=='b'}">
                                    <div class="spinner-grow  text-primary spinner-grow-sm" role="status">
                                        <span class="sr-only">Onay Bekliyor...</span>
                                    </div>
                                    Onay Bekliyor</c:when>
                            </c:choose>
                            </td>
                            <td> ${izin.onaylanmaTarihi} </td>
                            <td> ${personel.departman.amir.ad} ${personel.departman.amir.soyad} </td>
                            <td>

                                <c:choose>
                                    <c:when test="${izin.onay=='b'}">
                                        <c:url var="updateLink" value="/personel/izinUpdate">
                                            <c:param name="izinId" value="${izin.id}"/>
                                        </c:url>
                                        <c:url var="deleteLink" value="/personel/izinDelete">
                                            <c:param name="izinId" value="${izin.id}"/>
                                        </c:url>
                                        <c:url var="yazdirLink" value="/personel/yazdir">
                                            <c:param name="izinId" value="${izin.id}"/>
                                        </c:url>

                                        <a href="${updateLink}" class="btn btn-warning btn-sm">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
                                            </svg>
                                            Güncelle</a>
                                        <a href="${deleteLink}" class="btn btn-danger  btn-sm m-1"
                                           onclick="if (!(confirm('Emin misiniz?'))) return false">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                                            </svg>
                                            Sil</a>
                                        <a href="${yazdirLink}" class="btn btn-success  btn-sm m-1">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-printer"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M11 2H5a1 1 0 0 0-1 1v2H3V3a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h-1V3a1 1 0 0 0-1-1zm3 4H2a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h1v1H2a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M11 9H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1zM5 8a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H5z"></path>
                                                <path d="M3 7.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"></path>
                                            </svg>
                                            Dilekçe görüntüle
                                        </a>

                                    </c:when>
                                    <c:otherwise>
                                        <a href='javascript: void(0);' class="btn btn-warning btn-sm disabled m-1"
                                           style="pointer-events: none;">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
                                            </svg>
                                            Güncelle</a>
                                        <a href='javascript: void(0);' class="btn btn-danger  btn-sm  disabled m-1"
                                           style="pointer-events: none;"
                                           onclick="if (!(confirm('Emin misiniz?'))) return false">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                                            </svg>
                                            Sil</a>
                                        <a href='javascript: void(0);' class="btn btn-success  btn-sm disabled m-1"
                                           style="pointer-events: none;">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-printer"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M11 2H5a1 1 0 0 0-1 1v2H3V3a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h-1V3a1 1 0 0 0-1-1zm3 4H2a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h1v1H2a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1z"></path>
                                                <path fill-rule="evenodd"
                                                      d="M11 9H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1zM5 8a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H5z"></path>
                                                <path d="M3 7.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"></path>
                                            </svg>
                                            Dilekçe görüntüle
                                        </a>

                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                </table>

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
