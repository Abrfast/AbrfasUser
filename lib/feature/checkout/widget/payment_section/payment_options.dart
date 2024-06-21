import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';
import '../../controller/PaymentController.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final double minPrice;
  final double maxPrice;

  PaymentOptionsScreen(
      {super.key, required this.minPrice, required this.maxPrice});
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
        child: Column(
          children: <Widget>[
            Obx(() => ListTile(
                  title: Text('Pay Total Payment Rs. ${maxPrice}',
                      style: ubuntuRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  leading: Radio<PaymentOption>(
                    value: PaymentOption.totalPayment,
                    groupValue: paymentController.selectedOption.value,
                    onChanged: (PaymentOption? value) {
                      if (value != null) {
                        paymentController.setSelectedOption(value);
                        paymentController.amountFlag = 0;
                        paymentController.selected_amount = maxPrice;
                        print(value);
                      }
                    },
                  ),
                )),
            Obx(() => ListTile(
                  title: Text('Pay Minimal Charges Rs. ${minPrice}',
                      style: ubuntuRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  leading: Radio<PaymentOption>(
                    value: PaymentOption.minimalCharges,
                    groupValue: paymentController.selectedOption.value,
                    onChanged: (PaymentOption? value) {
                      if (value != null) {
                        paymentController.setSelectedOption(value);
                        paymentController.amountFlag = 1;
                        paymentController.selected_amount = minPrice;
                        print(value);
                      }
                    },
                  ),
                )),
          ],
        ));
  }
}
