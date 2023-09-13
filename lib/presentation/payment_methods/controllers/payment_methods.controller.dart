import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/images/images.dart';

class PaymentMethodsController extends GetxController {
  final cardHolderName = TextEditingController();
  final cardNumber = TextEditingController();
  final cardCVV = TextEditingController();
  DateTime? cardExpiryDate;

  final paymentMethods = <PaymentMethod>[
    PaymentMethod(
      image: Images.paypalIcon,
      name: 'PayPal',
    ),
    PaymentMethod(
      image: Images.googlePayIcon,
      name: 'Google Pay',
    ),
    PaymentMethod(
      image: Images.applePayIcon,
      name: 'Apple Pay',
    ),
    PaymentMethod(
      image: Images.visaIcon,
      name: '•••• •••• •••• •••• 5567',
    ),
    PaymentMethod(
      image: Images.americanExpressIcon,
      name: '•••• •••• •••• •••• 8456',
    ),
  ];
  final masterCard = PaymentMethod(
    image: Images.masterCardIcon,
    name: '•••• •••• •••• •••• 4679',
  );
  void addPaymentMethod() {
    paymentMethods.add(masterCard);
    update();
  }

  void enterExpiryDate(DateTime expDate) {
    cardExpiryDate = expDate;
    update();
  }
}

class PaymentMethod {
  String image;
  String name;
  PaymentMethod({
    required this.image,
    required this.name,
  });
}
