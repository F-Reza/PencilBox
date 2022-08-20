
const String tableContact = 'tbl_contact';
const String tableContactColId = 'id';
const String tableContactColName = 'name';
const String tableContactColNumber = 'number';
const String tableContactColEmail= 'email';
const String tableContactColaAddress = 'address';
const String tableContactColDob = 'dob';
const String tableContactColGender = 'gender';
const String tableContactColImage = 'image';
const String tableContactColWebsite = 'website';
const String tableContactColFav = 'favourite';


class ContactModel {
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? dob;
  String? gender;
  String? image;
  String? website;
  bool favourite;

  ContactModel(
      {this.id,
      required this.name,
      required this.number,
      this.email,
      this.address,
      this.dob,
      this.gender,
      this.image,
      this.website,
      this.favourite = false});


  Map <String, dynamic> toMap() {
    var map = <String,dynamic> {
      tableContactColName:name,
      tableContactColNumber:number,
      tableContactColEmail:email,
      tableContactColaAddress:address,
      tableContactColDob:dob,
      tableContactColGender:gender,
      tableContactColImage:image,
      tableContactColWebsite:website,
      tableContactColFav:favourite? 1:0,
    };
    if(id!=null){
      map[tableContactColId] = id;
    }
    return map;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
    id: map[tableContactColId],
    name: map[tableContactColName],
    number: map[tableContactColNumber],
    email: map[tableContactColEmail],
    address: map[tableContactColaAddress],
    dob: map[tableContactColDob],
    gender: map[tableContactColGender],
    image: map[tableContactColImage],
    website: map[tableContactColWebsite],
    favourite: map[tableContactColFav] == 1?true:false,
  );

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, number: $number, email: $email, address: $address, dob: $dob, gender: $gender, image: $image, website: $website, favourite: $favourite}';
  }

}


