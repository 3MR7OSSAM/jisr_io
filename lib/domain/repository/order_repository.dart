import '../entities/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getOrders(String? status);
}