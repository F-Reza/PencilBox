class ContactModel{
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? company;
  String? designation;
  String? website;
  bool isFavourite;

  ContactModel(
      {this.id,
      required this.name,
      required this.number,
      this.email,
      this.address,
      this.company,
      this.designation,
      this.website,
      this.isFavourite = false});

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, number: $number, email: $email, address: $address, company: $company, designation: $designation, website: $website, isFavourite: $isFavourite}';
  }
}