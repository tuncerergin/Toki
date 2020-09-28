<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
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
    <div class="row shadow m-1">
        <c:choose>
            <c:when test="${message!=null}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        ${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:when>
        </c:choose>
        <div class="col-md-8 align-middle text-center">
            Merhaba ${personel.ad} ${personel.soyad}
            <br>
            Bu yılki 21 günlük izninizden ${kullanilanIzin} gün kullandınız. Geriye ${kalanIzin} gün kullanılmamış
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
    <div class="row">
        <table class="table table-striped text-center">
            <tr class="p-3 mb-2 bg-primary text-white text-center">
                <th>#</th>
                <th>Gerekçe</th>
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

                                <a href="${updateLink}" class="badge badge-warning m-1">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
                                        <path fill-rule="evenodd"
                                              d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
                                    </svg>
                                    Güncelle</a>|

                                <a href="${deleteLink}" class="badge badge-danger  m-1"
                                   onclick="if (!(confirm('Emin misiniz?'))) return false">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                                    </svg>
                                    Sil</a>|
                                <a href="${yazdirLink}" class="badge badge-success m-1">
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
                                <a href='javascript: void(0);' class="badge badge-secondary disabled m-1"
                                   style="pointer-events: none;">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
                                        <path fill-rule="evenodd"
                                              d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
                                    </svg>
                                    Güncelle</a>|
                                <a href='javascript: void(0);' class="badge badge-secondary disabled m-1"
                                   style="pointer-events: none;"
                                   onclick="if (!(confirm('Emin misiniz?'))) return false">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                                    </svg>
                                    Sil</a>|
                                <a href='javascript: void(0);' class="badge badge-secondary disabled m-1"
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
        <c:url var="yeniIzinLink" value="/personel/izinTalep">
            <c:param name="personelId" value="${personel.id}"/>
        </c:url>
        <a href="${kalanIzin>0 ? (izinKullanabilir?yeniIzinLink:'javascript: void(0);'):'javascript: void(0);'}"
           class="${kalanIzin>0 ? (izinKullanabilir?'tex-decoration-none':'disabled') : 'disabled'} col text-center rounded p-3 my-3 shadow-sm border"
           style="${kalanIzin>0 ? 'pointer-events: auto;' : 'pointer-events: none; color:gray'}">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                <path fill-rule="evenodd"
                      d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"></path>
            </svg>
            <br>
            İzin talep et
        </a>
    </div>
</div>
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
