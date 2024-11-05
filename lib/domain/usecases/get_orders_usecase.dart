import '../entities/order_model.dart';
import '../repository/order_repository.dart';

class GetOrdersUseCase {
  final OrderRepository repository;

  GetOrdersUseCase(this.repository);

  Future<List<OrderModel>> call(String? status) async {
    return await repository.getOrders(status);
  }
}