$( document ).on('turbolinks:load', function() {
  enableTooltips();
  showSliderValue("power");
  showSliderValue("attack");
  showSliderValue("strenght");
  showSliderValue("spirit");
  showSliderValue("charisma");
  setPoints("power");
  setPoints("attack");
  setPoints("strenght");
  setPoints("spirit");
  setPoints("charisma");
  validateCharacter();
  initToast();
  copyToClipboard();
})

// jQuery.validator.addMethod("maxPoints", function(value, element) {
//   return this.optional(element) || (getRemaining() > 0);
// }, "No puedes asignar más de 2000 pts");

jQuery.validator.addMethod("minPoints", function(value, element) {
  return this.optional(element) || (getRemaining() === 0);
}, "Tienes que asignar todos los puntos");

jQuery.validator.addMethod("nameUniq", function(value, element) {
  return this.optional(element) || (searchName() === 0);
}, "Este nombre ya está en uso");

function getTotal(){
  var total = 0;
  $(".form-range").each(function(){
    total += parseInt($(this).val());
  });
  return total;
}

function validateCharacter(){
  $("#new_character").validate({
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'remaining_points': {
        minPoints: true,
      },
      'character[image]': "required",
      'character[name]': {
        required: true,
        nameUniq: true
      },
      'character[power]': {
        required: true,
      },
      'character[attack]': {
        required: true,
      },
      'character[spirit]': {
        required: true,
      },
      'character[charisma]': {
        required: true,
      },
      'character[strenght]': {
        required: true,
      },
      'character[special_skill]': "required",
    },
    messages: {
      'character[name]': {
        required: 'Debes asignarle un nombre a tu personaje'
      },
      'character[image]': {
        required: 'No olvides agregar una imagen'
      },
      'character[special_skill]': {
        required: 'Tienes elegir una habilidad especial'
      },
    }
   })
}

function showSliderValue(name){
  $("#character_" + name).on('input', function(){
    $("#" + name + "_indicator").val($(this).val());
    checkRemainingPoints();
  });
}

function getRemaining(){
  var total = getTotal();
  var remaining = 2500 - total;
  console.log(remaining);
  return remaining;
}

function checkRemainingPoints(){
  var remaining = getRemaining();
  var remainingIndicator = $("#remaining_points");
  if (remaining < 0){
    remainingIndicator.removeClass('text-success');
    remainingIndicator.addClass('text-danger');
  }
  else{
    remainingIndicator.removeClass('text-danger');
    remainingIndicator.addClass('text-success');
  };
  remainingIndicator.val(remaining);
}

function setPoints(name){
  $("#" + name + "_indicator").on('change', function(){
    $("#character_" + name).val($(this).val());
    checkRemainingPoints();
  });
}

function searchName(){
  var name = $("#character_name").val();
  var total = 0;
  $.ajax({
    url: "/characters/search_slug",
    data: { character: { slug: name } }
  }).done(function(result) {
    total = result.total;
  });
  return total;
}

function setTotal(){
  var total = getTotal();
  $("#total").val(total);
}

function copyToClipboard() {
  $("#copy_link").on('click', function(){
    var copyText = document.getElementById("link")
    var tooltip =  bootstrap.Tooltip.getInstance(this);
    var newTooltip = new bootstrap.Tooltip(this);
    tooltip.hide();
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    navigator.clipboard.writeText(copyText.value);
    this.dataset.bsOriginalTitle = 'Copiado!';
    newTooltip.show();
    this.dataset.bsOriginalTitle = 'Copiar al portapapeles';
  });
}

function initToast(){
  var toastElList = [].slice.call(document.querySelectorAll('.toast'))
  var toastList = toastElList.map(function (toastEl) {
    return new bootstrap.Toast(toastEl).show();
  });
}

function enableTooltips(){
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  });
}