import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_webservice/places.dart';

final places = GoogleMapsPlaces(apiKey: dotenv.get('GOOGLE_MAPS_API_KEY'),);
