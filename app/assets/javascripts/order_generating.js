$(document).ready(() => {
  var service_price = $('#order_service_price_id');
  service_price.select2({
    ajax: {
      url: "http://localhost:8080/api/v1/service_price",
      dataType: 'json',
      delay: 250,
      quietMillis: 100,
      data: function (params) {
        return {
          term: params.term
        };
      },
      processResults: function(data)
      {
        return {
          results: $.map(data, function(obj) {
              return {
                id: obj.id,
                service_name: obj.service_name,
                company_name: obj.company_name,
                city_name: obj.city_name,
                price: obj.price
              };
            })
          };
        },
      cache: true
    },
    allowClear: true,
    placeholder: 'Поиск по сервисам',
    templateResult: formatService,
    templateSelection: formatServiceSelection
  });
  $('.select2-container').width('100%');
})

function formatService (service) {
  if (service.loading) {
    return service.text;
  }

  var $container = $(
    "<div class='select2-result-service__service_name clearfix'>" +
      "<div class='select2-result-service__service_name'></div>" +
      "<div class='select2-result-service__company_name'></div>" +
      "<div class='select2-result-service__city_name'></div>" +
      "<div class='select2-result-service__price'></div>" +
    "</div>"
  );

  $container.find(".select2-result-service__service_name").text('Сервис: ' + service.service_name);
  $container.find(".select2-result-service__company_name").text('Компания: ' + service.company_name);
  $container.find(".select2-result-service__city_name").text('Город: ' + service.city_name);
  $container.find(".select2-result-service__price").text('Цена: ' + service.price + ' руб.');

  return $container;
}

 function formatServiceSelection (service) {
  if (service.service_name && service.price) {
    return service.service_name + ' ' + service.price + 'руб.';
  }
  return 'Поиск по сервисам'
 }