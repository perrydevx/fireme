<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Logout</a></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1>Applicant List</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--
            <f:table collection="${userList}" properties="['userEmail', 'firstName', 'lastName']"/> -->
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>email</th>
                        <th>Skill</th>
                        <th>Notice Period</th>
                        <th>Current Employment</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${userList}">
                        <tr>
                            <td><a href="/user/show/${it.id}">${it.firstName} ${it.lastName}</a></td>
                            <td>${it.userEmail}</td>
                            <td>${it.applicant.primarySkill}</td>
                            <td><strong>${it.applicant.noticePeriodDays}</strong> Days</td>
                            <td>${it.applicant.currentEmployment}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>