import '../models/product_model.dart';

class MockData {
  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        id: '1',
        name: 'Wireless Headphones',
        description: 'High quality wireless headphones with noise cancellation and 20 hours of battery life. Perfect for travel and work.',
        price: 99.99,
        category: 'Electronics',
        imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '2',
        name: 'Running Shoes',
        description: 'Lightweight and breathable running shoes designed for ultimate comfort and performance.',
        price: 75.50,
        category: 'Fashion',
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '3',
        name: 'Smart Watch',
        description: 'Keep track of your health, receive notifications, and look stylish with this modern smartwatch.',
        price: 199.00,
        category: 'Electronics',
        imageUrl: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '4',
        name: 'Denim Jacket',
        description: 'Classic denim jacket that never goes out of style. Durable and comfortable for everyday wear.',
        price: 55.00,
        category: 'Fashion',
        imageUrl: 'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '5',
        name: 'Coffee Maker',
        description: 'Start your morning right with this programmable coffee maker. Brews up to 12 cups.',
        price: 49.99,
        category: 'Home',
        imageUrl: 'https://images.unsplash.com/photo-1517668808822-9ebb02f2a0e6?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '6',
        name: 'Gaming Mouse',
        description: 'Ergonomic gaming mouse with customizable RGB lighting and high precision sensor.',
        price: 35.99,
        category: 'Electronics',
        imageUrl: 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?auto=format&fit=crop&w=500&q=60',
      ),
      ProductModel(
        id: '7',
        name: 'Cotton T-Shirt',
        description: '100% organic cotton t-shirt. Soft, breathable, and sustainably sourced.',
        price: 15.00,
        category: 'Fashion',
        imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '8',
        name: 'Desk Lamp',
        description: 'Modern LED desk lamp with adjustable brightness and color temperature settings.',
        price: 29.99,
        category: 'Home',
        imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '9',
        name: 'Yoga Mat',
        description: 'Non-slip yoga mat with alignment lines. Extra thick for maximum comfort during your practice.',
        price: 24.50,
        category: 'Sports',
        imageUrl: 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500&auto=format&fit=crop&q=60',
      ),
      ProductModel(
        id: '10',
        name: 'Water Bottle',
        description: 'Stainless steel insulated water bottle. Keeps drinks cold for 24 hours or hot for 12 hours.',
        price: 18.00,
        category: 'Sports',
        imageUrl: 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=500&auto=format&fit=crop&q=60',
      ),
    ];
  }
}
