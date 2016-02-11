window.PhotoUpload =
  init: ->
    $(document).on 'click', '.js-file-input', (e) ->
	    $(this).change(
	      (event) ->
	        input = $(event.currentTarget)
	        file = input[0].files[0]
	        window.upload_file = file
	        if file.size > 1000000
	          $('.js-photo-upload-text').css('color', 'red').text('Фотография должна быть не более 1 Mb')
	          $('img.b-photo-upload__photo').attr("src", null)
	          $('.js-feedback-submit').addClass('disabled')
	          return
	        reader = new FileReader()
	        reader.onload = (e) ->
	          image_base64 = e.target.result
	          $('img.b-photo-upload__photo').attr("src", image_base64).width(140)
	          $('.js-photo-upload-text').text('')

	          image_item_template = Handlebars.compile($('#image_item_template').html())
	          $('#images_list').append(image_item_template())

	          add_item_button_template = Handlebars.compile($('#add_item_button_template').html())
	          $('#add_image_buttons').append(add_item_button_template())

	          return

	        reader.readAsDataURL file
	        # fileName = $(this).val();
	        # if fileName.length > 17
	        #   fileName = fileName.substring(0, 14) + '...'
	        # $('.js-photo-upload-text').removeAttr('style').text(fileName)
	        return false
	      )

