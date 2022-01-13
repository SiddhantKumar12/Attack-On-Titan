class HomeData {
  final String cardName;
  final String cardDescription;
  final String cardImageUrl;

  HomeData(
      {required this.cardName,
      required this.cardDescription,
      required this.cardImageUrl});
}

final List<HomeData> homeData = [_titanHome, _characterHome, _seasonHome];

final _titanHome = HomeData(
    cardName: 'Titan', cardDescription: 'cardDescription', cardImageUrl: 'a');

final _characterHome = HomeData(
    cardName: 'character',
    cardDescription: 'cardDescription',
    cardImageUrl: 'a');
final _seasonHome = HomeData(
    cardName: 'season', cardDescription: 'cardDescription', cardImageUrl: 'a');
