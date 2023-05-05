import 'package:math_riddle/data/model/option.dart';

class ImageOption extends Option {
  final String image;

  const ImageOption({
    required this.image,
    required super.name,
    super.isSelected,
  });

  @override
  ImageOption copyWith({
    String? name,
    String? image,
    bool? isSelected,
  }) {
    return ImageOption(
      name: name ?? this.name,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
