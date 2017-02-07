import spark {
    Spark
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
"Run the module `snowcamp2017.sparkframework`."
shared void run() {
    Spark.get("/hello", (req, res){
        print("I've got a flying machine!");
        value uri = parseUri("https://modules.ceylon-lang.org/api/5/complete-versions?module=ceylon.language");
        value versions = getVersionList(httpGet(uri).execute().contents);
        print("I'm flying…");
        return versions;
    });
}