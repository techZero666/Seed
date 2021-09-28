class Counting {
  int No;
  String SNo,offType, LOCP,OWS,DISEASED,CreateUser;
  Counting( {this.SNo,this.No,this.offType,this.LOCP,this.OWS,this.DISEASED,this.CreateUser});


  Counting fromJson(json) {
    return Counting(
      SNo: json['SNo'],
        No: json['No'],
      offType: json['offType'],
      LOCP: json['LOCP'],
      OWS: json['OWS'],
      DISEASED: json['DISEASED'],
      CreateUser: json['CreateUser'],

    );
  }
  Map<String, dynamic> toJson() {
    return {

      'SNo':SNo,
      'No': No, 'offType': offType,
      'LOCP': LOCP, 'OWS': OWS,
      'DISEASED': DISEASED,
      'CreateUser': CreateUser,
    };
  }


  Map<String, dynamic> toJsonInside() {
    return {
      'SNo': SNo,
      'No': No, 'offType': offType,
      'LOCP': LOCP, 'OWS': OWS,
      'DISEASED': DISEASED,
      'CreateUser': CreateUser

    };
  }

}
