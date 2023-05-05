const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2022), so we use no whitespace.
  Song('ambient-inspiration-136110.mp3', 'Ambient Inspiration',
      artist: 'The Mountain'),
  Song('inspirational-background-112290.mp3', 'Inspiration Background',
      artist: 'AudioCoffee'),
};

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}
