class FarmerData {
  String sTATUSID="";
  String sTATUSMSG="";
  List<RESPONSE> rESPONSE=[];

  FarmerData({ this.sTATUSID,  this.sTATUSMSG,  this.rESPONSE});

  FarmerData.fromJson(Map<String, dynamic> json) {
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
  String srNo="";
  String farmerID="";
  String familyID="";
//  String memberId="";
//  String mobile="";
//  String nameEng="";
//  String fNameEng="";
//  String wvName="";
//  String btName="";
//  String districtName="";
//  String growerType="";
 // List<FarmerLandDetail> farmerLandDetail=[];

  RESPONSE(
      { this.srNo,
         this.familyID,
         this.farmerID,
//         this.memberId,
//         this.mobile,
//         this.nameEng,
//         this.fNameEng,
//         this.wvName,
//         this.btName,
//         this.districtName,
//         this.growerType,
       //  this.farmerLandDetail

      });

  RESPONSE.fromJson(Map<String, dynamic> json) {
    srNo = json['SrNo'];
    farmerID = json['FarmerID'];
    familyID = json['FamilyID'];
//    memberId = json['MemberId'];
//    mobile = json['Mobile'];
//    nameEng = json['NameEng'];
//    fNameEng = json['FNameEng'];
//    wvName = json['WvName'];
//    btName = json['BtName'];
//    districtName = json['DistrictName'];
//    growerType = json['GrowerType'];
//    if (json['FarmerLandDetail'] != null) {
//      farmerLandDetail = <FarmerLandDetail>[];
//      json['FarmerLandDetail'].forEach((v) {
//        farmerLandDetail.add(new FarmerLandDetail.fromJson(v));
//      });
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo'] = this.srNo;
    data['FarmerID'] = this.farmerID;
    data['FamilyID'] = this.familyID;
//    data['MemberId'] = this.memberId;
//    data['Mobile'] = this.mobile;
//    data['NameEng'] = this.nameEng;
//    data['FNameEng'] = this.fNameEng;
//    data['WvName'] = this.wvName;
//    data['BtName'] = this.btName;
//    data['DistrictName'] = this.districtName;
//    data['GrowerType'] = this.growerType;
//    if (this.farmerLandDetail != null) {
//      data['FarmerLandDetail'] =
//          this.farmerLandDetail.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class FarmerLandDetail {
  String farmerID="";
  String familyID="";
  String memberId="";
//  String locationDetail="";
//  String landDetail="";
//  Null seedAllotedArea;
//  String cropName="";
//  Null classofSeed;
//  String seedVariety="";

  FarmerLandDetail(
      { this.farmerID,
         this.familyID,
    //     this.memberId,
//         this.locationDetail,
//         this.landDetail,
//        this.seedAllotedArea,
//         this.cropName,
//        this.classofSeed,
//         this.seedVariety

      });

  FarmerLandDetail.fromJson(Map<String, dynamic> json) {
    farmerID = json['FarmerID'];
    familyID = json['FamilyID'];
  //  memberId = json['MemberId'];
//    locationDetail = json['LocationDetail'];
//    landDetail = json['LandDetail'];
//    seedAllotedArea = json['SeedAllotedArea'];
//    cropName = json['CropName'];
//    classofSeed = json['ClassofSeed'];
//    seedVariety = json['SeedVariety'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FarmerID'] = this.farmerID;
    data['FamilyID'] = this.familyID;
//    data['MemberId'] = this.memberId;
//    data['LocationDetail'] = this.locationDetail;
//    data['LandDetail'] = this.landDetail;
//    data['SeedAllotedArea'] = this.seedAllotedArea;
//    data['CropName'] = this.cropName;
//    data['ClassofSeed'] = this.classofSeed;
//    data['SeedVariety'] = this.seedVariety;
    return data;
  }
}