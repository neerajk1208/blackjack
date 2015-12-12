class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    setTimeout(-> alert "You lose!", 1000)  if @scores()[0] > 21
    #if this.scores > 21
      #alert You lose
    # @last()

#console.logging out the win/loss because when we alert it breaks the control flow and the last card image does not render
#until after the alert is closed
  dealerHit: ->
    that= @
    subRoutine = ->
      
      return if that.scores()[0] >=17
      that.add(that.deck.pop())
      # that.last()
      subRoutine()
    subRoutine()
    if @scores()[0] > 21 then setTimeout(->alert "You win!", 0) 
    else 
      if @scores()[0] >= @playerScore then setTimeout(-> alert "You lose!", 0)  
      else setTimeout(-> alert "You win!", 0) 

    

  ###


  dealerHit: function() {
  
    var subRoutine = function() {
      if (this.scores()[0] >=17) {
        return
      } else {
        this.add(this.deck.pop());
        this.last()
        subRoutine()
      }
    }
    subRoutine();
    if (dealerHand.scores > 21) {
      alert("You win")
    } else {
      if (dealerHand.scores()[0] >= playerHand.scores()[0]) {
        alert("You lose")
      } else {
        alert("you win")
      }
    }
  }

 Hand.prototype.hit = function() {
      this.add(this.deck.pop());
      if (this.scores()[0] > 21) {
        alert("You lose!");
      }
      return this.last();
    };
  ###


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


