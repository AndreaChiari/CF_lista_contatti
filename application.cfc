component {
    this.name = "lista_contatti";
    this.datasource = "andrea";
    this.sessionManagement = true;
	this.setClientCookies = true;
	this.clientManagement = true;
	this.sessionTimeout = "#CreateTimeSpan(0, 3, 0, 0)#";
	this.scriptProtect = "none";

    function onApplicationStart() {
		application.local = SetLocale("italian (standard)"); 
		return true;
    }
	function onSessionStart() {
		
		session.lang="ita";
		return true;
    } 

	function onSessionEnd() {
	
		include "include/logoff.cfm";
    } 
	
	function onRequestStart() {
		
    } 
	void function onError(struct exception, string eventName) {
		dump(var:exception,label:eventName);		
	}


 }

