@my = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
    
@func = ->
  alert 'yyyy'
  

 
$ ->
  $("a[data-background-color]").click (e) ->
    e.preventDefault()
 
    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)
    

@paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor


ajax = ->
  $.ajax(url: "/test").success (html) -> $("#results").append html  

  
$ ->
  $("a[data-ajax]").click (e) ->
    $.ajax(url: "/test").done (html) -> 
      $("#results").append html
      
$(document).ready ->
  $("#new_base").on("ajax:success", (e, data, status, xhr) ->
    #alert 'yyyy'
    $("#results").html xhr.responseText
   ).on "ajax:error", (e, xhr, status, error) ->
    $("#results").append xhr.responseText