final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');
final List<String> Img = List.generate(5, (index) => 'images/bg.jpg');

final List<Hotel> hotels = [
  Hotel(
      id: 1,
      name: 'Garnd Royal Hotel',
      address: 'address',
      ratting: 4,
      price: 440,
      description: '''Description-1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt 
      ut labore et dolore magna aliqua. Ut pharetra sit amet aliquam id diam maecenas ultricies. Aliquam sem et tortor consequat. 
      Tempor orci dapibus ultrices in iaculis nunc sed. Feugiat in fermentum posuere urna nec tincidunt. Gravida quis blandit 
      turpis cursus in hac habitasse platea dictumst. Ante in nibh mauris cursus mattis molestie. Sed lectus vestibulum mattis 
      ullamcorper velit sed ullamcorper. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Non quam lacus 
      suspendisse faucibus interdum. Condimentum vitae sapien pellentesque habitant morbi. Consectetur adipiscing elit duis 
      tristique sollicitudin nibh sit amet. Dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus. 
      Mi sit amet mauris commodo quis imperdiet massa tincidunt nunc. Ultricies mi eget mauris pharetra et ultrices neque ornare. 
      Donec pretium vulputate sapien nec sagittis aliquam.''',
      favorite: true,
      image: 'images/bg.jpg'),
  Hotel(
      id: 2,
      name: 'Queen hotel',
      address: 'New york Sity',
      ratting: 5,
      price: 566,
      description: '''Description-2 Rhoncus mattis rhoncus urna neque. Dignissim enim sit amet venenatis urna cursus eget nunc. 
      Tincidunt augue interdum velit euismod in. Odio facilisis mauris sit amet massa vitae. Dictum fusce ut placerat orci nulla 
      pellentesque dignissim enim. Porttitor leo a diam sollicitudin tempor id eu. Fermentum posuere urna nec tincidunt praesent 
      semper feugiat. Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Consequat ac felis donec et. 
      Quis vel eros donec ac odio tempor orci. Nulla facilisi nullam vehicula ipsum a arcu. Lorem donec massa sapien faucibus et 
      molestie.''',
      favorite: true,
      image: 'images/hotel-1.jpg'),
  Hotel(
      id: 3,
      name: 'Grant XL Hotel',
      address: 'France',
      ratting: 4,
      price: 420,
      description: '''Description-3 Varius sit amet mattis vulputate enim nulla aliquet porttitor. Bibendum est ultricies integer 
      quis auctor elit. Urna nec tincidunt praesent semper feugiat nibh sed pulvinar. Congue eu consequat ac felis donec. 
      Mauris ultrices eros in cursus. Id ornare arcu odio ut sem nulla pharetra. Fringilla phasellus faucibus scelerisque eleifend. 
      Aliquam ut porttitor leo a diam sollicitudin. Sit amet justo donec enim diam vulputate. estas quis ipsum suspendisse ultrices gravida.''',
      favorite: false,
      image: 'images/hotel-2.jpg'),
  Hotel(
      id: 4,
      name: 'Royal x hotel',
      address: 'Maxico',
      ratting: 3,
      price: 450,
      description: '''Description-4 Pellentesque habitant morbi tristique senectus et netus et malesuada fames. 
      Molestie ac feugiat sed lectus. Sodales ut etiam sit amet nisl purus in mollis nunc. Odio morbi quis commodo 
      odio aenean sed adipiscing diam. Risus sed vulputate odio ut. Faucibus nisl tincidunt eget nullam non nisi est sit. 
      A arcu cursus vitae congue mauris. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam. 
      Nunc sed velit dignissim sodales ut. Arcu dui vivamus arcu felis. Natoque penatibus et magnis dis parturient 
      montes nascetur ridiculus. ementum sagittis vitae et leo duis ut diam quam nulla.''',
      favorite: true,
      image: 'images/hotel-3.jpg'),
  Hotel(
      id: 5,
      name: 'Hotel Dileey',
      address: 'Torento',
      ratting: 4,
      price: 400,
      description: '''Description-5 Fermentum odio eu feugiat pretium nibh. Eget aliquet nibh praesent tristique magna sit amet. 
      Quam viverra orci sagittis eu volutpat odio. Facilisis leo vel fringilla est. Pellentesque habitant morbi tristique senectus. Massa massa ultricies mi quis hendrerit. Cras tincidunt lobortis feugiat vivamus at augue eget. In fermentum et sollicitudin ac orci phasellus. In ornare quam viverra orci sagittis eu volutpat odio facilisis. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Pulvinar mattis nunc sed blandit libero. Fringilla ut morbi tincidunt augue interdum velit. Sed arcu non odio euismod lacinia at quis risus sed. Eget nullam non nisi est sit. Vitae et leo duis ut diam quam. Vehicula ipsum a arcu cursus vitae congue mauris.''',
      favorite: false,
      image: 'images/hotel-4.jpg'),
];

