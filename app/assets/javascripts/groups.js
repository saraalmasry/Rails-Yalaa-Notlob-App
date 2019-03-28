// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function () {
  console.log("Work") ;
$(".Add-user").click(function (){
  $(".groupMembers").css("display: block") ; 
  $(".groupMembers").classList.add("fadeOutUp") ;
}) ; 
$(".fa-bell").click(function () {
  $(".badge").hide() ; 
})
})