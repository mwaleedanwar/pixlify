import 'package:get/get.dart';
import 'package:pixlify/components/images/images.dart';

class UpgradeToProController extends GetxController {
  int get selectedPlanIndex => _selectedPlanIndex.value;
  int get selectedPaymentMethodIndex => _selectedPaymentMethodIndex.value;
  RxInt _selectedPlanIndex = 3.obs;
  RxInt _selectedPaymentMethodIndex = 0.obs;
  final proBenefits = <String>[
    'Remove Ads',
    'Unlimited Photo Enhance',
    'Faster Processing Times',
    'Remove Watermarks',
    'High Resolution Downloads',
    'Customization Options',
    'Creative Filters and Styles',
    'Cloud Storage and Sync',
    'Priority Queue',
    'Priority Customer Support',
    'Priority Access to New Features',
    'Commercial Use Rights',
  ];

  final plans = <Plan>[
    Plan(
      duration: '1 Month',
      description: 'Pro access for 1 month',
      price: 5,
    ),
    Plan(
      duration: '3 Months',
      description: 'You save 10%',
      price: 14,
    ),
    Plan(
      duration: '6 Months',
      description: 'You save 20%',
      price: 24,
    ),
    Plan(
      duration: '12 Months',
      description: 'You save 30%',
      price: 40,
    ),
    Plan(
      duration: 'Lifetime',
      description: 'Limited time and offer',
      price: 120,
    ),
  ];

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
  void selectPlan(int index) {
    _selectedPlanIndex.value = index;
    update();
  }

  void selectPaymentMethod(int index) {
    _selectedPaymentMethodIndex.value = index;
    update();
  }
}

/// Class to hold the data regarding paid plans in the service
class Plan {
  String duration;
  String description;
  double price;
  Plan({
    required this.duration,
    required this.description,
    required this.price,
  });
}

/// Class to hold the data regarding available payment methods
class PaymentMethod {
  String image;
  String name;
  PaymentMethod({
    required this.image,
    required this.name,
  });
}
