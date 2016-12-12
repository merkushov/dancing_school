jQuery(document).ready(function () {

  $(".toggle-select").on("click", function(){
    var select = $( "#" + $(this).attr("data-select") );

    if ( $(this).is(":checked") ) {
      select.attr("disabled", "disabled");
      select.val('');
    } else {
      select.removeAttr("disabled");
    }    
  });

  // при выборе значений поля "тип лимитов посещений"
  // отображается то или иное связанное поле
  $("#price_visit_limit_type").on("change", function(){
    var selectedValue = $(this).val();

    var visNum = $("#price_visit_number").parent();
    var visHourNum = $("#price_visit_hour_number").parent();

    if ( selectedValue === "visits_number" ) {
      visHourNum.hide().find("input").val('');
      visNum.show();
    } else if ( selectedValue === "hours_number" ) {
      visHourNum.show();
      visNum.hide().find("input").val('');
    } else {
      visHourNum.hide().find("input").val('');
      visNum.hide().find("input").val('');
    }
  });

  $("#price_period_start_type").on("change", function(){
    var selectedValue = $(this).val();

    if ( selectedValue === "fix_date" ) {
      $("#price_period_start_date").parent().show();
    } else {
      $("#price_period_start_date").val('').parent().hide();
    }
  });

  $("#price_period_end_type").on("change", function(){
    var selectedValue = $(this).val();

    if ( selectedValue === "fix_date" ) {
      $("#price_period_end_date").parent().show();
      $("#price_period_end_days").val('').parent().hide();
    } else if ( selectedValue === "fix_days" ) {
      $("#price_period_end_date").val('').parent().hide();
      $("#price_period_end_days").parent().show();
    } else {
      $("#price_period_end_date").val('').parent().hide();
      $("#price_period_end_days").val('').parent().hide();
    }
  });

  // обработка связанных полей при загрузке страницы
  // тут для того чтобы не размазывать условия по коду
  // возможно, стоит перенести куда-то получше
  $("#price_visit_limit_type").trigger("change");
  $("#price_period_start_type").trigger("change");
  $("#price_period_end_type").trigger("change");

});