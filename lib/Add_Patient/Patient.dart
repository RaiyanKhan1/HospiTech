class Patient {
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
}