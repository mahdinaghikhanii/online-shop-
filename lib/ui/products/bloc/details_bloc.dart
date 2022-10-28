import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/exception.dart';
import '../../../data/entity/product_entity.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) async {
      if (event is DetailsButtonClickedAddToCart) {
        try {
          emit(DetailsAddToCartLoading());
          await Future.delayed(const Duration(seconds: 2));

          emit(DetailsAddToCartSuccess());
        } catch (e) {
          emit(DetailsAddToCartError(AppException()));
        }
      }
    });
  }
}
