$( document ).on('turbolinks:load', function() {
  showSliderValue("power");
  showSliderValue("attack");
  showSliderValue("strenght");
  showSliderValue("spirit");
  showSliderValue("charisma");
  validateCharacter();
})

function validateCharacter(){
  $("#new_character").validate({
    onkeyup: true,
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'character[name]': "required",
      'character[power]': "required",
      'character[attack]': "required",
      'character[spirit]': "required",
      'character[charisma]': "required",
      'character[strenght]': "required",
      'character[special_skill]': "required",
    },
    messages: {
      'character[name]': {
        required: 'Tienes que ingresar un nombre'
      },
      'character[special_skill]': {
        required: 'Tienes elegir una habilidad especial'
      },
    }
   })
}

function showSliderValue(name){
  $("#character_" + name).on('input', function(){
    console.log($(this).val())
    $("#" + name + "-indicator").text($(this).val());
  });
}