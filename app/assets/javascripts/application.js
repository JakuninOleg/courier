// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require flatpickr
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require semantic-ui
//= require activestorage
//= require serviceworker-companion
//= require action_cable
//= require_tree ./channels
//= require_tree .


// document.addEventListener("DOMContentLoaded", function() {
//   var adequate = $('.ui.checkbox.adequate');
//   var passport_photo = $('.ui.checkbox.passport_photo');
//   var passport_data = $('.ui.checkbox.passport_data');
//   var button = document.querySelector('.verification_button');
//   var unverify_button = document.querySelector('.unverified_button');

//   adequate.change(showButton);
//   passport_photo.change(showButton);
//   passport_data.change(showButton);

//   function showButton() {
//     if (adequate.checkbox('is checked') && passport_photo.checkbox('is checked') && passport_data.checkbox('is checked')) {
//       button.classList.remove("hidden");
//       unverify_button.classList.add('hidden');
//     } else {
//       button.classList.add("hidden");
//       unverify_button.classList.remove('hidden');
//     };
//   };
// });

$(document).on('turbolinks:load', function () {
  var adequate = $('.ui.checkbox.adequate');
  var passport_photo = $('.ui.checkbox.passport_photo');
  var passport_data = $('.ui.checkbox.passport_data');
  var button = document.querySelector('.verification_button');
  var unverify_button = document.querySelector('.unverified_button');

  $('select.dropdown').dropdown();

  adequate.change(showButton);
  passport_photo.change(showButton);
  passport_data.change(showButton);

  function showButton() {
    if (adequate.checkbox('is checked') && passport_photo.checkbox('is checked') && passport_data.checkbox('is checked')) {
      button.classList.remove("hidden");
      unverify_button.classList.add('hidden');
    } else {
      button.classList.add("hidden");
      unverify_button.classList.remove('hidden');
    };
  };

  $('.right-sidebar-toggle').click(function() {
    $(".ui.sidebar").sidebar('setting', 'mobileTransition', 'overlay').sidebar('toggle');
  });

  $('.accept-app').click(function () {
    $('.large.modal.accept').modal('show');
  });

  $('.cancel-app').click(function () {
    $('.large.modal.cancel').modal('show');
  });

  $('.postpone-app').click(function () {
    $('.large.modal.postpone').modal('show');
  });

  $('.app-cancel-button').click(function () {
    $('.large.modal').modal('hide');
  });

  var sidebarMenu = document.querySelector('.side-menu');
  var sidebarBtn = document.querySelector('.burger-menu');
  var overlay = document.querySelector('.overlay');

  if (sidebarBtn) {
    sidebarBtn.addEventListener('click', event => {
      sidebarMenu.classList.add('active');
      overlay.classList.remove('hidden');
    });
  };

  if (overlay) {
    overlay.addEventListener('click', event => {
      overlay.classList.add('hidden');
      sidebarMenu.classList.remove('active');
    });
  };

  flatpickr(".datepicker", {
    dateFormat: "d.m.Y",
    defaultDate: "today",
    minDate: "today",
    locale: "ru"
  });

  $('.menu .item').tab();
});
