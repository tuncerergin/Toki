<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow mb-2">
    <span class="navbar-brand col-md-3 col-lg-2 mr-0 px-3">
        <security:authorize access="isAuthenticated()">
            <security:authentication property="principal.authorities" var="authorities"/>
            <c:choose>
                <c:when test="${authorities=='[ROLE_PERSONEL]'}">Personel </c:when>
                <c:when test="${authorities=='[ROLE_AMIR]'}">Amir </c:when>
                <c:when test="${authorities=='[ROLE_ADMIN]'}">Admin </c:when>
            </c:choose>
            Sayfası
        </security:authorize>
    </span>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
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
        </li>
    </ul>
</nav>

