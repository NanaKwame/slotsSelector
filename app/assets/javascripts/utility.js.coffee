namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

#####################################################
## Class Extentions

Array::remove = (e) -> @[t..t] = [] if (t = @indexOf(e)) > -1


#####################################################
## Domain Object Helpers

# The default value is literally a random GUID that has no meaning except for being extremely unlikely to be set.
# It serves as a flag to know if there was a second param passed or not
dp = (obj, name, value="F9BCA880-86A6-11E2-9E96-0800200C9A66") -> 
  return if !obj.properties

  property = (p for p in obj.properties when p.name == name)
  throw "multiple property objects for one key" if property.length > 1

  if property[0]? 
    if value == "F9BCA880-86A6-11E2-9E96-0800200C9A66"
      property[0].value 
    else
      property[0].value = value
  
  else
    if value != "F9BCA880-86A6-11E2-9E96-0800200C9A66"
      obj.properties.push {name: name, value: value}


#####################################################
## Model - Lightweight Hash w/ Notification & Binding

class Model
  constructor: () ->
    @_listeners = {}

  set: (name, value, custom_flag=null) =>
    @notify name, @["_" + name], "pre", custom_flag
    @["_" + name] = value
    @notify name, value, "post", custom_flag
  
  get: (name) =>
    @["_" + name]

  register: (name, callback, phase = "post") =>
    if !@_listeners[name]?
      @_listeners[name] = 
        "pre": []
        "post": []
       
    @_listeners[name][phase].push callback
    
  notify: (name, value, phase = "post", custom_flag=null) =>
    callback(value, custom_flag) for callback in @_listeners[name][phase] if @_listeners[name]?
    
  bind: (name, selector) =>
    @register name, ((value) ->
      if !value? || value == ""
        $(selector).html("&nbsp;")
      else
        $(selector).html(value)
    ) 



namespace 'Utility', (exports) ->
  exports.n = namespace
  exports.dp = dp
  exports.Model = Model