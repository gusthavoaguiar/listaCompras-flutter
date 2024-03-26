import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingListHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingListHome extends StatefulWidget {
  @override
  _ShoppingListHomeState createState() => _ShoppingListHomeState();
}

class _ShoppingListHomeState extends State<ShoppingListHome> {
  final List<ShoppingItem> _shoppingItems = [];
  final TextEditingController _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _shoppingItems.length,
              itemBuilder: (context, index) {
                final item = _shoppingItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Price: ${item.price}'),
                  leading: Checkbox(
                    value: item.isPurchased,
                    onChanged: (value) {
                      setState(() {
                        item.isPurchased = value!;
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _shoppingItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _itemController,
              decoration: InputDecoration(
                hintText: 'Add a new item',
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              setState(() {
                final newItem = ShoppingItem(
                  name: _itemController.text,
                  price: 0.0,
                  isPurchased: false,
                );
                _shoppingItems.add(newItem);
                _itemController.clear();
              });
            },
            child: Text(
              "Add Item",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingItem {
  final String name;
  double price;
  bool isPurchased;

  ShoppingItem({
    required this.name,
    required this.price,
    this.isPurchased = false,
  });
}
