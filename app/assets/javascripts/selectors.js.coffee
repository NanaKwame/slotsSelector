# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class Controller
  constructor: () ->
    $(".avatar-select").select2
      formatResult: @format
      formatSelection: @format
      escapeMarkup: (m) ->
        m
    $(".exclude").click @exclude
    $("#next").click @next
    @excludeids = []
    

  format: (state) =>
    return state.text  unless state.id # optgroup
    "<img class='avatar' src='" + state.text + "'/>"

  exclude: (event) =>
    test = $(event.target).is(":checked")
    if $(event.target).is(":checked")
      @excludeids.push $(event.target).val()
    else 
      @excludeids.remove($(event.target).val())
  next: () =>
    $.ajax({
      type: "GET",
      data: {exclude: @excludeids}
      url: "/interface",
      success: (data, status) => 
        $(".content").html(data)
    })

Utility.n "Selectors", (exports) ->
  exports.Controller = Controller
 