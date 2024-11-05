import 'package:bloc/bloc.dart';
import '../../../../domain/entities/order_model.dart';
import '../../../../domain/usecases/get_orders_usecase.dart';
import 'order_status_state.dart';

// presentation/cubit/order_status_cubit.dart
class OrderStatusCubit extends Cubit<OrderState> {
  final GetOrdersUseCase getOrdersUseCase;

  OrderStatusCubit(this.getOrdersUseCase) : super(const OrderState()) {
    _initializeOrders();
  }

  Future<void> _initializeOrders() async {
    final orders = await getOrdersUseCase(null);
    emit(state.copyWith(filteredOrders: orders));
  }

  Future<void> setSelectedStatus(String? newStatus) async {
    final filteredOrders = await getOrdersUseCase(newStatus == 'All' ? null : newStatus);
    emit(state.copyWith(selectedStatus: newStatus, filteredOrders: filteredOrders));
  }
}
