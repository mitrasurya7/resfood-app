import 'package:flutter/material.dart';
import 'package:resfood_app/models/food_model.dart';

class DetailFoodScreen extends StatelessWidget {
  const DetailFoodScreen({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 1000) {
            return _buildMobileScreen(context);
          } else {
            return _buildDesktopScreen(context);
          }
        },
      ),
    );
  }

  Widget _buildMobileScreen(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Hero(
            tag: food.image,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to bookmark'),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.bookmark_add_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildFoodHeader(),
                  const SizedBox(height: 20),
                  _buildInformationRow(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Ingredients'),
                  _buildIngredientsList(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Directions'),
                  Text(
                    food.direction,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopScreen(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: food.image,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFoodHeader(),
                const SizedBox(height: 20),
                _buildInformationRow(),
                const SizedBox(height: 20),
                _buildSectionTitle('Ingredients'),
                _buildIngredientsList(),
                const SizedBox(height: 20),
                _buildSectionTitle('Directions'),
                Text(
                  food.direction,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              food.category.join(', '),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffFFD634),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                food.star.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInformationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InformationDetail(
          foodData: food.duration.toString(),
          iconProject: Icons.timer,
          initialText: 'min',
        ),
        InformationDetail(
          foodData: food.serving.toString(),
          iconProject: Icons.people_alt,
          initialText: 'servings',
        ),
        InformationDetail(
          foodData: food.calories.toString(),
          iconProject: Icons.fireplace,
          initialText: 'Cal',
        ),
        InformationDetail(
          foodData: food.difficulty.name,
          iconProject: Icons.layers,
          initialText: 'level',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildIngredientsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: food.ingredients.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.circle,
            size: 10,
            color: Colors.yellow,
          ),
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            food.ingredients[index],
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}

class InformationDetail extends StatelessWidget {
  const InformationDetail({
    super.key,
    required this.foodData,
    required this.iconProject,
    required this.initialText,
  });

  final String foodData;
  final IconData iconProject;
  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xffFFD634),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              iconProject,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            foodData,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            initialText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
