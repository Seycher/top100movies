abstract class BottomNavigationEvent {
  const BottomNavigationEvent();
}

class DrawMovieButtonPressedEvent extends BottomNavigationEvent {
  final currentIndex;

  const DrawMovieButtonPressedEvent(this.currentIndex);
}

class ListButtonClickedEvent extends BottomNavigationEvent {
  final currentIndex;

  const ListButtonClickedEvent(this.currentIndex);
}
