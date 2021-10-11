$( document ).on('turbolinks:load', function() {
  showSliderValue("power");
  showSliderValue("attack");
  showSliderValue("strenght");
  showSliderValue("spirit");
  showSliderValue("charisma");
})
function showSliderValue(name){
  $("#character_" + name).on('input', function(){
    console.log($(this).val())
    $("#" + name + "-indicator").text($(this).val());
  });
}