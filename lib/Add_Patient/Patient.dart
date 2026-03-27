class Patient{

  String name;
  int age;
  String gender;
  String phoneNumber;
  String assignedDoctor;
  String healthCondition;
  DateTime dateAdmitted;
  String? prescriptionPath;
  String? reportPath;

  Patient({
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.assignedDoctor,
    required this.healthCondition,
    required this.dateAdmitted,
    this.prescriptionPath,
    this.reportPath,
  });
  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'gender': gender,
    'phoneNumber': phoneNumber,
    'assignedDoctor': assignedDoctor,
    'healthCondition': healthCondition,
    'dateAdmitted': dateAdmitted.toIso8601String(),
    'prescriptionPath': prescriptionPath,
    'reportPath': reportPath,
  };

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    name: json['name'] ?? '',
    age: json['age'] ?? 0,
    gender: json['gender'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
    assignedDoctor: json['assignedDoctor'] ?? '',
    healthCondition: json['healthCondition'] ?? '',
    dateAdmitted: DateTime.parse(json['dateAdmitted']),
    prescriptionPath: json['prescriptionPath'],
    reportPath: json['reportPath'],
  );

}