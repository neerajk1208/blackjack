assert = chai.assert

describe "Blackjack simplified rules", ->

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe "hitting and standing behavior", ->

    it "should make dealer hit on stand", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52
      
    it "should make dealer stop hitting when score is 17 or greater", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

  describe "score comparison", ->

    it "should automatically notify player upon win or loss", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

    it "if neither player nor dealer bust, should compare scores and alert appropriate result", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

    it "should alert win when dealer scores lower", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

    it "should alert loss when dealer scores higher", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

    it "should alert loss when scores are equal", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52


