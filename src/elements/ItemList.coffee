# @chatPage.messages.selectedItem().hasState("disabled")
# @chatPage.messages.selectedItem().hasText("123")
# for item in @chatPage.messages.items()
#   item.getElement()
#   item.hasText("123")
#   item.hasState("disabled")
#   item.isSelected()

# @chatPage.messages.itemsText() # => ["...", "..."]
# should be able to pass a Element type for item


module.exports = (Element) ->
  
  class ItemList extends Element

    # options
    #   selector: 
    #   itemSelector:
    #   itemKind
    #   selectedItemSelector
    
    constructor: ->
      super

    selectedItem: ->


