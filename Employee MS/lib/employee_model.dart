class EmployeeModel {
  int? empId;
  String name;
  String dob;
  String designation;
  String mobile;
  String email;
  String streetAddress;
  num salary;
  String image;
  String gender;

  EmployeeModel(
      {this.empId,
      required this.name,
      required this.dob,
      required this.designation,
      required this.mobile,
      required this.email,
      required this.streetAddress,
      required this.salary,
      required this.image,
      required this.gender});
}

final List<EmployeeModel> employeeList = [
  EmployeeModel(
      name: 'Farhan Morshed',
      dob: '01/05/2000',
      designation: 'Exicutive',
      mobile: '01830996044',
      email: 'farham505@gmail.com',
      streetAddress: 'Mirpur, Dhaka',
      salary: 25000,
      image: 'images/male.png',
      gender: 'Male'),
];

final designationList = <String> [
  'Director',
  'CEO',
  'Sales Manager',
  'Project Manager',
  'Senior Developer',
  'Software Engineer',
];