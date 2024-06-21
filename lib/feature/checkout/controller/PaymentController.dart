import 'package:get/get.dart';

enum PaymentOption { totalPayment, minimalCharges }

class PaymentController extends GetxController {
  var selectedOption = PaymentOption.totalPayment.obs;
  int amountFlag = 0;
  double selected_amount = 0.0;
  int get getamountFlag => amountFlag;
   double get getselected_amount => selected_amount;
  void setSelectedOption(PaymentOption option) {
    selectedOption.value = option;
  }
}
