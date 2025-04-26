class Exercise {
  final String exerciseId;
  final String name;
  final String gifUrl;
  final List<String> instructions;
  final List<String> targetMuscles;
  final List<String> bodyParts;
  final List<String> equipments;
  final List<String> secondaryMuscles;

  Exercise({
    required this.exerciseId,
    required this.name,
    required this.gifUrl,
    required this.instructions,
    required this.targetMuscles,
    required this.bodyParts,
    required this.equipments,
    required this.secondaryMuscles,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseId: json['exerciseId'],
      name: json['name'],
      gifUrl: json['gifUrl'],
      instructions: List<String>.from(json['instructions']),
      targetMuscles: List<String>.from(json['targetMuscles']),
      bodyParts: List<String>.from(json['bodyParts']),
      equipments: List<String>.from(json['equipments']),
      secondaryMuscles: List<String>.from(json['secondaryMuscles']),
    );
  }
}
