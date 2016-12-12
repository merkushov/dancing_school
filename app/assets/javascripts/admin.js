//= require plugins/core.min.js

//= require js/utility/utility.js
//= require js/main.js

//= require admin/customers
//= require admin/class_schedules
//= require admin/prices

//= require_self

// Init Theme Core
jQuery(document).ready(function () {
  Core.init();

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
});

function showUserAlert(status, message) {
  var notifyTitle = "";

  switch (status) {
    case "success":
      notifyTitle = "Успех";
      break;
    case "danger":
      notifyTitle = "Ошибка";
      break;
    default:
      notifyTitle = "Информация";
  }

  // всплывающие уведомления для всего сайта
  new PNotify({
    title: notifyTitle,
    text: message,
    type: status,
  });
};