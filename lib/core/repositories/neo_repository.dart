import '../models/neows.dart';
import '../services/neo_api_service.dart';

class NeoRepository {
  final NeoApiService _neoApiService;

  NeoRepository({required NeoApiService neoApiService})
    : _neoApiService = neoApiService;

  Future<Neows> getNearEarthObjects() async {
    try {
      return await _neoApiService.getNearEarthObjects();
    } catch (e) {
      throw Exception('Repository error: Failed to get NEO data - $e');
    }
  }

  List<NearEarthObjects> filterHazardousObjects(
    List<NearEarthObjects> objects,
  ) {
    return objects
        .where((neo) => neo.isPotentiallyHazardousAsteroid ?? false)
        .toList();
  }

  List<NearEarthObjects> sortByClosestApproach(List<NearEarthObjects> objects) {
    final sortedObjects = List<NearEarthObjects>.from(objects);
    sortedObjects.sort((a, b) {
      final aDistance =
          a.closeApproachData?.isNotEmpty == true
              ? double.tryParse(
                a.closeApproachData!.first.missDistance?.kilometers ?? '0',
              )
              : double.infinity;
      final bDistance =
          b.closeApproachData?.isNotEmpty == true
              ? double.tryParse(
                b.closeApproachData!.first.missDistance?.kilometers ?? '0',
              )
              : double.infinity;
      return (aDistance ?? double.infinity).compareTo(
        bDistance ?? double.infinity,
      );
    });
    return sortedObjects;
  }

  List<NearEarthObjects> filterByDiameter(
    List<NearEarthObjects> objects,
    double minDiameter,
  ) {
    return objects.where((neo) {
      final diameter = neo.estimatedDiameter?.kilometers;
      if (diameter == null) return false;
      return (diameter.estimatedDiameterMax ?? 0) >= minDiameter;
    }).toList();
  }
}
