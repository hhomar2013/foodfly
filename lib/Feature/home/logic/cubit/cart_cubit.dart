import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Feature/home/data/models/cart_model.dart';
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()){
    print("CartCubit Created! HashCode: ${this.hashCode}");
  }


  static CartCubit get(context) => BlocProvider.of(context);
  var deliveryAddressController = TextEditingController();
 late List<CartModel> cartItems = [
   CartModel(id: 1, name: 'Pizza', price: 10.0, quantity: 2),
   CartModel(id: 2, name: 'Burger', price: 5.0, quantity: 1),
   CartModel(id: 3, name: 'Salad', price: 8.0, quantity: 3),
   CartModel(id: 3, name: 'Watter', price: 5.0, quantity: 2),
 ];

  void addToCart(CartModel item) {
    cartItems.add(item);
    emit(AddToCartSuccess());
  }

  void removeFromCart(CartModel item) {
    cartItems.removeWhere((element) => element.id == item.id);
    print("Items count after delete: ${cartItems.length}");
    emit(RemoveFromCartSuccess(List.from(cartItems)));

    emit(CartInitial());
  }

  void updateQuantity(CartModel item, int newQuantity) {
    item.quantity = newQuantity;
    emit(UpdateQuantitySuccess());
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}

