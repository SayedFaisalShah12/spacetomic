// All the model classes you provided
class Neows {
  Links? links;
  Page? page;
  List<NearEarthObjects>? nearEarthObjects;

  Neows({this.links, this.page, this.nearEarthObjects});

  Neows.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
    if (json['near_earth_objects'] != null) {
      nearEarthObjects = <NearEarthObjects>[];
      json['near_earth_objects'].forEach((v) {
        nearEarthObjects!.add(NearEarthObjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (page != null) {
      data['page'] = page!.toJson();
    }
    if (nearEarthObjects != null) {
      data['near_earth_objects'] =
          nearEarthObjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? next;
  String? self;

  Links({this.next, this.self});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['next'] = next;
    data['self'] = self;
    return data;
  }
}

class Page {
  int? size;
  int? totalElements;
  int? totalPages;
  int? number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  Page.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    totalElements = json['total_elements'];
    totalPages = json['total_pages'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['size'] = size;
    data['total_elements'] = totalElements;
    data['total_pages'] = totalPages;
    data['number'] = number;
    return data;
  }
}

class NearEarthObjects {
  Links? links;
  String? id;
  String? neoReferenceId;
  String? name;
  String? nameLimited;
  String? designation;
  String? nasaJplUrl;
  double? absoluteMagnitudeH;
  EstimatedDiameter? estimatedDiameter;
  bool? isPotentiallyHazardousAsteroid;
  List<CloseApproachData>? closeApproachData;
  OrbitalData? orbitalData;
  bool? isSentryObject;

  NearEarthObjects({
    this.links,
    this.id,
    this.neoReferenceId,
    this.name,
    this.nameLimited,
    this.designation,
    this.nasaJplUrl,
    this.absoluteMagnitudeH,
    this.estimatedDiameter,
    this.isPotentiallyHazardousAsteroid,
    this.closeApproachData,
    this.orbitalData,
    this.isSentryObject,
  });

  NearEarthObjects.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    id = json['id'];
    neoReferenceId = json['neo_reference_id'];
    name = json['name'];
    nameLimited = json['name_limited'];
    designation = json['designation'];
    nasaJplUrl = json['nasa_jpl_url'];
    absoluteMagnitudeH = json['absolute_magnitude_h']?.toDouble();
    estimatedDiameter =
        json['estimated_diameter'] != null
            ? EstimatedDiameter.fromJson(json['estimated_diameter'])
            : null;
    isPotentiallyHazardousAsteroid = json['is_potentially_hazardous_asteroid'];
    if (json['close_approach_data'] != null) {
      closeApproachData = <CloseApproachData>[];
      json['close_approach_data'].forEach((v) {
        closeApproachData!.add(CloseApproachData.fromJson(v));
      });
    }
    orbitalData =
        json['orbital_data'] != null
            ? OrbitalData.fromJson(json['orbital_data'])
            : null;
    isSentryObject = json['is_sentry_object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['id'] = id;
    data['neo_reference_id'] = neoReferenceId;
    data['name'] = name;
    data['name_limited'] = nameLimited;
    data['designation'] = designation;
    data['nasa_jpl_url'] = nasaJplUrl;
    data['absolute_magnitude_h'] = absoluteMagnitudeH;
    if (estimatedDiameter != null) {
      data['estimated_diameter'] = estimatedDiameter!.toJson();
    }
    data['is_potentially_hazardous_asteroid'] = isPotentiallyHazardousAsteroid;
    if (closeApproachData != null) {
      data['close_approach_data'] =
          closeApproachData!.map((v) => v.toJson()).toList();
    }
    if (orbitalData != null) {
      data['orbital_data'] = orbitalData!.toJson();
    }
    data['is_sentry_object'] = isSentryObject;
    return data;
  }
}

class EstimatedDiameter {
  Kilometers? kilometers;
  Kilometers? meters;
  Kilometers? miles;
  Kilometers? feet;

  EstimatedDiameter({this.kilometers, this.meters, this.miles, this.feet});

  EstimatedDiameter.fromJson(Map<String, dynamic> json) {
    kilometers =
        json['kilometers'] != null
            ? Kilometers.fromJson(json['kilometers'])
            : null;
    meters =
        json['meters'] != null ? Kilometers.fromJson(json['meters']) : null;
    miles = json['miles'] != null ? Kilometers.fromJson(json['miles']) : null;
    feet = json['feet'] != null ? Kilometers.fromJson(json['feet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (kilometers != null) {
      data['kilometers'] = kilometers!.toJson();
    }
    if (meters != null) {
      data['meters'] = meters!.toJson();
    }
    if (miles != null) {
      data['miles'] = miles!.toJson();
    }
    if (feet != null) {
      data['feet'] = feet!.toJson();
    }
    return data;
  }
}

class Kilometers {
  double? estimatedDiameterMin;
  double? estimatedDiameterMax;

  Kilometers({this.estimatedDiameterMin, this.estimatedDiameterMax});

  Kilometers.fromJson(Map<String, dynamic> json) {
    estimatedDiameterMin = json['estimated_diameter_min']?.toDouble();
    estimatedDiameterMax = json['estimated_diameter_max']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['estimated_diameter_min'] = estimatedDiameterMin;
    data['estimated_diameter_max'] = estimatedDiameterMax;
    return data;
  }
}

class CloseApproachData {
  String? closeApproachDate;
  String? closeApproachDateFull;
  int? epochDateCloseApproach;
  RelativeVelocity? relativeVelocity;
  MissDistance? missDistance;
  String? orbitingBody;

  CloseApproachData({
    this.closeApproachDate,
    this.closeApproachDateFull,
    this.epochDateCloseApproach,
    this.relativeVelocity,
    this.missDistance,
    this.orbitingBody,
  });

  CloseApproachData.fromJson(Map<String, dynamic> json) {
    closeApproachDate = json['close_approach_date'];
    closeApproachDateFull = json['close_approach_date_full'];
    epochDateCloseApproach = json['epoch_date_close_approach'];
    relativeVelocity =
        json['relative_velocity'] != null
            ? RelativeVelocity.fromJson(json['relative_velocity'])
            : null;
    missDistance =
        json['miss_distance'] != null
            ? MissDistance.fromJson(json['miss_distance'])
            : null;
    orbitingBody = json['orbiting_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['close_approach_date'] = closeApproachDate;
    data['close_approach_date_full'] = closeApproachDateFull;
    data['epoch_date_close_approach'] = epochDateCloseApproach;
    if (relativeVelocity != null) {
      data['relative_velocity'] = relativeVelocity!.toJson();
    }
    if (missDistance != null) {
      data['miss_distance'] = missDistance!.toJson();
    }
    data['orbiting_body'] = orbitingBody;
    return data;
  }
}

class RelativeVelocity {
  String? kilometersPerSecond;
  String? kilometersPerHour;
  String? milesPerHour;

  RelativeVelocity({
    this.kilometersPerSecond,
    this.kilometersPerHour,
    this.milesPerHour,
  });

  RelativeVelocity.fromJson(Map<String, dynamic> json) {
    kilometersPerSecond = json['kilometers_per_second'];
    kilometersPerHour = json['kilometers_per_hour'];
    milesPerHour = json['miles_per_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['kilometers_per_second'] = kilometersPerSecond;
    data['kilometers_per_hour'] = kilometersPerHour;
    data['miles_per_hour'] = milesPerHour;
    return data;
  }
}

class MissDistance {
  String? astronomical;
  String? lunar;
  String? kilometers;
  String? miles;

  MissDistance({this.astronomical, this.lunar, this.kilometers, this.miles});

  MissDistance.fromJson(Map<String, dynamic> json) {
    astronomical = json['astronomical'];
    lunar = json['lunar'];
    kilometers = json['kilometers'];
    miles = json['miles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['astronomical'] = astronomical;
    data['lunar'] = lunar;
    data['kilometers'] = kilometers;
    data['miles'] = miles;
    return data;
  }
}

class OrbitalData {
  String? orbitId;
  String? orbitDeterminationDate;
  String? firstObservationDate;
  String? lastObservationDate;
  int? dataArcInDays;
  int? observationsUsed;
  String? orbitUncertainty;
  String? minimumOrbitIntersection;
  String? jupiterTisserandInvariant;
  String? epochOsculation;
  String? eccentricity;
  String? semiMajorAxis;
  String? inclination;
  String? ascendingNodeLongitude;
  String? orbitalPeriod;
  String? perihelionDistance;
  String? perihelionArgument;
  String? aphelionDistance;
  String? perihelionTime;
  String? meanAnomaly;
  String? meanMotion;
  String? equinox;
  OrbitClass? orbitClass;

  OrbitalData({
    this.orbitId,
    this.orbitDeterminationDate,
    this.firstObservationDate,
    this.lastObservationDate,
    this.dataArcInDays,
    this.observationsUsed,
    this.orbitUncertainty,
    this.minimumOrbitIntersection,
    this.jupiterTisserandInvariant,
    this.epochOsculation,
    this.eccentricity,
    this.semiMajorAxis,
    this.inclination,
    this.ascendingNodeLongitude,
    this.orbitalPeriod,
    this.perihelionDistance,
    this.perihelionArgument,
    this.aphelionDistance,
    this.perihelionTime,
    this.meanAnomaly,
    this.meanMotion,
    this.equinox,
    this.orbitClass,
  });

  OrbitalData.fromJson(Map<String, dynamic> json) {
    orbitId = json['orbit_id'];
    orbitDeterminationDate = json['orbit_determination_date'];
    firstObservationDate = json['first_observation_date'];
    lastObservationDate = json['last_observation_date'];
    dataArcInDays = json['data_arc_in_days'];
    observationsUsed = json['observations_used'];
    orbitUncertainty = json['orbit_uncertainty'];
    minimumOrbitIntersection = json['minimum_orbit_intersection'];
    jupiterTisserandInvariant = json['jupiter_tisserand_invariant'];
    epochOsculation = json['epoch_osculation'];
    eccentricity = json['eccentricity'];
    semiMajorAxis = json['semi_major_axis'];
    inclination = json['inclination'];
    ascendingNodeLongitude = json['ascending_node_longitude'];
    orbitalPeriod = json['orbital_period'];
    perihelionDistance = json['perihelion_distance'];
    perihelionArgument = json['perihelion_argument'];
    aphelionDistance = json['aphelion_distance'];
    perihelionTime = json['perihelion_time'];
    meanAnomaly = json['mean_anomaly'];
    meanMotion = json['mean_motion'];
    equinox = json['equinox'];
    orbitClass =
        json['orbit_class'] != null
            ? OrbitClass.fromJson(json['orbit_class'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orbit_id'] = orbitId;
    data['orbit_determination_date'] = orbitDeterminationDate;
    data['first_observation_date'] = firstObservationDate;
    data['last_observation_date'] = lastObservationDate;
    data['data_arc_in_days'] = dataArcInDays;
    data['observations_used'] = observationsUsed;
    data['orbit_uncertainty'] = orbitUncertainty;
    data['minimum_orbit_intersection'] = minimumOrbitIntersection;
    data['jupiter_tisserand_invariant'] = jupiterTisserandInvariant;
    data['epoch_osculation'] = epochOsculation;
    data['eccentricity'] = eccentricity;
    data['semi_major_axis'] = semiMajorAxis;
    data['inclination'] = inclination;
    data['ascending_node_longitude'] = ascendingNodeLongitude;
    data['orbital_period'] = orbitalPeriod;
    data['perihelion_distance'] = perihelionDistance;
    data['perihelion_argument'] = perihelionArgument;
    data['aphelion_distance'] = aphelionDistance;
    data['perihelion_time'] = perihelionTime;
    data['mean_anomaly'] = meanAnomaly;
    data['mean_motion'] = meanMotion;
    data['equinox'] = equinox;
    if (orbitClass != null) {
      data['orbit_class'] = orbitClass!.toJson();
    }
    return data;
  }
}

class OrbitClass {
  String? orbitClassType;
  String? orbitClassRange;
  String? orbitClassDescription;

  OrbitClass({
    this.orbitClassType,
    this.orbitClassRange,
    this.orbitClassDescription,
  });

  OrbitClass.fromJson(Map<String, dynamic> json) {
    orbitClassType = json['orbit_class_type'];
    orbitClassRange = json['orbit_class_range'];
    orbitClassDescription = json['orbit_class_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orbit_class_type'] = orbitClassType;
    data['orbit_class_range'] = orbitClassRange;
    data['orbit_class_description'] = orbitClassDescription;
    return data;
  }
}
