import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/model/media_metadata_model.dart';

void main() {
  
  test("mediametadatamodel", () async {
    var model = MediaMetadataModel(
      url: "http://test",
    );
    expect(model.url, "http://test");
  });

  test("mediametadatamodelfromjson", () async {
    Map<String, dynamic> json = {"type": "http://test"};

    var model = MediaMetadataModel.fromJson(json);
    expect(model.url, "http://test");
  });

  test("mediametadatamodeltojson", () async {
    var model = MediaMetadataModel(
      url: "http://test",
    );
    Map<String,dynamic> json = model.toJson();
    expect(json["type"], "http://test");
  });
}
