import 'package:csv/csv.dart';
import 'package:free_fire_location/map/data/response_models/fire_info_response.dart';
import 'package:free_fire_location/map/models/fire_page.dart';

class FirePageResponse extends FirePage {
  FirePageResponse({required super.coordinatesList});

  factory FirePageResponse.fromCsv(dynamic csv) {
    final filteredCsv = const CsvToListConverter(eol: '\n').convert(csv);
    final List<MapInfoResponse> mapInfoList = [];

    for (int i = 1; i < filteredCsv.length; i++) {
      mapInfoList.add(MapInfoResponse.fromCsv(filteredCsv[i]));
    }

    return FirePageResponse(
      coordinatesList: mapInfoList,
    );
  }

  factory FirePageResponse.fromCsvList(List<dynamic> csvList) {
    List filteredList = [];
    final List<MapInfoResponse> mapInfoList = [];

    for (int i = 0; i < csvList.length; i++) {
      final filteredCsv =
          const CsvToListConverter(eol: '\n').convert(csvList[0].data);
      filteredCsv.removeAt(0);
      filteredList = [...filteredList, ...filteredCsv];
    }

    for (int i = 1; i < filteredList.length; i++) {
      mapInfoList.add(MapInfoResponse.fromCsv(filteredList[i]));
    }

    return FirePageResponse(
      coordinatesList: mapInfoList,
    );
  }
}
