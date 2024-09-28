enum Difficulty { easy, medium, hard }

class FoodModel {
  String name;
  String image;
  String direction;
  double star;
  int serving;
  int duration;
  int calories;
  Difficulty difficulty;
  List<String> ingredients;
  List<String> category;

  FoodModel({
    required this.name,
    required this.image,
    required this.direction,
    required this.star,
    required this.duration,
    required this.serving,
    required this.calories,
    required this.ingredients,
    required this.difficulty,
    required this.category,
  });
}

List<FoodModel> foods = [
  FoodModel(
    name: 'Pizza',
    image: 'assets/images/pizza.jpg',
    direction:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    star: 4.5,
    duration: 30,
    serving: 3,
    calories: 120,
    difficulty: Difficulty.easy,
    ingredients: [
      'Tomato',
      'Cheese',
      'Olive',
    ],
    category: ['FastFood', 'Pizza'],
  ),
  FoodModel(
    name: 'Burger',
    image: 'assets/images/burger.jpg',
    direction:
        'Campurkan daging sapi cincang dengan garam, lada, bawang putih bubuk, dan bawang bombay cincang. Aduk hingga merata Bentuk daging menjadi bulatan pipih sesuai ukuran roti burger.  \n Panaskan sedikit minyak di wajan atau grill, kemudian masak patty hingga matang dan berwarna kecoklatan. Masak setiap sisi sekitar 3-4 menit, tergantung ketebalan daging.',
    star: 3.5,
    duration: 15,
    serving: 3,
    calories: 60,
    difficulty: Difficulty.hard,
    ingredients: [
      '250 gram daging sapi cincang',
      'Garam dan lada hitam secukupnya',
      '1 sdt bawang putih bubuk (opsional)',
      '1 sdt bawang bombay cincang halus (opsional)',
      '2 buah roti burger (bisa beli jadi atau buat sendiri)',
      'Topping sesuai selera (opsional)',
      'Sambal sesuai selera (opsional)',
    ],
    category: ['FastFood', 'Burger'],
  ),
  FoodModel(
    name: 'Noodles',
    image: 'assets/images/noodle.webp',
    direction:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    star: 5.0,
    duration: 20,
    serving: 3,
    calories: 100,
    difficulty: Difficulty.medium,
    ingredients: [
      'Rice',
      'Noodles',
      'Meat',
    ],
    category: ['FastFood', 'Noodles'],
  ),
  FoodModel(
    name: 'Salad',
    image: 'assets/images/salad.jpg',
    direction:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    star: 4.0,
    duration: 10,
    serving: 3,
    calories: 80,
    difficulty: Difficulty.easy,
    ingredients: [
      'Rice',
      'Noodles',
      'Meat',
    ],
    category: ['FastFood', 'Salad'],
  ),
  FoodModel(
    name: 'Steak',
    image: 'assets/images/steak.jpg',
    direction:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    star: 5.0,
    duration: 25,
    serving: 3,
    calories: 200,
    difficulty: Difficulty.hard,
    ingredients: [
      'Rice',
      'Noodles',
      'Meat',
    ],
    category: ['FastFood', 'Steak'],
  ),
  FoodModel(
    name: 'Pasta',
    image: 'assets/images/pasta.jpg',
    direction:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    star: 3.5,
    duration: 15,
    serving: 3,
    calories: 100,
    difficulty: Difficulty.medium,
    ingredients: [
      'Rice',
      'Noodles',
      'Meat',
    ],
    category: ['FastFood', 'Pasta'],
  ),
];
