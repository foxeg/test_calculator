$(document).ready ->
  $("input.payment_input").each ->
    input = $(this)
    id = $(this).data("id")
    $(".plan_payment[data-id='"+id+"']").on 'click', ->
      console.log "CLICKED"      
      $.ajax
        url: "plan_payment"
        type: "GET"
        data: {period_number: id}
        dataType: 'json'
        statusCode:
          500: ->
            console.log "ERROR"
          401: ->
            console.log "ERROR"
          200: (data) ->
            console.log "UPDATED"
            input.val(data.amount)
    $(".overdue_payment[data-id='"+id+"']").on 'click', ->
      console.log "CLICKED"      
      $.ajax
        url: "overdue_payment"
        type: "GET"
        data: {period_number: id}
        dataType: 'json'
        statusCode:
          500: ->
            console.log "ERROR"
          401: ->
            console.log "ERROR"
          200: (data) ->
            console.log "UPDATED"
            input.val(data.amount)
    $(".early_payment[data-id='"+id+"']").on 'click', ->
      console.log "CLICKED"      
      $.ajax
        url: "early_payment"
        type: "GET"
        data: {period_number: id}
        dataType: 'json'
        statusCode:
          500: ->
            console.log "ERROR"
          401: ->
            console.log "ERROR"
          200: (data) ->
            console.log "UPDATED"
            input.val(data.amount)
            if id+1 <= $("input.payment_input").length
              for i in [id+1..$("input.payment_input").length]
                $("input.payment_input[data-id='"+i+"']").val(0)
