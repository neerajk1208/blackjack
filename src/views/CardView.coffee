class window.CardView extends Backbone.View
  className: 'card'
  #id = "img/cards/" + @model.get('rankName') + "-" +  @model.get('suitName') + ".png"
  console.log @model  
  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png""/>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    #@$el.css("background-image", "url("")")

