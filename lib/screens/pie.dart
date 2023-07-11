import 'package:flutter/material.dart';

enum Category { all, iceCream, donut, pie }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Category selectedCategory = Category.all;

  List<CategoryButtonData> categoryButtons = [
    CategoryButtonData(Category.all, 'All'),
    CategoryButtonData(Category.iceCream, 'Ice Cream'),
    CategoryButtonData(Category.donut, 'Donut'),
    CategoryButtonData(Category.pie, 'Pie'),
  ];

  List<Widget> categoryWidgets = [
    Container(),
    buildCategoryWidget('Donut', 'lib/images/image0.png'),
    buildCategoryWidget('Ice Cream', 'lib/images/image1.png'),
    buildCategoryWidget('Pie', 'lib/images/image2.png'),
  ];

  static Widget buildCategoryWidget(String categoryName, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Handle image tap
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Text(
              categoryName,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Demo'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categoryButtons
                .map((buttonData) => buildCategoryButton(
              buttonData.category,
              buttonData.label,
            ))
                .toList(),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: categoryWidgets,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(Category category, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: selectedCategory == category ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CategoryButtonData {
  final Category category;
  final String label;

  CategoryButtonData(this.category, this.label);
}
