import 'dart:convert';

ListofApprovedOutpass listofApprovedOutpass(String str) =>
    ListofApprovedOutpass.fromJson(json.decode(str));

String welcomeToJson(ListofApprovedOutpass data) => json.encode(data.toJson());

class ListofApprovedOutpass {
  ListofApprovedOutpass({
    required this.approvedOutpassDetails,
    required this.error,
    required this.message,
  });

  List<ApprovedOutpassDetail> approvedOutpassDetails;
  int error;
  String message;

  factory ListofApprovedOutpass.fromJson(Map<String, dynamic> json) =>
      ListofApprovedOutpass(
        approvedOutpassDetails: List<ApprovedOutpassDetail>.from(
            json["ApprovedOutpassDetails"]
                .map((x) => ApprovedOutpassDetail.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ApprovedOutpassDetails":
            List<dynamic>.from(approvedOutpassDetails.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class ApprovedOutpassDetail {
  ApprovedOutpassDetail({
    required this.outId,
    required this.name,
    required this.emailId,
    required this.purpose,
    required this.outTime,
    required this.inTime,
    required this.outDate,
    required this.outStatus,
    required this.parentsPermission,
    required this.approved,
  });

  String outId;
  String name;
  String emailId;
  String purpose;
  String outTime;
  String inTime;
  DateTime outDate;
  String outStatus;
  String parentsPermission;
  String approved;

  factory ApprovedOutpassDetail.fromJson(Map<String, dynamic> json) =>
      ApprovedOutpassDetail(
        outId: json["OutId"],
        name: json["Name"],
        emailId: json["EmailId"],
        purpose: json["Purpose"],
        outTime: json["OutTime"],
        inTime: json["InTime"],
        outDate: DateTime.parse(json["OutDate"]),
        outStatus: json["OutStatus"],
        parentsPermission: json["ParentsPermission"],
        approved: json["Approved"],
      );

  Map<String, dynamic> toJson() => {
        "OutId": outId,
        "Name": name,
        "EmailId": emailId,
        "Purpose": purpose,
        "OutTime": outTime,
        "InTime": inTime,
        "OutDate":
            "${outDate.year.toString().padLeft(4, '0')}-${outDate.month.toString().padLeft(2, '0')}-${outDate.day.toString().padLeft(2, '0')}",
        "OutStatus": outStatus,
        "ParentsPermission": parentsPermission,
        "Approved": approved,
      };
}
