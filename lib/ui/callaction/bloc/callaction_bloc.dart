import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/product.dart';

part 'callaction_event.dart';
part 'callaction_state.dart';

class CallactionBloc extends Bloc<CallactionEvent, CallactionState> {
  CallactionBloc() : super(CallactionLoading()) {
    on<CallactionEvent>((event, emit) {
      if (event is CallactionStarted) {
        try {
          emit(CallactionLoading());
          if (event.selectedCategoryOrAllProduct == "products") {
          } else {}
        } catch (e) {
          emit(CallactionError(AppException()));
        }
      }
    });
  }
}
