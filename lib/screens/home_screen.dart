import 'package:flutter/material.dart';
import 'package:shopping_list/screens/item_screen.dart';

import '../item.dart';

List<Item> sampleItems = [
  Item("Apple", 5000, 20, Category.clothes),
  Item("Banana", 2000, 30, Category.accessaries),
  Item("Orange", 3000, 25, Category.books),
  Item("Mango", 4000, 15, Category.clothes),
  Item("Pineapple", 4500, 10, Category.accessaries),
  Item("Grapes", 3500, 18, Category.books),
  Item("Watermelon", 6000, 12, Category.clothes),
  Item("Papaya", 2500, 22, Category.accessaries),
  Item("Strawberry", 7000, 8, Category.books),
  Item("Cherry", 8000, 5, Category.clothes),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ၶူဝ်းၵုၼ်ႇယွႆႈ"),
        actions: [
          IconButton(
            onPressed: () async {
              final returnedValue = await
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => ItemScreen()));
              setState(() {
                sampleItems.add(returnedValue);
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500, mainAxisExtent: 100),
        itemCount: sampleItems.length,
        itemBuilder: (ctx, index) {
          final item = sampleItems[index];
          return Dismissible(
            key: ValueKey(item),
            onDismissed: (direction){
              setState(() {
                sampleItems.remove(item);
              });
            },
            child: Card(
              color: item.category.color.withAlpha(50),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.category.color,
                    child: Text(index.toString()),
                  ),
                  trailing: Text("${item.price} ၵျၢပ်ႈ"),
                  title: Text(item.name),
                  subtitle: Text("ၵိုတ်းဝႆႉထႅင်ႈ ${item.quantity} လုၵ်ႈ"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
