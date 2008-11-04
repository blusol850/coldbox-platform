<?xml version="1.0" encoding="ISO-8859-1"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:noNamespaceSchemaLocation="../system/config/config.xsd">
	<Settings>
		<Setting name="AppName" 					value="coldbox testharness"/>
		<Setting name="AppMapping"					value="/coldbox/testharness" />
		<Setting name="DebugMode" 					value="true"/>
		<Setting name="DebugPassword" 				value="coldbox"/>
		<Setting name="ReinitPassword" 				value=""/>
		<Setting name="EventName" 					value="event"/>
		<Setting name="EnableDumpVar" 				value="true"/>
		<Setting name="EnableColdfusionLogging" 	value="false"/>
		<Setting name="EnableColdboxLogging" 		value="true"/>
		<Setting name="ColdboxLogsLocation"			value="logs" />
		<Setting name="DefaultEvent" 				value="ehGeneral.dspHello"/>
		<Setting name="RequestStartHandler" 		value=""/>
		<Setting name="RequestEndHandler" 			value=""/>
		<Setting name="ApplicationStartHandler"		value="ehGeneral.onApplicationStart" />
		<Setting name="SessionStartHandler"		    value="ehGeneral.onSessionStart" />
		<Setting name="SessionEndHandler"		    value="ehGeneral.onSessionEnd" />
		<Setting name="OwnerEmail" 					value="info@coldboxframework.com"/>
		<Setting name="EnableBugReports" 			value="false"/>
		<Setting name="UDFLibraryFile" 				value="includes/udf.cfm" />
		<Setting name="CustomErrorTemplate"			value="" />
		<Setting name="CustomEmailBugReport"		value="includes/EmailBugReport.cfm" />
		<Setting name="MessageboxStyleOverride"		value="false" />
		<Setting name="HandlersIndexAutoReload"   	value="true" />
		<Setting name="ConfigAutoReload"			value="false" />
		<Setting name="ExceptionHandler"     		value="" />
		<Setting name="onInvalidEvent" 				value="" />
		<Setting name="MyPluginsLocation" 			value="coldbox.testing.testplugins"/>
		<Setting name="ViewsExternalLocation"		value="/coldbox/testing/testviews" />
		<Setting name="HandlersExternalLocation" 	value="coldbox.testing.testhandlers"/>
		<Setting name="HandlerCaching" 				value="false"/>
		<Setting name="EventCaching" 				value="true"/>
		<Setting name="IOCFramework" 				value="lightwire"/>
		<Setting name="IOCDefinitionFile"		 	value="config/coldspring.xml.cfm"/>
		<Setting name="IOCObjectCaching"			value="false"/>
		<Setting name="RequestContextDecorator"		value="coldbox.testharness.model.myRequestContextDecorator" />
		<Setting name="ProxyReturnCollection" 		value="false"/>
	</Settings>

	<YourSettings>
		<Setting name="MyStruct" value="{name:'luis majano', email:'info@email.com', active:'true'}"/>
		<Setting name="MyArray"  value="[1,2,3,4,5,6]"/>
		<Setting name="MyBaseURL"  value="apps.jfetmac" />
		
		<!-- RSS REader -->
		<Setting name="feedReader_useCache"  value="true" />
		<Setting name="feedReader_cacheType"  value="ram" />
		<Setting name="feedReader_cacheTimeout"  value="10" />
		
		<!-- Show SideBar? true/false, else leave blank. -->
		<Setting name="ColdBoxSideBar" value="true" />
	</YourSettings>
	
	<!-- Custom Conventions : You can override the framework wide conventions -->
	<Conventions>
		<handlersLocation>handlers</handlersLocation>
		<pluginsLocation>plugins</pluginsLocation>
		<layoutsLocation>layouts</layoutsLocation>
		<viewsLocation>views</viewsLocation>
		<eventAction>index</eventAction>		
	</Conventions>	

	<DebuggerSettings>
		<!--Settings-->
		<PersistentRequestProfiler>true</PersistentRequestProfiler>
		<maxPersistentRequestProfilers>10</maxPersistentRequestProfilers>
		<maxRCPanelQueryRows>50</maxRCPanelQueryRows>
		<!--Panels-->
		<TracerPanel 	show="true" expanded="false" />
		<InfoPanel 		show="true" expanded="false" />
		<CachePanel 	show="true" expanded="false" />
		<RCPanel		show="false" expanded="false" />
	</DebuggerSettings>
	
	<!--Optional,if blank it will use the CFMX administrator settings.-->
	<MailServerSettings />

	<BugTracerReports>
		<BugEmail>info@coldboxframework.com</BugEmail>
	</BugTracerReports>

	<DevEnvironments>
		<url>dev</url>
	</DevEnvironments>

	<WebServices >
		<WebService URL="http://www.test.com/test.cfc?wsdl" name="TestWS"/>
		<WebService URL="http://www.coldboxframework.com/distribution/updatews.cfc?wsdl" name="AnotherTestWS" DevURL="http://www.coldboxframework.com/distribution/updatews.cfc?wsdl"/>
	</WebServices>

	<Layouts>
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
		<Layout file="Layout.tester.cfm" name="login">
			<View>vwLogin</View>
			<View>test</View>
			<Folder>tags</Folder>
			<Folder>pdf/single</Folder>
		</Layout>
	</Layouts>

	<i18N>
		<!--Default Resource Bundle without locale and properties extension-->
		<DefaultResourceBundle>includes/main</DefaultResourceBundle>
		<!--Java Standard Locale-->
		<DefaultLocale>en_US</DefaultLocale>
		<!--session or client-->
		<LocaleStorage>session</LocaleStorage>
		<UknownTranslation>nothing</UknownTranslation>
	</i18N>

	<Datasources>
		<Datasource alias="mysite" name="mysite" dbtype="mysql"  username="root" password="pass" />
		<Datasource alias="blog_dsn" name="myblog" dbtype="oracle" username="root" password="pass" />
	</Datasources>
	
	<Cache>
		<ObjectDefaultTimeout>15</ObjectDefaultTimeout>
		<ObjectDefaultLastAccessTimeout>5</ObjectDefaultLastAccessTimeout>
		<ReapFrequency>1</ReapFrequency>
		<MaxObjects>100</MaxObjects>
		<FreeMemoryPercentageThreshold>0</FreeMemoryPercentageThreshold>
		<UseLastAccessTimeouts>false</UseLastAccessTimeouts>
	</Cache>
	
	<Interceptors throwOnInvalidStates="true">
		<CustomInterceptionPoints>onLog</CustomInterceptionPoints>
		<Interceptor class="coldbox.system.interceptors.environmentControl">
			<Property name="configFile">config/environments.xml.cfm</Property>
			<Property name="fireOnInit">true</Property>
		</Interceptor>
		<Interceptor class="coldbox.system.interceptors.deploy">
			<Property name="tagFile">config/_deploy.tag</Property>
			<Property name="deployCommandObject">coldbox.testharness.model.DeployCleanup</Property>
		</Interceptor>
		<Interceptor class="coldbox.system.interceptors.autowire">
			<Property name="debugMode">true</Property>
			<Property name="enableSetterInjection">false</Property>
		</Interceptor>
		<!-- 
		<Interceptor class="coldbox.testharness.interceptors.executionTracer">
			<Property name="Simple">Luis</Property>
			<Property name="Complex">[1,2,3,4,5]</Property>
		</Interceptor>
			-->	
		<Interceptor class="coldbox.system.interceptors.ses">
			<Property name="configFile">/config/routes.cfm</Property>
		</Interceptor>
		
		<Interceptor class="${AppMapping}.interceptors.errorObserver" />
		<Interceptor class="${AppMapping}.interceptors.iocObserver" />
		
		<Interceptor class="coldbox.system.interceptors.security">
	        <Property name="rulesSource">xml</Property>
	        <Property name="rulesFile">config/security.xml.cfm</Property>
	        <Property name="debugMode">true</Property>
	        <Property name="preEventSecurity">true</Property>
		</Interceptor>	
		
		<!-- Developer's ColdBox Sidebar -->
		<Interceptor class="coldbox.system.interceptors.coldboxSideBar">
			<!-- Y offset: number, else leave blank -->
			<Property name="yOffset"></Property>
			<!-- Scroll: true/false, else leave blank -->
			<Property name="isScroll"></Property>
			<!-- Slide Speed: number, else leave blank -->
			<Property name="slideSpeed"></Property>
			<!-- Wait time before closing: number, else leave blank -->
			<Property name="waitTimeBeforeClose"></Property>
			<!-- Links (JSON array of objects), else leave blank
			e.g. 
				[
				{"desc":"ColdBox API","href":"http:\/\/www.coldboxframework.com\/api\/"}
				,{"desc":"ColdBox Credits","href":"http:\/\/ortus.svnrepository.com\/coldbox\/trac.cgi\/wiki\/cbCredits"}
				,{"desc":"ColdBox SideBar Help","href":"http:\/\/ortus.svnrepository.com\/coldbox\/trac.cgi\/wiki\/cbSideBar"}
				,{"desc":"Transfer Docs","href":"http:\/\/docs.transfer-orm.com\/"}
				,{"desc":"My API","href":"http:\/\/localhost\/myApi/"}
				,{"desc":"My Database Schema","href":"http:\/\/localhost\/myDatabaseSchema.pdf"}
				]			
			 -->
 			<Property name="links"></Property>
			<!-- Width of the sidebar including visible width, else leave blank -->
			<Property name="width"></Property>
			<!-- Visible width, else leave blank  -->
			<Property name="visibleWidth"></Property>
			<!--Full path from the application's root, else leave blank. -->
			<Property name="imagePath"></Property>
			<!-- Vertical alignment of the image: top,middle or bottom, else leave blank  -->
			<Property name="imageVAlign"></Property>
			<!--Full path from the application's root, else leave blank -->
			<Property name="cssPath"></Property>
		</Interceptor>	
	</Interceptors>

</Config>
