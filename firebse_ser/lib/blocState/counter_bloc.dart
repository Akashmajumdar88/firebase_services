import 'package:bloc/bloc.dart';
import 'package:firebse_ser/blocState/counter_event.dart';
import 'package:firebse_ser/blocState/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }
  void _increment(IncrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter +1));
    print("${state.counter}---------increment value");
  }
  void _decrement(DecrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter -1));
    print("${state.counter}----------decrement value");
  }
}
