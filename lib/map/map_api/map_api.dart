// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../configs/map_config.dart';
import '../models/directions_model.dart';
import '../models/place_autocomplete_model.dart';
import '../models/place_details_model.dart';

Future<Directions> getDirections(LatLng origin, LatLng destination) async {
  const url = 'https://maps.googleapis.com/maps/api/directions/json?';
  final response = await Dio().get<Map<String, dynamic>>(
    url,
    queryParameters: <String, String>{
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': ggMapKey,
    },
    options: Options(responseType: ResponseType.json),
  );
  final results = Directions.fromMap(response.data!);

  return results;
}

Future<List<PlaceAutocomplete>> getAutocomplete(
  String searchInput,
  String sessionToken,
  LatLng location,
) async {
  final url =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=address&language=vi&components=country:vn&location=${location.latitude},${location.longitude}&key=$ggMapKey&sessiontoken=$sessionToken';

  final response = await Dio().get<Map<String, dynamic>>(url);

  final places = List<Map<dynamic, dynamic>>.from(
    response.data!['predictions'] as List,
  )
      .map(
        (jsonMap) =>
            PlaceAutocomplete.fromJson(Map<String, dynamic>.from(jsonMap)),
      )
      .toList();

  return places;
}

Future<String> getAddress(LatLng position) async {
  final url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$ggMapKey';

  final response = await Dio().get<Map<String, dynamic>>(
    url,
    options: Options(responseType: ResponseType.json),
  );

  final formattedAddress = ((response.data!['results'] as List<dynamic>)[0]
          as Map<String, dynamic>)['formatted_address']
      .toString();

  return Future.value(formattedAddress);
}

Future<PlaceDetails> getPlaceDetails(String placeId) async {
  final url =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$ggMapKey';

  final response = await Dio().get<Map<String, dynamic>>(
    url,
    options: Options(responseType: ResponseType.json),
  );

  final results = response.data!['result'] as Map<String, dynamic>;

  return PlaceDetails.fromJson(results);
}

Future<String> getDuration(
  double fromLat,
  double fromLng,
  double toLat,
  double toLng,
) async {
  final url =
      'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$toLat,$toLng&origins=$fromLat,$fromLng&key=$ggMapKey';
  final response = await Dio().get<Map<String, dynamic>>(
    url,
    options: Options(responseType: ResponseType.json),
  );
  final duration =
      response.data!['rows'][0]['elements'][0]['duration']['text'] as String;

  return duration;
}
