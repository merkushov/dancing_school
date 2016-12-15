//= require admin-tools/admin-forms/js/jquery-ui-datepicker.min.js
//= require typeahead.bundle.js

jQuery(document).ready(function () {
  $('#class_schedule_date_begin').datetimepicker({
    dateFormat: "dd/mm/yy",
    prevText: '<i class="fa fa-chevron-left"></i>',
    nextText: '<i class="fa fa-chevron-right"></i>',
    beforeShow: function (input, inst) {
      var newclass = 'admin-form';
      var themeClass = $(this).parents('.admin-form').attr('class');
      var smartpikr = inst.dpDiv.parent();
      if (!smartpikr.hasClass(themeClass)) {
        inst.dpDiv.wrap('<div class="' + themeClass + '"></div>');
      }
    }
  });

  $('#class_schedule_date_end').datetimepicker({
    dateFormat: "dd/mm/yy",
    prevText: '<i class="fa fa-chevron-left"></i>',
    nextText: '<i class="fa fa-chevron-right"></i>',
    beforeShow: function (input, inst) {
      var newclass = 'admin-form';
      var themeClass = $(this).parents('.admin-form').attr('class');
      var smartpikr = inst.dpDiv.parent();
      if (!smartpikr.hasClass(themeClass)) {
        inst.dpDiv.wrap('<div class="' + themeClass + '"></div>');
      }
    }
  });

  var customers = new Bloodhound({
    datumTokenizer: function(d){ return d.name; },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      wildcard: '%QUERY',
      url: '/admin/customers/search.json?query=%QUERY',
    }
  });

  // Init Typeahead Plugin with state aray
  $('.typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 3,
  }, {
    name: 'customers',
    displayKey: 'name',
    source: customers
    // remote: '/admin/customers/search.json?query=%QUERY'
  })
    .on("typeahead:selected",function($e, datum){
      var $btn = $(".post-add-customer-to-class");
      $btn.removeAttr("disabled");

      $("#customer_id").val(datum["id"]);
    });

  // добавление Ученика к Занятию
  // $(document).on("click", ".post-add-customer-to-class", function(){
  //   var $btn = $(this);
  //   var form = $btn.closest("form");
  //   var urlRequest = form.attr("action");

  //   event.preventDefault();

  //   $.ajax({
  //     method: "POST",
  //     url: urlRequest,
  //     data: form.serialize(),
  //     dataType: "json"
  //   })
  //     .done(function(res){
  //       console.log(res);
  //     })
  //     .fail(function(jqXHR, textStatus, errorThrown){
  //       console.log(jqXHR);
  //     });

  //   // остановить отправку формы
  //   return false;
  // });

  // Выставление оплаты кустомера за занятие
  $(document).on("click", ".set-ajax-pay-satus", function(){
    var urlRequest = $(this).attr("data-url");
    var isPaid = $(this).is(':checked');

    $.ajax({
      method: "PUT",
      url: urlRequest,
      data: { is_paid: isPaid },
      dataType: "json",
    })
      .done(function(res){
        // showUserAlert( res.status, res.message );
      })
      .fail(function(jqXHR, textStatus, errorThrown){
        showUserAlert( 'danger', 'Сервер на смог сменить статус оплаты' );
      });
  });

  $(document).on("click", ".ajax-request", function(){
    console.log("123123");

    // var $btn = $(this);
    // var urlRequest = $bnt.attr("data-url");
    // var method = $btn.attr("data-method");

    // console.log(urlRequest);

    // $.ajax({
    //   method: method,
    //   url: urlRequest,
    //   dataType: "json"
    // })
    //   .done(function(res){
    //     console.log(res);
    //   });
  });
});