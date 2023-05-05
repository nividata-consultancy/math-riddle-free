class Option {
  final String name;
  final bool isSelected;

  const Option({
    required this.name,
    this.isSelected = false,
  });

  Option copyWith({
    String? name,
    bool? isSelected,
  }) {
    return Option(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
