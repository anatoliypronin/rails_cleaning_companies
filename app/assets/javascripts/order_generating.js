$(document).ready(() => {
  var company = $('#order_company_id');
  var service = $('#order_service_id');
  var company_label = $("label[for='order_company_id']");
  company.hide();
  company_label.hide();
  service.change(() => {
    $('#order_service_id option:selected').each(() => {
      company_label.show();
      company.select2({
        ajax: {
          url: "http://localhost:8080/api/v1/service/" + service.val(),
          dataType: 'json',
          delay: 250,
          quietMillis: 100,
          processResults: function(data)
          {
            return {
              results: $.map(data, function(obj) {
                  return {
                    id: obj.id,
                    name: obj.name,
                    price: obj.price
                  };
                })
              };
            },
          cache: true
        },
        allowClear: true,
        placeholder: 'Search for companies',
        templateResult: formatCompany,
        templateSelection: formatCompanySelection
      });
      $('.select2-container').width('100%');
    });
    if (service.val() == '') {
      $('.select2-container').hide();
      company.hide();
      company_label.hide();
    }
  });
})

function formatCompany (company) {
  if (company.loading) {
    return company.text;
  }

  var $container = $(
    "<div class='select2-result-company__name clearfix'>" +
      "<div class='select2-result-company__name'></div>" +
      "<div class='select2-result-company__price'></div>" +
    "</div>"
  );

  $container.find(".select2-result-company__name").text(company.name);
  $container.find(".select2-result-company__price").text(company.price + ' руб.');

  return $container;
}

 function formatCompanySelection (company) {
  return company.name;
 }