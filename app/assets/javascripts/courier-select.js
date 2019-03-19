$(document).on('turbolinks:load', function () {
  var courierId = document.querySelector('#application_user_id');
  var newAppStatus = document.querySelector('.new-app-status');

  if (courierId && newAppStatus) {
    statusChange();
  };

  function statusChange() {courierId.addEventListener('change', function() {
      if (courierId.value != "") {
        newAppStatus.value = 2;
      }
    });
  };
});
