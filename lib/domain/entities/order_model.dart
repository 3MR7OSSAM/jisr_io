class OrderModel {
  final String orderId;
  final String orderSource;
  final String code;
  final String? timeLeft;
  final String deliveryService;
  final String status;
  final String paymentStatus;
  final double amount;

  OrderModel({
    required this.orderId,
    required this.orderSource,
    required this.code,
     this.timeLeft,
    required this.deliveryService,
    required this.status,
    required this.paymentStatus,
    required this.amount,
  });
}
