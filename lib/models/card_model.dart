// ignore_for_file: prefer_typing_uninitialized_variables

class CardModel {
  var user;
  var cardNumber;
  var cardExpired;
  var cardType;
  var cardBackground;
  var cardElementTop;
  var cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom);
}

List<CardModel> cards = cardData.map(
  (item) => CardModel(
    item['user'],
    item['cardNumber'],
    item['cardExpired'],
    item['cardType'],
    item['cardBackground'],
    item['cardElementTop'],
    item['cardElementBottom'],
  ),
).toList();

var cardData = [
  {
    "user": "Lana Decruz",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "03-01-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/svg/svg2.svg",
    "cardElementBottom": "assets/svg/svg2.svg"
  },
  {
    "user": "Amanda Alex",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "03-01-2025",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
    "cardElementTop": "assets/svg/svg2.svg",
    "cardElementBottom": "assets/svg/svg2.svg"
  }
];