class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    #console.log(array[1].flip())

  hit: ->
    topCard = @deck.models[@deck.models.length - 1]
    @add(@deck.pop())
    if @minScore() > 21
      swal "Bust!"
      @trigger 'chooseWinner'

    return topCard


  stand: ->
    @trigger 'stand', @

  chooseWinner: (winner) ->
    swal winner + ' wins!'

  dealerMove: ->
    #declaring event listener
    @get('dealerHand').at(0)


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

