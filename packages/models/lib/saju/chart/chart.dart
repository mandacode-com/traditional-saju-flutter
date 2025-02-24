import 'package:models/models.dart';

part './chart_earthly.dart';
part './chart_heavenly.dart';

/// Chart model
class Chart {
  /// Chart
  Chart({
    required this.heavenly,
    required this.earthly,
  });

  /// Create a [Chart] from a JSON object
  factory Chart.fromJson(Map<String, dynamic> json) {
    final heavenly = ChartHeavenly.fromJson(json['heavenly'] as Map<String, dynamic>);
    final earthly = ChartEarthly.fromJson(json['earthly'] as Map<String, dynamic>);

    return Chart(
      heavenly: heavenly,
      earthly: earthly,
    );
  }

  /// Heavenly
  final ChartHeavenly heavenly;

  /// Earthly
  final ChartEarthly earthly;
}
