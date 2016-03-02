<!doctype html>
<html xmlns:g="http://www.w3.org/1999/html">
    <head>
        <meta name="layout" content="main"/>
        <title>Welcome to FireMe</title>
        <style type="text/css" media="screen">
            #status {
                background-color: #eee;
                border: .2em solid #fff;
                margin: 2em 2em 1em;
                padding: 1em;
                width: 12em;
                float: left;
                -moz-box-shadow: 0px 0px 1.25em #ccc;
                -webkit-box-shadow: 0px 0px 1.25em #ccc;
                box-shadow: 0px 0px 1.25em #ccc;
                -moz-border-radius: 0.6em;
                -webkit-border-radius: 0.6em;
                border-radius: 0.6em;
            }

            #status ul {
                font-size: 0.9em;
                list-style-type: none;
                margin-bottom: 0.6em;
                padding: 0;
            }

            #status li {
                line-height: 1.3;
            }

            #status h1 {
                text-transform: uppercase;
                font-size: 1.1em;
                margin: 0 0 0.3em;
            }

            #page-body {
                margin: 2em 1em 1.25em 18em;
            }

            h2 {
                margin-top: 1em;
                margin-bottom: 0.3em;
                font-size: 1em;
            }

            p {
                line-height: 1.5;
                margin: 0.25em 0;
            }

            #controller-list ul {
                list-style-position: inside;
            }

            #controller-list li {
                line-height: 1.3;
                list-style-position: inside;
                margin: 0.25em 0;
            }

            @media screen and (max-width: 480px) {
                #status {
                    display: none;
                }

                #page-body {
                    margin: 0 1em 1em;
                }

                #page-body h1 {
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>
        <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="status" role="complementary">
            <h1>Application Status</h1>
            <ul>
                <li>Environment: ${grails.util.Environment.current.name}</li>
                <li>App profile: ${grailsApplication.config.grails?.profile}</li>
                <li>App version: <g:meta name="info.app.version"/></li>
                <li>Grails version: <g:meta name="info.app.grailsVersion"/></li>
                <li>Groovy version: ${GroovySystem.getVersion()}</li>
                <li>JVM version: ${System.getProperty('java.version')}</li>
                <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
            </ul>
            <h1>Artefacts</h1>
            <ul>
                <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
            </ul>
            <h1>Developers</h1>
            <ul>
                <li>Anit</li>
                <li>Hari</li>
                <li>Laxman</li>
                <li>Perry</li>
            </ul>
            <!--
            <h1>Installed Plugins</h1>
            <ul>
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li>${plugin.name} - ${plugin.version}</li>
                </g:each>
            </ul>
            -->
        </div>
        <div id="page-body" role="main">
            <h1>Welcome to FireMe!</h1>
            <p>This is the base application for fireme.com v0.1. At the moment this is the default page, feel free to modify it to either redirect to a controller or display whatever
               content you may choose. Below is a mock page for signing in the application:</p>
        </div>

        <g:form>
            <fieldset class="form">
                <div class='fieldcontain required'>
                    <label for='username'>Username</label>
                    <g:textField name="username" value="${username}" required="" maxlength="30"/>
                </div>
                <div class='fieldcontain required'>
                    <label for='password'>Password</label>
                    <g:textField name="password" value="" required="" maxlength="30" id="password"/>
                </div>
            </fieldset>
            <fieldset>
                <button type="button" onclick="window.location='user/index'">Sign in</button>
                <br><br>
                <div><a href="user/create?type=applicant">Create account</a></div>
                <div><a href="user/create?type=recruiter">New Recruiter</a></div>
            </fieldset>
        </g:form>


    </body>
</html>
