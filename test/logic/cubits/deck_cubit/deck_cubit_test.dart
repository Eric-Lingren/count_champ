// import 'package:bloc_test/bloc_test.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeckCubit', () {
    DeckCubit deckCubit;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      // deckCubit = DeckCubit();
    });
  // test(
  //       'The initial state for the CounterCubit is DeckState(deckRepository: [], isLoadingInitData: true, shuffledDeck: [])',
  //       () {
  //     expect(
  //         DeckCubit().state,
  //         DeckState(
  //             deckRepository: [],
  //             isLoadingInitData: true,
  //             shuffledDeck: const []));
  //   })  ;

    // var = [Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate', Instance of 'CardDataTemplate']

    // blocTest<DeckCubit, DeckState> (
    //     'The cubit should emit a CounterState(counterValue:1 wasIncremented: true when cubit.increment() function is called.',
    //     build: () => DeckCubit(),
    //     act: (deckCubit) => deckCubit.shuffleDeck(),
    //     expect: () => [52]
    // );

    // blocTest<CounterCubit, CounterState>(
    //     'The cubit should emit a CounterState(counterValue:-1 wasIncremented: false when cubit.decrement() function is called.',
    //     build: () => CounterCubit(),
    //     act: (counterCubit) => counterCubit.decrement(),
    //     expect: () => [CounterState(counterValue: -1, wasIncremented: false)]
    // );
  });
}
