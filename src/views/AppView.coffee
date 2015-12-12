class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="newHand-button">New Hand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('dealerHand')['playerScore'] = @model.get('playerHand').scores()[0] 
      @model.get('dealerHand').models[0].flip()
      @model.get('dealerHand').dealerHit()
    'click .newHand-button': ->
      #if deck length is less than four
      #create a new deck
      @model.set 'deck', deck= new Deck() if @model.get('deck').length < 4
      @model.set 'playerHand', @model.get('deck').dealPlayer()
      @model.set 'dealerHand', @model.get('deck').dealDealer()
      @render()


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

#this.model.get('dealerHand').set()