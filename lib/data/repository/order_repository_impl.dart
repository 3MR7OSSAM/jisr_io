import '../../domain/entities/order_model.dart';
import '../../domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<List<OrderModel>> getOrders(String? status) async {
    return _mockOrders.where((order) => status == null || order.status == status).toList();
  }

  final List<OrderModel> _mockOrders = [
    OrderModel(orderId: "320965629", code: "9966", paymentStatus: "Paid", amount: 37.6, status: "Completed", deliveryService: "Jahez", orderSource: 'Marsoul'),
    OrderModel(orderId: "320965630", code: "8765", paymentStatus: "Paid", amount: 45.0, status: "Rejected", deliveryService: "Mrsool", orderSource: 'Marsoul'),
    OrderModel(orderId: "320965631", code: "4321", paymentStatus: "Paid", amount: 29.9, status: "Completed", deliveryService: "Hunger", orderSource: 'Marsoul'),
  ];
}