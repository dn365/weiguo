# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.f_post_a_link').click ->
    f_id = $(this).attr("f_id")
    total_nub = $('#test-aaa').attr("total_nub")
    total = parseInt(total_nub) + 1
    $('#test-aaa').attr("total_nub",total)
    $('#test-aaa i').text("购物车("+total+")")