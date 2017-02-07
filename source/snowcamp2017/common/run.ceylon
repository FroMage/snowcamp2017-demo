import ceylon.json { JsonObject = Object, parse }

shared String getVersionList(String|JsonObject json) {
    value buf = StringBuilder();
    JsonObject parsedJson;
    switch(json)
    case(is String){
        assert(is JsonObject j = parse(json));
        parsedJson = j;
    }
    else {
        parsedJson = json;
    }
    for(mod in parsedJson.getArray("results")){
        assert(is JsonObject mod);
        buf.append(mod.getString("version")+"\n");
    }
    return buf.string;
}
