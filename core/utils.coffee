exports.flatmap = (list, fn) ->
  items = (fn item in list where item)
  [].concat items...


exports.bind = (dom, selector, binder) ->
  binder dom.querySelector(selector)



