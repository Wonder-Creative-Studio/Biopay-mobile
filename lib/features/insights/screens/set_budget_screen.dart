import 'package:biopay_mobile/widgets/basic_app_bar.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetBudgetScreen extends StatefulWidget {
  const SetBudgetScreen({super.key});

  @override
  State<SetBudgetScreen> createState() => _SetBudgetScreenState();
}

class _SetBudgetScreenState extends State<SetBudgetScreen> {
  final TextEditingController _foodController = TextEditingController(
    text: '10,000',
  );
  final TextEditingController _shoppingController = TextEditingController(
    text: '20,000',
  );
  final TextEditingController _rechargeController = TextEditingController(
    text: '2,500',
  );
  final TextEditingController _travelController = TextEditingController(
    text: '15,000',
  );

  double _totalBudget = 50000.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalBudget();

    // Add listeners to update total budget when values change
    _foodController.addListener(_calculateTotalBudget);
    _shoppingController.addListener(_calculateTotalBudget);
    _rechargeController.addListener(_calculateTotalBudget);
    _travelController.addListener(_calculateTotalBudget);
  }

  @override
  void dispose() {
    _foodController.dispose();
    _shoppingController.dispose();
    _rechargeController.dispose();
    _travelController.dispose();
    super.dispose();
  }

  void _calculateTotalBudget() {
    double food = _parseAmount(_foodController.text);
    double shopping = _parseAmount(_shoppingController.text);
    double recharge = _parseAmount(_rechargeController.text);
    double travel = _parseAmount(_travelController.text);

    setState(() {
      _totalBudget = food + shopping + recharge + travel;
    });
  }

  double _parseAmount(String text) {
    if (text.isEmpty) return 0;
    // Remove commas and convert to double
    return double.tryParse(text.replaceAll(',', '')) ?? 0;
  }

  String _formatAmount(double amount) {
    // Format with commas
    return amount
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: BasicAppBar(title: "Set Budget"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manage your monthly budget by setting limits for each category to stay on track.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Food Budget
              _buildBudgetField('Food', _foodController),
              const SizedBox(height: 16),

              // Shopping Budget
              _buildBudgetField('Shopping', _shoppingController),
              const SizedBox(height: 16),

              // Recharge Budget
              _buildBudgetField('Recharge', _rechargeController),
              const SizedBox(height: 16),

              // Travel Budget
              _buildBudgetField('Travel', _travelController),
              const SizedBox(height: 32),

              // Total Budget
              Text(
                'Overall Budget for the Month: ₹${_formatAmount(_totalBudget)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 48),
              CustomFilledButton(onPressed: () {}, title: 'Save Budget'),

              const SizedBox(height: 16),
              CustomFilledButton(
                onPressed: () {},
                title: 'Cancel',
                backgroundColor: Color(0xFF1A1A1A),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            prefixText: '₹',
            prefixStyle: const TextStyle(color: Colors.white, fontSize: 18),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[800]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TextInputFormatter.withFunction((oldValue, newValue) {
              if (newValue.text.isEmpty) {
                return newValue;
              }
              final double value = double.parse(newValue.text);
              final String formatted = _formatAmount(value);
              return TextEditingValue(
                text: formatted,
                selection: TextSelection.collapsed(offset: formatted.length),
              );
            }),
          ],
        ),
      ],
    );
  }
}
