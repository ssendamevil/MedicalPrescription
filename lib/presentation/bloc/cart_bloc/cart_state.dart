part of 'cart_bloc.dart';

enum CartStateType{
  inProgress,
  success,
  failure,
  initial
}

@immutable
class CartState {

  final List<CartItemEntity> cartItems;
  final CartStateType state;

  const CartState({
    this.cartItems = const [],
    this.state = CartStateType.initial
  });


  CartState copyOf({
    List<CartItemEntity>? cartItems,
    CartStateType? cartStateType
  }) => CartState(
      cartItems: cartItems ?? this.cartItems,
      state: cartStateType ?? state
  );
}

