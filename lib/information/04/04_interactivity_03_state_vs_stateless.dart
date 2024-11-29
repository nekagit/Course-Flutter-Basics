import 'package:flutter/material.dart';

// Example 1: Widget Variables (final variables in StatelessWidget)
class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add error handling for network image
          Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
          ),
          Text(productName),
          Text('\$${price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  final String customerName;

  const ShoppingCart({
    super.key,
    required this.customerName,
  });

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}


// Example 3: Mixing both in a practical example
class UserProfile extends StatefulWidget {
  final String userId;
  final String role;

  const UserProfile({
    super.key,
    required this.userId,
    required this.role,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _isEditing = false;
  String _displayName = '';
  String _bio = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Simulate API call
    setState(() {
      _displayName = 'User ${widget.userId}';
      _bio = 'Default bio for ${widget.role}';
    });
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('User ID: ${widget.userId}'),
            Text('Role: ${widget.role}'),
            _isEditing
                ? TextField(
              controller: TextEditingController(text: _displayName),
              onChanged: (value) {
                setState(() {
                  _displayName = value;
                });
              },
            )
                : Text('Display Name: $_displayName'),
            Text('Bio: $_bio'),
            ElevatedButton(
              onPressed: _toggleEdit,
              child: Text(_isEditing ? 'Save' : 'Edit'),
            ),
          ],
        ),
      ),
    );
  }
}


class _ShoppingCartState extends State<ShoppingCart> {
  int _itemCount = 0;
  double _totalPrice = 0.0;
  List<String> _items = [];

  // Controllers for the text input fields
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void addItem() {
    // Get the item name and price from text controllers
    String itemName = _itemController.text.trim();
    String priceText = _priceController.text.trim();

    // Validate input
    if (itemName.isEmpty || priceText.isEmpty) {
      // Show an error dialog if inputs are empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter both item name and price.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Try to parse the price
    double? price;
    try {
      price = double.parse(priceText);
    } catch (e) {
      // Show an error dialog if price is not a valid number
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Price'),
          content: const Text('Please enter a valid number for the price.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Add the item using setState
    setState(() {
      _items.add(itemName);
      _itemCount++;
      _totalPrice += price!;
    });

    // Clear the text controllers after adding the item
    _itemController.clear();
    _priceController.clear();
  }

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    _itemController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Shopping Cart for ${widget.customerName}'),
            Text('Items: $_itemCount'),
            Text('Total: \$${_totalPrice.toStringAsFixed(2)}'),

            // Input fields for adding new items
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      hintText: 'Item Name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addItem,
                ),
              ],
            ),

            // Use SizedBox or limited height for ListView
            SizedBox(
              height: 100, // Fixed height
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example usage in main app
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Widget Examples')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Using StatelessWidget with widget variables
                const ProductCard(
                  productName: 'Flutter Book',
                  price: 29.99,
                  imageUrl: 'https://via.placeholder.com/150', // Use a placeholder
                ),

                // Using StatefulWidget with both types of variables
                const UserProfile(
                  userId: 'U123',
                  role: 'Admin',
                ),

                // Using StatefulWidget with state management
                const ShoppingCart(
                  customerName: 'John Doe',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}