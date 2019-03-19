$(document).on('turbolinks:load', function () {
  // if ($('.page-name').attr('data-page') == 'courier-home') {
    App.cable.subscriptions.create('ApplicationsChannel', {
      connected: function () {
      },

      received: function (data) {
        if (data.delete) {
          $(`#${data.id}`).slideUp("slow", function() {
            $(this).remove();
          });

          document.querySelector(`.table-app-${data.id}`).remove();
        }

        else if (data.create) {
          $(`.cards.${data.courier_id}`).append(this.renderCourierApp(data));

          if (data.status_id == 1) {
            $('#app-to-distribute').find('tbody').append(this.renderDistributeTableRow(data));
          } else if (data.status_id == 2) {
            $('#app-to-hand-out').find('tbody').append(this.renderHandOutTableRow(data));
            $(`.cards.${data.courier_id}`).append(this.renderCourierApp(data));
          };
        }

        else if (data.update) {
          if (data.user_id == data.courier_id && data.status_id > 12) {
            window.location.replace('/');
            console.log('Возврат на главную');
          } else if (data.user_id == data.courier_id) {
            location.reload();
            console.log('Релоад страницы');
          } else if (data.user_id != data.courier_id) {
            if ("vibrate" in navigator) {
              window.navigator.vibrate(500);
            };
          };

          if (document.querySelector(`.table-app-${data.id}`)) {
            document.querySelector(`.table-app-${data.id}`).remove();
          };

          if (data.status_id == 2) {
            $('#app-to-hand-out').find('tbody').append(this.renderHandOutTableRow(data));
          } else if (data.status_id > 2 && data.status_id < 12) {
            $('#app-processing').find('tbody').append(this.renderProcessingRow(data));
          } else if (data.status_id == 12) {
            $('#app-collect-documents').find('tbody').append(this.renderCollectDocumentsRow(data));
          };


          if (data.status_id == 4) {
            $('#authorizer-meeting').find('tbody').append(this.renderMeetingRow(data));
          } else if (data.status_id == 6) {
            $('#authorizer-verification').find('tbody').append(this.renderVerificationRow(data));
          } else if (data.status_id == 8) {
            $('#authorizer-photo').find('tbody').append(this.renderPhotoRow(data));
          } else if (data.status_id == 11) {
            $('#authorizer-card').find('tbody').append(this.renderCardRow(data));
          } else if (data.status_id == 13) {
            $('#authorizer-postpone').find('tbody').append(this.renderPostponeRow(data));
          };

          if (data.status_id < 13 && data.status_id > 1) {
            $(`#courier-app-${data.id}`).remove();
            $(`.cards.courier-id-${data.courier_id}`).prepend(this.renderCourierApp(data));
          } else if (data.status_id > 12) {
            $(`#courier-app-${data.id}`).remove();
          };
        };
      },

      renderCourierApp: function (data) {
        return `<a href='/applications/${data.id}'  class='ui card card-courier'
        id='courier-app-${data.id}'>
        <div class='content'><div class='header'>${data.name}
              <span class='card-courier notice right floated ui label card-courier ${data.color}'>${data.status_courier}</span>
        </div>
        <div class='description'>
          <p>${data.address}</p>
          <p>Тел: ${data.phone}</p>
          <p>ID: ${data.id}</p>
        </div>
        </div>
        <div class='extra content'>
          <p>Встреча: ${data.time}, время: ${data.timeslot}</p>
        </div>
        </a>`;
      },

      renderDistributeTableRow: function(data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>Курьер не выбран</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned"><a class="ui button small green" data-remote="true" href="/applications/${data.id}/edit">Распределить</a></td>
        </tr>`
      },

      renderHandOutTableRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned position-relative">
              <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
                <input value="3" type="hidden" name="application[status_id]" id="application_status_id">
                <input type="submit" name="commit" value="Документы выданы" class="button ui blue mini" data-disable-with="Документы выданы">
              </form>
              <a data-remote="true" href="/applications/${data.id}/edit">
                <i class="icon-table far fa-edit"></i>
              </a>
           </td>
        </tr>`
      },

      renderProcessingRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td>${data.status_supervisor}</td>
        </tr>`
      },

      renderCollectDocumentsRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
              <input value="14" type="hidden" name="application[status_id]" id="application_status_id">
              <input type="submit" name="commit" value="Документы получены" class="button ui blue small" data-disable-with="Документы выданы">
            </form>
          </td>
        </tr>`
      },

      renderMeetingRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
              <input value="5" type="hidden" name="application[status_id]" id="application_status_id">
              <input type="submit" name="commit" value="Подтверждено" class="button ui blue mini" data-disable-with="Документы выданы">
            </form>
          </td>
        </tr>`
      },

      renderVerificationRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
              <input value="7" type="hidden" name="application[status_id]" id="application_status_id">
              <input type="submit" name="commit" value="Подтверждено" class="button ui blue mini" data-disable-with="Документы выданы">
            </form>
          </td>
        </tr>`
      },

      renderPhotoRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <a class="ui button blue mini"  href="/applications/${data.id}">Проверить фото</a>
          </td>
        </tr>`
      },

      renderCardRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
              <input value="12" type="hidden" name="application[status_id]" id="application_status_id">
              <input type="submit" name="commit" value="Карта привязана" class="button ui blue small" data-disable-with="Документы выданы">
            </form>
          </td>
        </tr>`
      },

      renderCollectDocumentsRow: function (data) {
        return `<tr class="table-app-${data.id}">
          <td>${data.id}</td>
          <td>${data.sputnikid}</td>
          <td>${data.name}</td>
          <td>${data.phone}</td>
          <td>${data.address}</td>
          <td>${data.courier}</td>
          <td>${data.time}</td>
          <td>${data.timeslot}</td>
          <td class="center aligned">
            <form class="form-table" id="edit_application_${data.id}" action="/applications/${data.id}" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch">
              <input value="14" type="hidden" name="application[status_id]" id="application_status_id">
              <input type="submit" name="commit" value="Документы получены" class="button ui blue small" data-disable-with="Документы выданы">
            </form>
          </td>
        </tr>`
      }
    });
  // };
});


