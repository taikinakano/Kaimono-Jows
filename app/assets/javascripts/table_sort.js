$(function(){
  $('.table-sortable').sortable({
    update: function(e, ui){
      let item = ui.item;
      let item_data = item.data();
      let params = {_method: 'post'};
      console.log(params);
      const ajaxPostUrl = item_data.updateUrl;

      const token = $('meta[name="csrf-token"]').attr('content');
      // console.log(token);
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
        type: 'POST',
        headers: {
          //'X-HTTP-Method-Override': 'POST',
          //'Content-Type': 'application/json',
          'X-CSRF-Token': token
        },
        url: ajaxPostUrl,
        dataType: 'json',
        data: params
      });
    },
    stop: function(e, ui){
      ui.item.children('td').not('.item__status').effect('highlight', { color: "#FFFFCC" }, 500)
    }
  });
});