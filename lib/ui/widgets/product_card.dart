import 'package:flutter/material.dart';
import '../../data/models/product.dart';
import '../../core/constants.dart';
import '../screens/details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(productId: product.id),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(Constants.cardPadding),
          child: Column(
            children: [
              Image.network(product.image, height: 120, fit: BoxFit.cover),
              SizedBox(height: 8),
              Text(product.title, style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: 4),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
