<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Cancel</a></li>
            </ul>
        </div>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1>Create Account</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='username'>Username<span class='required-indicator'>*</span></label>
                        <g:textField name="username" value="${user.username}" required="" maxlength="30"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='password'>Password<span class='required-indicator'>*</span></label>
                        <input type="text" name="password" value="" required="" maxlength="30" id="password" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='password'>Repeat Password<span class='required-indicator'>*</span></label>
                        <input type="text" name="password2" value="" required="" maxlength="30" id="password2" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='firstName'>First Name<span class='required-indicator'>*</span></label>
                        <g:textField name="firstName" value="${user.firstName}" required="" maxlength="30"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='lastName'>Last Name<span class='required-indicator'>*</span></label>
                        <g:textField name="lastName" value="${user.lastName}" required="" maxlength="30"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='userEmail'>Email<span class='required-indicator'>*</span></label>
                        <g:textField name="userEmail" value="${user.userEmail}" required="" maxlength="30"/>
                    </div>
                    <!--
                    <div class='fieldcontain'>
                        <label for='birthdate'>Birthdate</label>
                        <g:datePicker name="birthdate" value="${new Date()}" noSelection="['':'-Choose-']" precision="day"/>
                    </div>
                    -->
                    <div class='fieldcontain required'>
                        <label for='userType'>User Type<span class='required-indicator'>*</span></label>
                        <g:select name="userType" from="${['Applicant','Recruiter']}" value="${userType}"/>
                    </div>


                    <!-- RECRUITER FIELDS -->
                    <div class='fieldcontain'>
                        <label for='recruiter.orgName'>Organization Name</label>
                        <g:textField name="recruiter.orgName" value="${user.recruiter?.orgName}" maxlength="30"/>
                    </div>

                   <div class='fieldcontain required'>
                        <label for='recruiter.orgPhone'>Organization Phone<span class='required-indicator'>*</span></label>
                        <g:textField name="recruiter.orgPhone" value="${user.recruiter?.orgPhone}" required="" maxlength="30"/>
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
