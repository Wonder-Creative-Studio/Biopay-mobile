import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';
import '../widgets/card_item_widget.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Cards',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(Routes.addCardScreen);
        },
        label: const Text('Add New Card'),
        icon: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Primary Card',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Assuming dark theme
                ),
              ),
              const SizedBox(height: 16),
              CardItemWidget(
                balance: '\$5,750,20',
                cardNumber: '5282 3456 7890 1289',
                expiryDate: '09/25',
                cardColor: Colors.deepPurple, // Example color
              ),
              const SizedBox(height: 32),
              const Text(
                'Other Cards',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Assuming dark theme
                ),
              ),
              const SizedBox(height: 16),
              CarouselSlider(
                items: [
                  CardItemWidget(
                    balance: '\$5,750,20',
                    cardNumber: '5282 3456 7890 1289',
                    expiryDate: '09/25',
                    cardColor: Colors.green, // Example color
                  ),
                  CardItemWidget(
                    balance: '\$5,750,20',
                    cardNumber: '5282 3456 7890 1289',
                    expiryDate: '09/25',
                    cardColor: Colors.blue, // Example color
                  ),
                ],
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: false,
                  viewportFraction: 0.95,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
