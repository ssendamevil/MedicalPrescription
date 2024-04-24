import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:medical_prescription/domain/entities/cartItem.dart';
import 'package:medical_prescription/domain/entities/medicament.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartItemEntity> medicament = [];

  CartBloc() : super(const CartState()) {
    on<AddMedicamentToCartEvent>(_onAddMedicamentToCart);
    on<ChangeItemCount>(_onChangeItemCount);
  }

  Future<void> _onAddMedicamentToCart(AddMedicamentToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    medicament = [...state.cartItems];
    if(!medicament.contains(event.cartItemEntity)){
      medicament.add(event.cartItemEntity);
    }
    emit(state.copyOf(cartItems: medicament, cartStateType: CartStateType.success));
  }

  Future<void> _onChangeItemCount(ChangeItemCount event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    medicament.map((med) {
      if(med == event.cartItemEntity){
        print(med.itemCount);
        med.itemCount = event.itemCount;
      }
      print(1);
    });
    emit(state.copyOf(cartItems: medicament, cartStateType: CartStateType.success));
  }
}
