window.PhotoUpload =
  init: ->
    $(document).on 'click', '.js-image-thumbnail-btn', (e) ->
      e.preventDefault()
      console.log '--------upload----'
      $('.js-file-input-upload').trigger 'click'

      $('.js-file-input-upload').change(
        console.log '--------upload 2----'
        (event) ->
          input = $(event.currentTarget)
          file = input[0].files[0]
          window.upload_file = file
          if file.size > 10000000
            $('.js-photo-upload-text').css('color', 'red').text('Фотография должна быть не более 10 Mb')
            $('img.b-photo-upload__photo').attr("src", null)
            return
          reader = new FileReader()
          reader.onload = (e) ->
            image_base64 = e.target.result
            $('img.b-photo-upload__photo').attr("src", image_base64).height(100).width(130)
            $('.js-photo-upload-text').text('')
            console.log '--------submit----'
            $('#new_photo').submit()

          reader.readAsDataURL file

          return false
        )
