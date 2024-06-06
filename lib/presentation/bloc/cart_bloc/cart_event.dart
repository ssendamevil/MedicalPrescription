part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  const CartEvent();
}

class AddMedicamentToCartEvent extends CartEvent{
  final CartEntity cartEntity;

  const AddMedicamentToCartEvent(this.cartEntity);
}

class ChangeItemCount extends CartEvent{
  final CartEntity cartEntity;
  final int itemCount;

  const ChangeItemCount(this.cartEntity, this.itemCount);
}

class RemoveMedicamentToCartEvent extends CartEvent{
  final CartEntity cartEntity;

  const RemoveMedicamentToCartEvent(this.cartEntity);
}

class GetAllCartItemsEvent extends CartEvent{

  const GetAllCartItemsEvent();
}
