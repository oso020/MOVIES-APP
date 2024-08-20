class Categoryitemlist{
  String name;
  String imagePath;

  Categoryitemlist({required this.name , required this.imagePath});

  static List<Categoryitemlist> getCategories() {
    return[
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
      Categoryitemlist(name: 'Action', imagePath: 'assets/images/category_image.png'),
    ];
  }

}