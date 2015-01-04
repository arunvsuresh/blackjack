class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    console.log(@$el.css 'content', 'url("img/cards/' + @model.get('value').toString().toLowerCase() + '-' + @model.get('suitName').toString().toLowerCase() + '.png")')

