import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:hba/core/enum.dart';

class PaypalPaymentDemo extends StatelessWidget {
  const PaypalPaymentDemo({super.key, required this.item, required this.total});
  final Map<String, dynamic> item;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AXbCmDdrXK5lDdotXMRtSDK_SUP9POWMimltMImuiua6WdlyAIQ7FaRPLWCcfcktAu_Kodq67hXD77ct",
        secretKey:
            "EIiiaB5jN6cVZirQAEpA_0MqpDLVIGd09Z9_b-_b_81YDjBE2PUiUjYEryqbMLEBdL2FyWleZ-sYuHJM",
        transactions: [
          {
            "amount": {
              "total": total.toString(),
              "currency": "USD",
              "details": {
                "subtotal": total.toString(),
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                item,
                // {
                //   "name": "Apple",
                //   "quantity": 4,
                //   "price": '10',
                //   "currency": "USD"
                // },
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context, PaymentStatus.SUCCESS);
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context, PaymentStatus.ERROR);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context, PaymentStatus.CANCELED);
        },
      ),
    );
  }
}