class Hotel {
  int id;
  String name;
  String address;
  double ratting;
  double price;
  String description;
  bool favorite;
  String image;

  Hotel(
      {required this.id,
        required this.name,
        required this.address,
        required this.ratting,
        required this.price,
        required this.description,
        this.favorite = false,
        required this.image});
}

const longText = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut pharetra sit amet aliquam id diam maecenas ultricies. Aliquam sem et tortor consequat. Tempor orci dapibus ultrices in iaculis nunc sed. Feugiat in fermentum posuere urna nec tincidunt. Gravida quis blandit turpis cursus in hac habitasse platea dictumst. Ante in nibh mauris cursus mattis molestie. Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Non quam lacus suspendisse faucibus interdum. Condimentum vitae sapien pellentesque habitant morbi. Consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus. Mi sit amet mauris commodo quis imperdiet massa tincidunt nunc.

Ultricies mi eget mauris pharetra et ultrices neque ornare. Donec pretium vulputate sapien nec sagittis aliquam. Rhoncus mattis rhoncus urna neque. Dignissim enim sit amet venenatis urna cursus eget nunc. Tincidunt augue interdum velit euismod in. Odio facilisis mauris sit amet massa vitae. Dictum fusce ut placerat orci nulla pellentesque dignissim enim. Porttitor leo a diam sollicitudin tempor id eu. Fermentum posuere urna nec tincidunt praesent semper feugiat. Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Consequat ac felis donec et. Quis vel eros donec ac odio tempor orci.

Nulla facilisi nullam vehicula ipsum a arcu. Lorem donec massa sapien faucibus et molestie. Varius sit amet mattis vulputate enim nulla aliquet porttitor. Bibendum est ultricies integer quis auctor elit. Urna nec tincidunt praesent semper feugiat nibh sed pulvinar. Congue eu consequat ac felis donec. Mauris ultrices eros in cursus. Id ornare arcu odio ut sem nulla pharetra. Fringilla phasellus faucibus scelerisque eleifend. Aliquam ut porttitor leo a diam sollicitudin. Sit amet justo donec enim diam vulputate.

Egestas quis ipsum suspendisse ultrices gravida. Arcu cursus euismod quis viverra nibh cras pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Molestie ac feugiat sed lectus. Sodales ut etiam sit amet nisl purus in mollis nunc. Odio morbi quis commodo odio aenean sed adipiscing diam. Risus sed vulputate odio ut. Faucibus nisl tincidunt eget nullam non nisi est sit. A arcu cursus vitae congue mauris. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam. Nunc sed velit dignissim sodales ut. Arcu dui vivamus arcu felis. Natoque penatibus et magnis dis parturient montes nascetur ridiculus.

Elementum sagittis vitae et leo duis ut diam quam nulla. Fermentum odio eu feugiat pretium nibh. Eget aliquet nibh praesent tristique magna sit amet. Quam viverra orci sagittis eu volutpat odio. Facilisis leo vel fringilla est. Pellentesque habitant morbi tristique senectus. Massa massa ultricies mi quis hendrerit. Cras tincidunt lobortis feugiat vivamus at augue eget. In fermentum et sollicitudin ac orci phasellus. In ornare quam viverra orci sagittis eu volutpat odio facilisis. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Pulvinar mattis nunc sed blandit libero. Fringilla ut morbi tincidunt augue interdum velit. Sed arcu non odio euismod lacinia at quis risus sed. Eget nullam non nisi est sit. Vitae et leo duis ut diam quam. Vehicula ipsum a arcu cursus vitae congue mauris.''';