native("jvm")
module snowcamp2017.wildfly "1.0.0" {
    shared import maven:"javax:javaee-api" "7.0";
    import snowcamp2017.common "1.0.0";
    import ceylon.http.client "1.3.1";
}
