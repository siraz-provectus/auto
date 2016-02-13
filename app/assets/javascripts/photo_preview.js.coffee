window.PhotoPreview =
  init: ->
    $(document).on 'click', '.js-file-input', (e) ->
	    $(this).change(
	      (event) ->
	        input = $(event.currentTarget)
	        file = input[0].files[0]
	        window.upload_file = file
	        current_image = $("img.b-photo-upload__photo##{event.currentTarget.id}")

	        if file.size > 10000000
	          $('.js-photo-upload-text').css('color', 'red').text('Фотография должна быть не более 1 Mb')
	          current_image.attr("src", null)
	          return
	        reader = new FileReader()
	        reader.onload = (e) ->
	          image_base64 = e.target.result

	          current_image.attr("src", image_base64).height(100).width(130)
	          image_id = current_image.attr('id')
	          new_element_id = parseInt(image_id.split('_')[1]) + 1

	          $('.js-photo-upload-text').text('Фотография должна быть не более 10 Mb')

	          if !$('img.b-photo-upload__photo').is("#image_#{new_element_id}")
	          	image_item_template = Handlebars.compile($('#image_item_template').html())
	          	$('#images_list').append(image_item_template({'image_id': new_element_id}))

	          	add_item_button_template = Handlebars.compile($('#add_item_button_template').html())
	          	$('#add_image_buttons').append(add_item_button_template({'image_id': new_element_id}))

	          return

	        reader.readAsDataURL file
	        return false
	      )
