import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/model/media_model.dart';

void main() {
  
  test("mediamodel", () async {
    var model = MediaModel(
      type: "test",
    );
    expect(model.type, "test");
  });

  test("mediamodelfromjson", () async {
    Map<String, dynamic> json = {"type": "test"};

    var model = MediaModel.fromJson(json);
    expect(model.type, "test");
  });

  test("mediamodeltojson", () async {
    var model = MediaModel(
      type: "test",
    );
    Map<String,dynamic> json = model.toJson();
    expect(json["type"], "test");
  });
}
