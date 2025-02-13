part of '../common.dart';

/// Earthly branch
class ChartEarthly {
  /// Earthly branch
  ChartEarthly({
    required this.branches,
    required this.fiveElements,
  });

  /// Create a [ChartEarthly] from a JSON object
  factory ChartEarthly.fromJson(Map<String, dynamic> json) {
    final branches = (json['branches'] as List<dynamic>)
        .map(
          (e) => EarthlyBranch.values.firstWhere(
            (element) => element.toString().split('.').last == e,
          ),
        )
        .toList();
    final fiveElements = (json['fiveElements'] as List<dynamic>)
        .map(
          (e) => FiveElement.values.firstWhere(
            (element) => element.toString().split('.').last == e,
          ),
        )
        .toList();

    return ChartEarthly(branches: branches, fiveElements: fiveElements);
  }

  /// Earthly branches
  final List<EarthlyBranch> branches;

  /// Five elements of earthly branches
  final List<FiveElement> fiveElements;
}
