# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class Controller

  constructor: () ->
    optionsid = []
    optionstimes= []
    $(".choice").hide()
    $(".done").hide()
    $(":radio").click @choice
    $("ul li img").each ->
      optionsid.push $(this).attr("id")
      optionstimes.push $(this).attr("title")
    @optionsid = optionsid
    @optionstimes = optionstimes
    $('.slots').jSlots
      spinner : '#start'
      winnerNumber : 7
      onEnd : @confirm


  confirm: (final) =>
    @finalperson = final
    $(".spinpeeps").css("opacity", 0.3)
    $(".choice").show()
  choice: (event) =>
    test = $(event.target)
    if test.val() == "yes"
      @done()
    else
      $(".spinpeeps").css("opacity", 1)
      $(".choice").hide()
    $(":radio").attr("checked", false)


  done: () =>
    $(".done").show()
    $(".choice").hide()
    newnum = parseInt(@optionstimes[@finalperson[0]-1]) + 1
    $.ajax({
      type: "PUT",
      url: "/selectors/"+@optionsid[@finalperson[0]-1], 
      data: {selector: {timesSelected: newnum}},
      success: (data, status) => 
    })



Utility.n "Interface", (exports) ->
  exports.Controller = Controller
 
