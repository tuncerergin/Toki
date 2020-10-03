<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="../assets/css/dashboard.css">
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="sidebar-sticky pt-3">
        <ul class="nav  nav-tabs  flex-column">
            <security:authorize access="isAuthenticated()">
                <security:authentication property="principal.authorities" var="authorities"/>
                <c:choose>
                    <c:when test="${authorities=='[ROLE_PERSONEL]'}">
                        <li class="nav-item">
                            <a class="nav-link ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/personel/person")?"active":""}"
                               href="/personel/person">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z"></path>
                                    <path fill-rule="evenodd"
                                          d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path>
                                </svg>
                                Ana sayfa
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${izinKullanabilir?"/personel/izinTalep":'javascript: void(0);'}"
                               class="${!izinKullanabilir?'disabled':''} nav-link  ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/personel/izinTalep")?"active":""}">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-earmark-plus"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"></path>
                                </svg>
                                İzin talep et
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/personel/istatistik")?"active":""}"
                               href="/personel/istatistik">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <rect width="4" height="5" x="1" y="10" rx="1"></rect>
                                    <rect width="4" height="9" x="6" y="6" rx="1"></rect>
                                    <rect width="4" height="14" x="11" y="1" rx="1"></rect>
                                </svg>
                                İstatikler<span class="sr-only">(current)</span>
                            </a>
                        </li>
                    </c:when>
                    <c:when test="${authorities=='[ROLE_AMIR]'}"></c:when>
                    <c:when test="${authorities=='[ROLE_ADMIN]'}">
                        <li class="nav-item">
                            <a class="nav-link ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/admin/departman")?"active":""}"
                               href="/admin/departman">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-building"
                                     fill="currentColor"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"></path>
                                    <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"></path>
                                </svg>
                                Departmanlar
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/admin/addDepartman")?"active":""}"
                               href="/admin/addDepartman">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"></path>
                                </svg>
                                Departman Ekle
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#urlModal">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-right"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"></path>
                                </svg>
                                Personel Aktarımı
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${requestScope['javax.servlet.forward.request_uri'].toString().contains("/admin/istatistik")?"active":""}"
                               href="/admin/istatistik">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <rect width="4" height="5" x="1" y="10" rx="1"></rect>
                                    <rect width="4" height="9" x="6" y="6" rx="1"></rect>
                                    <rect width="4" height="14" x="11" y="1" rx="1"></rect>
                                </svg>
                                İstatiklers
                            </a>
                        </li>
                    </c:when>
                </c:choose>
            </security:authorize>


        </ul>
    </div>
</nav>
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">Mesaj</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Kapat"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    Mesaj: ${message}
                </div>
                <th:if test="${exception!=null}">
                    <div class="mb-3">
                        <code>${exception}</code>
                    </div>
                </th:if>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="urlModal" tabindex="-1" aria-labelledby="urlModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="label">Personel aktarımı</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Kapat"></button>
            </div>
            <form:form action="getData" method="POST" name="setUrl">
                <div class="modal-body">
                    <div class="mb-3">

                        Örnek veriyi
                        <a href="http://my-json-server.typicode.com/tuncerergin/Toki/personel"
                           target="_blank">buradan</a>
                        inceleyebilirsiniz.<br>
                        <label for="url" class="col-form-label">Data url:</label>
                        <input type="text" class="form-control" id="url" name="url">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                    <input type="submit" value="Aktarımı başlat" class="btn btn-primary" id="getData">
                </div>
            </form:form>
        </div>
    </div>
</div>

