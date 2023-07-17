class MediaMetadataModel {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadataModel({this.url, this.format, this.height, this.width});

  MediaMetadataModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['format'] = format;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}