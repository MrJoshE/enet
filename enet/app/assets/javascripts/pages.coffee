# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#login_button').click ->
    email = $('#email_field').val()
    password = $('#password_field').val()
    alert("Email: #{email}\nPassword: #{password}")
