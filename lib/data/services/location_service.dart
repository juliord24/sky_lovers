import 'package:geolocator/geolocator.dart';

class LocationService {
  var permission = LocationPermission.denied;

  ///Contiene la lógica necesaria para obtener información geográfica del dispositivo del usuario
  Future<Position> determinePosition() async {
    bool serviceEnabled;

    // Comprobar si los servicios de ubicación están habilitados.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, no continúes
      // accediendo a la posición y solicita a los usuarios que
      // habiliten los servicios de ubicación.
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados, la próxima vez que inicies la app
        // se volverá a solicitar permisos.
        return Future.error('Los permisos de ubicación están denegados');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Los permisos están denegados permanentemente, manéjalo
      // adecuadamente.
      return Future.error(
          'Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.');
    }

    // Cuando llegamos aquí, los permisos están otorgados y podemos
    // continuar accediendo a la posición del dispositivo.
    return await Geolocator.getCurrentPosition();
  }

  Future<double> getLatitude() async {
    try {
      Position position = await determinePosition();
      return position.latitude;
    } catch (e) {
      throw Exception(e);
    }
  }

  void checkPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {}
    }
  }

  Future<double> getLongitude() async {
    try {
      Position position = await determinePosition();
      return position.longitude;
    } catch (e) {
      throw Exception(e);
    }
  }
}
