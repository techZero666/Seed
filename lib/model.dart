import 'package:FlutterAnimations/counting.dart';

class Model {
  int sNo,No;
  String farmerID,timeForSow,likelydateOfHarvest,farmLocation,isolation,earthization,adjoiningCropCondition,seedCropStatus,cropStandards,cropCondition,inspectedArea,canceledArea,netAreaCertified,avgYeild,totalYield,remarks,total,percentage,name,mapImage,inspectionLandImage,photoWithGrover,CreateUser;
  String offType, LOCP,OWS,DISEASED;
  String counting;
  List<String> counting1;

  Model({this.sNo, this.farmerID, this.timeForSow,this.likelydateOfHarvest,this.farmLocation,this.earthization,this.isolation,this.adjoiningCropCondition,this.seedCropStatus,this.cropStandards,this.cropCondition,this.inspectedArea,this.canceledArea,this.netAreaCertified,this.avgYeild,this.totalYield,this.remarks,this.total,this.percentage,this.name,this.counting,this.counting1,this.mapImage,this.inspectionLandImage,this.photoWithGrover,this.CreateUser});

  Model fromJson(json) {
    return Model(
        sNo: json['sNo'],
        farmerID: json['farmerID'],
        timeForSow: json['timeForSow'],
      likelydateOfHarvest: json['likelydateOfHarvest'],
      farmLocation: json['farmLocation'],
      earthization: json['earthization'],
      isolation: json['isolation'],
      adjoiningCropCondition: json['adjoiningCropCondition'],
      seedCropStatus: json['seedCropStatus'],
      cropStandards: json['cropStandards'],
      cropCondition: json['cropCondition'],
      inspectedArea: json['inspectedArea'],
      canceledArea: json['canceledArea'],
      netAreaCertified: json['netAreaCertified'],
      avgYeild: json['avgYeild'],
      totalYield: json['totalYield'],
      remarks: json['remarks'],
      total: json['total'],
      percentage: json['percentage'],
      name: json['name'],
      counting: json['rowList'],
      counting1: json['rowList1'],
      mapImage: json['mapImage'],
      inspectionLandImage: json['inspectionLandImage'],
      photoWithGrover: json['photoWithGrover'],
      CreateUser: json['CreateUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sNo': sNo, 'farmerID': farmerID,
      'timeForSow': timeForSow, 'farmerID': farmerID,
      'likelydateOfHarvest': likelydateOfHarvest, 'farmLocation': farmLocation,
      'earthization': earthization, 'isolation': isolation,
      'adjoiningCropCondition': adjoiningCropCondition,
      'seedCropStatus': seedCropStatus,
      'cropStandards': cropStandards, 'cropCondition': cropCondition,
      'inspectedArea': inspectedArea, 'canceledArea': canceledArea,
      'netAreaCertified': netAreaCertified, 'avgYeild': avgYeild,
      'totalYield': totalYield, 'remarks': remarks,
      'total': total, 'percentage': percentage,
      'name':name,
      'rowList':counting,
      'mapImage': mapImage,"inspectionLandImage": inspectionLandImage,"photoWithGrover": photoWithGrover,
      'CreateUser': CreateUser
    };
  }

}
