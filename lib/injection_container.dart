import 'package:get_it/get_it.dart';
import 'package:hba/bloc/book_room/book_room_cubit.dart';
import 'package:hba/bloc/reservations/reservation_cubit.dart';
import 'package:hba/bloc/search/search_cubit.dart';
import 'package:hba/core/localization/changelocal.dart';
import 'package:hba/data/data_provider/book_room_provider.dart';
import 'package:hba/data/data_provider/hotel_provider.dart';
import 'package:hba/data/data_provider/reservations_provider.dart';
import 'package:hba/data/data_provider/room_provider.dart';
import 'package:hba/data/data_provider/search_provider.dart';
import 'package:hba/data/repository/book_room_repository.dart';
import 'package:hba/data/repository/hotel_repository.dart';
import 'package:hba/data/repository/reservation_repository.dart';
import 'package:hba/data/repository/room_repository.dart';
import 'package:hba/data/repository/search_repository.dart';
import 'package:hba/view/screen/home/filters/search_filter_cubit.dart';
import 'bloc/auth/auth_cubit.dart';
import 'bloc/profile/profile_cubit.dart';
import 'data/data_provider/auth_provider.dart';
import 'data/data_provider/profile_provider.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/profile_repository.dart';

final sl = GetIt.instance;

void initInjection() {
  //cubit
  sl.registerLazySingleton(() => AuthCubit());
  sl.registerLazySingleton(() => ProfileCubit());
  sl.registerLazySingleton(() => BookRoomCubit());
  sl.registerLazySingleton(() => SearchFilterCubit());
  sl.registerLazySingleton(() => SearchCubit());
  sl.registerLazySingleton(() => ReservationCubit());

  //Getx
  sl.registerLazySingleton(() => LocaleController());

  //repos
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => ProfileRepository(sl()));
  sl.registerLazySingleton(() => HotelRepository(sl()));
  sl.registerLazySingleton(() => RoomRepository(sl()));
  sl.registerLazySingleton(() => BookRoomRepository(sl()));
  sl.registerLazySingleton(() => SearchRepository(sl()));
  sl.registerLazySingleton(() => ReservationRepository(sl(), sl(), sl()));

  //data_provider
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerLazySingleton(() => ProfileProvider());
  sl.registerLazySingleton(() => HotelProvider());
  sl.registerLazySingleton(() => RoomProvider());
  sl.registerLazySingleton(() => BookRoomProvider());
  sl.registerLazySingleton(() => SearchProvider());
  sl.registerLazySingleton(() => ReservationProvider());
}
