window.RemovePhoto =
  init: ->
    $(document).on 'click', '.js-remove-image', ->
      image_container = $(this).parents('.js-thumbnail-container')
      image_thumbnail = image_container.find('img')
      image_id = image_thumbnail.attr('id')

      if image_thumbnail.attr('src') == undefined
        add_empty_thumbnail = true
      else
        add_empty_thumbnail = false

      $.ajax
        url: '/photos/' + parseInt(image_id.split('_')[1])
        type: 'DELETE'
        success: (result) ->
          $(".js-file-input##{image_id}").remove()
          image_container.remove()

          if add_empty_thumbnail
            console.log '-------removed empty---------'
            image_item_template = Handlebars.compile($('#image_item_template').html())
            $('#images_list').append(image_item_template())

          return

