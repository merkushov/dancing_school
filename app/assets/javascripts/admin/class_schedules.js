//= require admin-tools/admin-forms/js/jquery-ui-datepicker.min.js

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
});