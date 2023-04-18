class DataModel{
  String idx, provinceId, regencyId, regencyName;

  DataModel ({
    this.idx = "",
    this.provinceId = "",
    this.regencyId = "",
    this.regencyName = "",
  });

  factory DataModel.fromJson(Map<String, dynamic>json){
    return DataModel(
      idx: json["idx"],
      provinceId: json["province_id"],
      regencyId: json["regency_id"],
      regencyName: json["regency_name"],
    );
  }

}
