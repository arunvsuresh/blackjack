# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #listener
    @get('playerHand').on 'stand', (Hand) =>
     @dealerMove()
    @get('playerHand').on 'chooseWinner', (Hand) =>
      @get('playerHand').chooseWinner('dealer')

  dealerMove: ->
    @get('dealerHand').models[0].flip()

    decision = =>
      dealerScore = @get('dealerHand').minScore()
      playerScore = @get('playerHand').minScore()

      if dealerScore <= 16
        @get('dealerHand').hit()
        decision()
      else
        if dealerScore > playerScore and dealerScore <= 21
          @get('dealerHand').chooseWinner('dealer')
        else
          @get('playerHand').chooseWinner('player')

    decision()


 ###   while dealerScore < 16
      @get('dealerHand').hit()
      if dealerScore > 21
        alert "Bust"
      break;###





