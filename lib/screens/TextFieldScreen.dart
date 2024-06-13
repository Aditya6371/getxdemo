import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TestFieldScreen extends StatefulWidget {
  const TestFieldScreen({super.key});

  @override
  State<TestFieldScreen> createState() => _TestFieldScreenState();
}

class _TestFieldScreenState extends State<TestFieldScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loanAmountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _yearsController = TextEditingController();
  final _monthsController = TextEditingController();

  String? _validateLoanAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the loan amount';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (double.parse(value) <= 0) {
      return 'Loan amount must be greater than zero';
    }
    return null;
  }

  String? _validateInterestRate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the interest rate';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (double.parse(value) <= 0 || double.parse(value) >= 100) {
      return 'Interest rate must be between 0 and 100';
    }
    return null;
  }

  String? _validateYears(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the number of years';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.parse(value) < 0) {
      return 'Number of years cannot be negative';
    }
    return null;
  }

  String? _validateMonths(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the number of months';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.parse(value) < 0 || int.parse(value) > 11) {
      return 'Number of months must be between 0 and 11';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _loanAmountController,
                decoration: const InputDecoration(labelText: 'Loan Amount'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _validateLoanAmount,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
              ),
              TextFormField(
                controller: _interestRateController,
                decoration:
                    const InputDecoration(labelText: 'Interest Rate (%)'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _validateInterestRate,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
              ),
              TextFormField(
                controller: _yearsController,
                decoration: const InputDecoration(labelText: 'Number of Years'),
                keyboardType: TextInputType.number,
                validator: _validateYears,
              ),
              TextFormField(
                controller: _monthsController,
                decoration:
                    const InputDecoration(labelText: 'Number of Months'),
                keyboardType: TextInputType.number,
                validator: _validateMonths,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Get.snackbar("Data Submitted", "Data is Proccessed");
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loanAmountController.dispose();
    _interestRateController.dispose();
    _yearsController.dispose();
    _monthsController.dispose();
    super.dispose();
  }
}
