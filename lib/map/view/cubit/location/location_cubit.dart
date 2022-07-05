import 'package:bloc/bloc.dart';
import 'package:free_fire_location/map/view/cubit/location/location_state.dart';
import 'package:free_fire_location/utils/location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  LocationService locationService = LocationService();
  late Position location;

  Future<void> setMapLocationState() async {
    try {
      location = await locationService.getLocation();

      emit.call(LocationEnabled(position: location));
    } catch (err) {
      emit.call(LocationDisabled());
    }
  }
}
