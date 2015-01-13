module.exports = (_) ->

    extends: (instance, options) ->
      _.extend(instance, options)

    getCSSFromSelectors: (selectors) ->
      _.reduce selectors, (memo, selector) ->
        memo += selector.toCSS()
      ,""

    getSelectorsFromElements: (elements) ->
      _.pluck elements, "selector"