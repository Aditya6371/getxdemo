import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controller/demoField_controller.dart';

class TestFieldScreen extends StatefulWidget {
  const TestFieldScreen({super.key});

  @override
  State<TestFieldScreen> createState() => _TestFieldScreenState();
}

class _TestFieldScreenState extends State<TestFieldScreen> {
 final DemofieldController controller = Get.put(DemofieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Fields'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Obx(() => TextFormField(
              controller: controller.loanAmountController,
              decoration: InputDecoration(
                labelText: 'Loan Amount',
                errorText: controller.loanAmountError.value.isEmpty ? null : controller.loanAmountError.value,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            )),
            Obx(() => TextFormField(
              controller: controller.interestRateController,
              decoration: InputDecoration(
                labelText: 'Interest Rate (%)',
                errorText: controller.interestRateError.value.isEmpty ? null : controller.interestRateError.value,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            )),
            Obx(() => TextFormField(
              controller: controller.yearsController,
              decoration: InputDecoration(
                labelText: 'Number of Years',
                errorText: controller.yearsError.value.isEmpty ? null : controller.yearsError.value,
              ),
              keyboardType: TextInputType.number,
            )),
            Obx(() => TextFormField(
              controller: controller.monthsController,
              decoration: InputDecoration(
                labelText: 'Number of Months',
                errorText: controller.monthsError.value.isEmpty ? null : controller.monthsError.value,
              ),
              keyboardType: TextInputType.number,
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.processForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}