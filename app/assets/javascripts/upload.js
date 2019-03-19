$(document).on('turbolinks:load', function () {
  var inputPhoto = document.querySelectorAll('.input-photo');
  var inputPhotos = document.querySelector('.input-photos');
  var buttonPhoto = document.querySelector('.button-photo');

  if (inputPhotos) {
    inputPhotos.addEventListener('change', function(e) {
      $(`label[for="${inputPhotos.id}`).text(`Файлов: ${inputPhotos.files.length}`);
      if (inputPhotos.files.length == 6 ) {
        document.querySelector('.agreement-photos').classList.add('td-right');
        document.querySelector('.agreement-photos').classList.remove('td-wrong');
      } else {
        document.querySelector('.agreement-photos').classList.add('td-wrong');
        document.querySelector('.agreement-photos').classList.remove('td-right');
      }

      photoUploaded();
    });
  };

  if (inputPhoto) {
    inputPhoto.forEach(function(en) {
      en.addEventListener('change', function(e) {
        if (en.value != "") {
          console.log(en.value);
          console.log($(`label[for="${en.id}`));
          $(`label[for="${e.id}`).text('Фото выбрано');
          document.querySelector(`.${en.id}`).classList.add('td-right');
          document.querySelector(`.${en.id}`).classList.remove('td-wrong');
        } else {
          $(`label[for="${e.id}`).text('Выбрать фото');
          document.querySelector(`.${en.id}`).classList.remove('td-right');
          document.querySelector(`.${en.id}`).classList.add('td-wrong');
        };
        photoUploaded();
      });
    });
  };

  function photoUploaded() {
    var inputFiles = inputPhotos.files.length == 6;
    var array = Array.from(inputPhoto);

    if (array.every(e => e.value != "") && inputFiles) {
      buttonPhoto.classList.remove('hidden');
    } else {
      buttonPhoto.classList.add('hidden');
    }
  }
});

