import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemofieldController extends GetxController {
  final loanAmountController = TextEditingController();
  final interestRateController = TextEditingController();
  final yearsController = TextEditingController();
  final monthsController = TextEditingController();

  final loanAmountError = ''.obs;
  final interestRateError = ''.obs;
  final yearsError = ''.obs;
  final monthsError = ''.obs;

  bool validate() {
    bool isValid = true;

    if (loanAmountController.text.isEmpty) {
      loanAmountError.value = 'Please enter the loan amount';
      isValid = false;
    } else if (double.tryParse(loanAmountController.text) == null) {
      loanAmountError.value = 'Please enter a valid number';
      isValid = false;
    } else if (double.parse(loanAmountController.text) <= 0) {
      loanAmountError.value = 'Loan amount must be greater than zero';
      isValid = false;
    } else {
      loanAmountError.value = '';
    }

    if (interestRateController.text.isEmpty) {
      interestRateError.value = 'Please enter the interest rate';
      isValid = false;
    } else if (double.tryParse(interestRateController.text) == null) {
      interestRateError.value = 'Please enter a valid number';
      isValid = false;
    } else if (double.parse(interestRateController.text) <= 0 ||
        double.parse(interestRateController.text) >= 100) {
      interestRateError.value = 'Interest rate must be between 0 and 100';
      isValid = false;
    } else {
      interestRateError.value = '';
    }

    if (yearsController.text.isEmpty) {
      yearsError.value = 'Please enter the number of years';
      isValid = false;
    } else if (int.tryParse(yearsController.text) == null) {
      yearsError.value = 'Please enter a valid number';
      isValid = false;
    } else if (int.parse(yearsController.text) < 0) {
      yearsError.value = 'Number of years cannot be negative';
      isValid = false;
    } else {
      yearsError.value = '';
    }

    if (monthsController.text.isEmpty) {
      monthsError.value = 'Please enter the number of months';
      isValid = false;
    } else if (int.tryParse(monthsController.text) == null) {
      monthsError.value = 'Please enter a valid number';
      isValid = false;
    } else if (int.parse(monthsController.text) < 0 ||
        int.parse(monthsController.text) > 11) {
      monthsError.value = 'Number of months must be between 0 and 11';
      isValid = false;
    } else {
      monthsError.value = '';
    }

    return isValid;
  }

  void processForm() {
    if (validate()) {
      final loanAmount = double.parse(loanAmountController.text);
      final interestRate = double.parse(interestRateController.text);
      final years = int.parse(yearsController.text);
      final months = int.parse(monthsController.text);

      final totalMonths = (years * 12) + months;

      Get.snackbar('Success',
          'Total loan period: $totalMonths months for $loanAmount amount at rate $interestRate');
    }
  }

  @override
  void dispose() {
    loanAmountController.dispose();
    interestRateController.dispose();
    yearsController.dispose();
    monthsController.dispose();
    super.dispose();
  }
}
