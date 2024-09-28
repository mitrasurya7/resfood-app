import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resfood_app/main.dart';
import 'package:resfood_app/models/category_model.dart';
import 'package:resfood_app/models/food_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categoryName = 'Popular';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                          'https://images.unsplash.com/photo-1544005313-94ddf0286df2'),
                    ),
                    IconButton(
                      onPressed: () {
                        if (Theme.of(context).brightness == Brightness.dark) {
                          themeStream.changeTheme(ThemeMode.light);
                        } else {
                          themeStream.changeTheme(ThemeMode.dark);
                        }
                      },
                      icon: FaIcon(
                        Theme.of(context).brightness == Brightness.dark
                            ? FontAwesomeIcons.moon
                            : FontAwesomeIcons.sun,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Halo, welcome back!',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Make Your Healty Food',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Stay At ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xffFFD634),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  hintText: 'Search any recipe',
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  suffixIcon: const Icon(Icons.mic, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth <= 1000) {
                  return _buildMobileScreen(context);
                } else {
                  return _buildDesktopScreen(context);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileScreen(BuildContext context, {bool desktop = false}) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: desktop ? true : false,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: categories.map((CategoryModel category) {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100.0,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: _categoryName == category.name
                              ? const Color(0xffFFD634)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _categoryName = category.name;
                              });
                            },
                            icon: Icon(
                              category.icon,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Text(
                      category.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15.0),
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Popular Recipes',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: desktop ? 3 : 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final food = foods[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: food);
              },
              child: Card(
                elevation: 5.0,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Stack(children: [
                          Image.asset(
                            food.image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 10.0,
                            left: 10.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black54,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: 12.0,
                                  ),
                                  const SizedBox(
                                    width: 2.0,
                                  ),
                                  Text(
                                    '${food.duration.toString()} min',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10.0,
                              right: 10.0,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffFFD634),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.black,
                                        size: 12.0,
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        food.star.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  )))
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            Text(
                              food.category.join(', '),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 8.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDesktopScreen(BuildContext context) {
    return _buildMobileScreen(context, desktop: true);
  }
}
