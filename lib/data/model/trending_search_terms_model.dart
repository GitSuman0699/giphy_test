class TrendingSearchTermsModel {
  List<String>? data;
  Meta? meta;

  TrendingSearchTermsModel({this.data, this.meta});

  TrendingSearchTermsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Meta {
  String? msg;
  int? status;
  String? responseId;

  Meta({this.msg, this.status, this.responseId});

  Meta.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    responseId = json['response_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    data['response_id'] = responseId;
    return data;
  }
}
