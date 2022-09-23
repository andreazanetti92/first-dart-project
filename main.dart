void main(){
  var deck = Deck();
  
  print(deck.toString());
  
  deck.shuffle();
  
  print(deck.toString());
  
  print(deck.deal(5));
  
  print(deck.toString());
}

class Deck{
  List<Card> cards = [];
  
  Deck(){
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King'];
    var suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs'];
    
    for(var suit in suits){
      
      for(var rank in ranks){
        
        Card card = Card(
          rank: rank, 
          suit: suit
        );
        
        cards.add(card);
      }
    }
  }
  
  @override
  toString(){
    return cards.toString();
  }
  
  shuffle(){
    cards.shuffle();
  }
  
  cardsWithSuit(String suit){
    return cards.where((card) => card.suit == suit);
  }
  
  deal(int handSize){
    var hand = cards.sublist(0, handSize);
    
    cards = cards.sublist(handSize);
    
    return hand;
  }
  
  removeCard(String suit, String rank){
    cards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card{
  String rank = "";
  
  String suit = "";
  
  Card({this.rank = "", this.suit = ""});
  
  @override
  toString(){
    return '$rank of $suit';
  }
}