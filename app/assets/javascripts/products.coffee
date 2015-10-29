window.load_stream_table = ->
  template = $.trim($('#product_table_template').html())
  Mustache.parse template

  view = (record, index) ->
    Mustache.render template,
      record: record
      index: index

  options = {
    view: view,
    data_url: '/products.json',
    stream_after: 2,
    fetch_data_limit: 500,
    pagination:{
      span: 5,
      next_text: 'Next &rarr;',
      prev_text: '&larr; Previous',
      container_class: 'text-center',
      per_page_select: true,
      per_page_class: 'hide'
    },

    search_box: '#table_search'
  }

  StreamTable('#products_stream', options, products)
