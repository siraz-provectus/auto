DatePicker = window.DatePicker =
  init: ->
    DatePicker.date_init()

  date_init: ->
    $("#date").datepicker
      defaultDate: "+1w"
      format: "dd/mm/yyyy"
      language: "ru"
      changeMonth: true
      numberOfMonths: 3
