class CategoryModel {
  bool? status;
  Data? data;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<CatogryData>? data;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CatogryData>[];
      json['data'].forEach((v) {
        data!.add(CatogryData.fromJson(v));
      });
    }
  }
}

class CatogryData {
  int? id;
  String? name;
  String? image;

  CatogryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
