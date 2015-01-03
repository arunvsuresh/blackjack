class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    console.log(@)

  hit: ->
    @add(@deck.pop())

  stand: ->
    console.log(@isDealer)
    # if userScore > dealerScore and userScore < 21
    #   dealer hits
    # else if dealerScore <= 11
    #   dealer hits
    # else dealer stands
    # if user and dealer both stand
    #   evaluate score and assess winner

    # dealer move is triggered only when user stands


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

