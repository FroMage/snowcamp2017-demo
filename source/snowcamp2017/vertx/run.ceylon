import io.vertx.ceylon.core { vertx_ = vertx }
import io.vertx.ceylon.core.http {
    HttpServerRequest,
    HttpServer
}
import io.vertx.ceylon.core.buffer {
    Buffer
}
import snowcamp2017.common {
    getVersionList
}

"Run the module `snowcamp2017.vertx`."
shared void run() {
    value vertx = vertx_.vertx();
    vertx.createHttpServer().requestHandler((HttpServerRequest request) {
        value client = vertx.createHttpClient();
        print("More work?");
        client.getNow("modules.ceylon-lang.org", "/api/5/complete-versions?module=ceylon.language",
            (resp) {
                resp.bodyHandler((Buffer body) {
                    print("Job's done.");
                    value obj = body.toJsonObject();
                    request.response().end(getVersionList(obj));
                });
        });
    }).listen(9001, (result){
        switch (result)
        case (is Throwable) {
            print("Borked");
            result.printStackTrace();
        }
        case (is HttpServer) {
            print("Ready to serve");
        }
        
    });
}