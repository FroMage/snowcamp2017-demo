import javax.ws.rs {
    applicationPath,
    path,
    get,
    produces
}
import javax.ws.rs.core {
    Response,
    Application
}
import ceylon.uri { parseUri = parse }
import ceylon.http.client { httpGet = get }
import snowcamp2017.common {
    getVersionList
}

"Defines a REST endpoint at `/rest`"
see(`class HelloWorldEndpoint`)
applicationPath("/rest")
shared class RestApplication() extends Application() {
}

"Defines a Hellow service at `/rest/hello`"
path("/hello")
shared class HelloWorldEndpoint() {

  "Returns a friendly Hello"
  get
  produces({"text/plain"})
  default shared Response doGet(){
    value uri = parseUri("https://modules.ceylon-lang.org/api/5/complete-versions?module=ceylon.language");
    value versions = getVersionList(httpGet(uri).execute().contents);
    return Response.ok(versions).build();
  }
}

"Run the module `snowcamp2017.wildfly`."
shared void run() {
    
}