class FarmerListData {
  String sTATUSID="";
  String sTATUSMSG="";
  List<RESPONSE> rESPONSE=[];

  FarmerListData({ this.sTATUSID,  this.sTATUSMSG,  this.rESPONSE});

  FarmerListData.fromJson(Map<String, dynamic> json) {
    sTATUSID = json['STATUS_ID'];
    sTATUSMSG = json['STATUS_MSG'];
    if (json['RESPONSE'] != null) {
      rESPONSE = <RESPONSE>[];
      json['RESPONSE'].forEach((v) {
        rESPONSE.add(new RESPONSE.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS_ID'] = this.sTATUSID;
    data['STATUS_MSG'] = this.sTATUSMSG;
    if (this.rESPONSE != null) {
      data['RESPONSE'] = this.rESPONSE.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RESPONSE {
  int srNo=0;
  String farmerID="";
  String familyID="";
  String memberId="";
  String mobile="";
  String nameEng="";
  String fNameEng="";
  String wvName="";
  String districtName="";
  String btName="";
  String growerType="";

  RESPONSE(
      { this.srNo,
         this.farmerID,
         this.familyID,
         this.memberId,
         this.mobile,
         this.nameEng,
         this.fNameEng,
         this.wvName,
         this.districtName,
         this.btName,
         this.growerType});

  RESPONSE.fromJson(Map<String, dynamic> json) {
    srNo = json['SrNo'];
    farmerID = json['FarmerID'];
    familyID = json['FamilyID'];
    memberId = json['MemberId'];
    mobile = json['Mobile'];
    nameEng = json['NameEng'];
    fNameEng = json['FNameEng'];
    wvName = json['WvName'];
    districtName = json['DistrictName'];
    btName = json['BtName'];
    growerType = json['GrowerType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo'] = this.srNo;
    data['FarmerID'] = this.farmerID;
    data['FamilyID'] = this.familyID;
    data['MemberId'] = this.memberId;
    data['Mobile'] = this.mobile;
    data['NameEng'] = this.nameEng;
    data['FNameEng'] = this.fNameEng;
    data['WvName'] = this.wvName;
    data['DistrictName'] = this.districtName;
    data['BtName'] = this.btName;
    data['GrowerType'] = this.growerType;
    return data;
  }
}