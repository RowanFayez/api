import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/product_provider.dart';
import '../../theme/custom_colors.dart';

class DetailsScreen extends StatefulWidget {
  final int productId;
  const DetailsScreen({required this.productId, Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(
      context,
      listen: false,
    ).selectProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProductProvider>(context);
    if (prov.loading || prov.selected == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final p = prov.selected!;
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                p.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(p.title, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8),
            Text(
              '\$${p.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: CustomColors.primary),
                onPressed: () {
                  // add to cart logic
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Center(child: Text('Continue')),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
