// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require('bootstrap-sprockets')
// require('./src/application.scss')
import 'bootstrap'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require('jquery')
$(document).on('turbolinks:load', function () {
  $(document).ready(function () {
    $('.order_checkbox').on('change', function () {

      var disabled = true;
      $('.order_checkbox').each(function (_, box) {
        if (box.checked) disabled = false;
      });
      $('#schedule-btn').prop("disabled", disabled);
    });

    $("#schedule_id").change(function () {
      let current_schedule_id = Number(this.value);

      console.log(current_schedule_id);


      $(".assigned_order_id").each(function (index, order) {
        order.parentElement.style.display = "table-row";
        let schedule_id = Number(order.textContent);
        if (current_schedule_id != 0 && schedule_id != current_schedule_id) {
          order.parentElement.style.display = "none";
        }

      })
    })

  });
});
