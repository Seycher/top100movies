class Movie {
  final String movieID;
  final String title;
  final int year;
  final String category;
  final String director;
  final int durationInMinutes;
  final String storyDescription;
  final String posterUrl;


  bool isUnlocked = false;

  Movie(
    this.movieID,
    this.title,
    this.year,
    this.category,
    this.director,
    this.durationInMinutes,
    this.storyDescription,
    this.posterUrl,
    this.isUnlocked,
  );
}
