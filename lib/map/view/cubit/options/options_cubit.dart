import 'package:bloc/bloc.dart';
import 'package:free_fire_location/map/view/widgets/controls/map_type_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'options_state.dart';

class OptionsCubit extends Cubit<MapType> {
  MapType mapType = MapType.normal;
  OptionsCubit() : super(MapType.normal);

  void changeMapType(MapType type) {
    mapType = type;

    emit.call(mapType);
  }
}
