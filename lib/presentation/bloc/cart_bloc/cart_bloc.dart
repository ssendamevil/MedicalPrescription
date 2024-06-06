import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/domain/entities/cart.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartEntity> medicament = [];

  CartBloc() : super(const CartState()) {
    on<AddMedicamentToCartEvent>(_onAddMedicamentToCart);
    on<ChangeItemCount>(_onChangeItemCount);
    on<RemoveMedicamentToCartEvent>(_onRemoveMedicamentFromCart);
    on<GetAllCartItemsEvent>(_onGetAllCartItems);
  }

  Future<void> _onAddMedicamentToCart(AddMedicamentToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    medicament = [...state.cartItems];
    if(!medicament.contains(event.cartEntity)){
      medicament.add(event.cartEntity);
    }
    BoxHelper.saveCartItem(CartEntity(event.cartEntity.id, event.cartEntity.medicamentEntity, event.cartEntity.itemCount));
    emit(state.copyOf(cartItems: medicament, cartStateType: CartStateType.success));
  }

  Future<void> _onChangeItemCount(ChangeItemCount event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    List<CartEntity> updatedMedicament = medicament.map((med) {
      if(med == event.cartEntity){
        med.itemCount = event.itemCount;
      }
      return med;
    }).toList();
    emit(state.copyOf(cartItems: updatedMedicament, cartStateType: CartStateType.success));
  }

  Future<void> _onRemoveMedicamentFromCart(RemoveMedicamentToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    medicament.remove(event.cartEntity);
    BoxHelper.deleteCartItem(event.cartEntity);
    emit(state.copyOf(cartItems: medicament, cartStateType: CartStateType.success));
  }

  FutureOr<void> _onGetAllCartItems(GetAllCartItemsEvent event, Emitter<CartState> emit) {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    BoxHelper.getCart();
    emit(state.copyOf(cartStateType: CartStateType.success));
  }
}
