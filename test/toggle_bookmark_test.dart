import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/use_cases/toggle_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_list_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'toggle_bookmark_test.mocks.dart';

// generate the mocks for use case
@GenerateMocks([ToggleBookmarkUC, GetListBookmarkUC, GetSofUserUC])
void main() {
  late HomeBloc homeBloc;
  late MockToggleBookmarkUC mockToggleBookmarkUC;
  late MockGetListBookmarkUC mockGetListBookmarkUC;
  late MockGetSofUserUC mockGetSofUserUC;

  final mockUserModel = UserModel(
    id: 1,
    displayName: 'Test 1',
  );

  setUp(() {
    // init mocks
    mockToggleBookmarkUC = MockToggleBookmarkUC();
    mockGetListBookmarkUC = MockGetListBookmarkUC();
    mockGetSofUserUC = MockGetSofUserUC();

    // create HomeBloc
    homeBloc = HomeBloc(
      toggleBookmarkUC: mockToggleBookmarkUC,
      getListBookmarkUC: mockGetListBookmarkUC,
      getSofUserUC: mockGetSofUserUC,
    );
  });

  // close the bloc after each test
  tearDown(() {
    homeBloc.close();
  });

  blocTest<HomeBloc, HomeState>(
    'ToggleBookmarkEvent is successful => emits [HandleBookmarkLoading, CombineBookmarkSuccess]',
    build: () {
      // toggle bookmark => true
      when(mockToggleBookmarkUC.call(user: anyNamed('user')))
          .thenAnswer((_) async => Future.value(true));

      // get list bookmarks => []
      when(mockGetListBookmarkUC.call())
          .thenAnswer((_) async => Future.value([]));

      return homeBloc;
    },
    act: (bloc) => bloc.add(ToggleBookmarkEvent(user: mockUserModel)),
    expect: () => [
      isA<HandleBookmarkLoading>(),
      isA<CombineBookmarkSuccess>(),
    ],
    verify: (_) {
      // verify
      verify(mockToggleBookmarkUC.call(user: anyNamed('user'))).called(1);
      verify(mockGetListBookmarkUC.call()).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'ToggleBookmarkEvent fails => emits [HandleBookmarkLoading, HomeError]',
    build: () {
      // toggle bookmark => error
      when(mockToggleBookmarkUC.call(user: anyNamed('user')))
          .thenAnswer((_) async => Future.value(false));

      return homeBloc;
    },
    act: (bloc) => bloc.add(ToggleBookmarkEvent(user: mockUserModel)),
    expect: () => [
      isA<HandleBookmarkLoading>(),
      isA<HomeError>(),
    ],
    verify: (_) {
      // verify
      verify(mockToggleBookmarkUC.call(user: anyNamed('user'))).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'When an exception is thrown => emits [HandleBookmarkLoading, HomeError] ',
    build: () {
      // toggle bookmark => exception
      when(mockToggleBookmarkUC.call(user: anyNamed('user')))
          .thenThrow(Exception('Bookmark error'));

      return homeBloc;
    },
    act: (bloc) => bloc.add(ToggleBookmarkEvent(user: mockUserModel)),
    expect: () => [
      isA<HandleBookmarkLoading>(),
      isA<HomeError>(),
    ],
    verify: (_) {
      // verify
      verify(mockToggleBookmarkUC.call(user: anyNamed('user'))).called(1);
    },
  );
}
