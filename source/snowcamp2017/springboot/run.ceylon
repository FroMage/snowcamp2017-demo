import org.springframework.web.bind.annotation { restController, requestMapping }
import org.springframework.boot.autoconfigure {
    springBootApplication
}
import org.springframework.boot {
    SpringApplication
}
import ceylon.interop.java {
    javaClass
}
import ceylon.http.client {
    httpGet=get
}
import ceylon.uri {
    parseUri=parse
}
import snowcamp2017.common {
    getVersionList
}


restController
shared class HelloController() {
    
    requestMapping{"/"}
    shared String index() {
        print("I come to serve.");
        value uri = parseUri("https://modules.ceylon-lang.org/api/5/complete-versions?module=ceylon.language");
        value versions = getVersionList(httpGet(uri).execute().contents);
        print("By your command.");
        return versions;
    }
    
}

springBootApplication
shared class Application(){}

shared void run() {
    SpringApplication.run(javaClass<Application>());
}