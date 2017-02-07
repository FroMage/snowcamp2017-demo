import io.vertx.ceylon.core { vertx_ = vertx }
import io.vertx.ceylon.core.http {
    HttpServerRequest
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
        client.getNow("modules.ceylon-lang.org", "/api/5/complete-versions?module=ceylon.language",
            (resp) {
                resp.bodyHandler((Buffer body) {
                    value obj = body.toJsonObject();
                    request.response().end(getVersionList(obj));
                });
        });
    }).listen(9001);
}