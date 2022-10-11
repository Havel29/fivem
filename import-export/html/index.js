$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://nui2/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://nui2/exit', JSON.stringify({}));
        return
    })
    //when the user clicks on the submit button, it will run
    $("#submit").click(function () {
        //let inputValue = $("#input").val()
        let quantita = $('#quantita').val()
        let merce = $('#merce').val()
        if (!merce || !quantita) {
            $.post("http://nui2/error", JSON.stringify({
                error: "Riempi tutti i campi!"
            }))
            return
        }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post('http://nui2/vendi', JSON.stringify({
            merce: merce,
            quantita: quantita
        }));
        return;
    })
})