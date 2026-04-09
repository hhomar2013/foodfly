part of 'cart_cubit.dart';

sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {}

class CartError extends CartState {
  final String error;

  CartError(this.error);
}


class AddToCartSuccess extends CartState {}
class RemoveFromCartSuccess extends CartState {
  final List<CartModel> cartItems;
  RemoveFromCartSuccess(this.cartItems);
}
class UpdateQuantitySuccess extends CartState {}