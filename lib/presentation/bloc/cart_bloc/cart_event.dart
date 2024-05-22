part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  const CartEvent();
}

class AddMedicamentToCartEvent extends CartEvent{
  final CartItemEntity cartItemEntity;

  const AddMedicamentToCartEvent(this.cartItemEntity);
}

class ChangeItemCount extends CartEvent{
  final CartItemEntity cartItemEntity;
  final int itemCount;

  const ChangeItemCount(this.cartItemEntity, this.itemCount);
}

class RemoveMedicamentToCartEvent extends CartEvent{
  final CartItemEntity cartItemEntity;

  const RemoveMedicamentToCartEvent(this.cartItemEntity);
}
