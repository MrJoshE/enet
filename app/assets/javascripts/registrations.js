$(document).ready(  function(){

    $('#registrations_register_button').click(function(){

        let email = $('#email_field').val()
        let password = $('#password_field').val()
        let password_confirmation = $('#password_confirmation_field').val()
        if (password !== password_confirmation) {
            alert('The password and the password confirmation must be the same.')
            return;
        }

        let modules = [];

        $("input[id^='module_checkbox_']").each((i, el) => {

            let checkbox = $(el);
            if (checkbox.is(':checked'))
                modules.push(checkbox.attr('value'));

        } );
        try{
             $.ajax({
                url: '/registrations',
                type: 'post',
                data: {
                    email: email,
                    password: password,
                    password_confirmation: password_confirmation,
                    modules: modules
                },
                xhrFields: {withCredentials: true}
            }).then(val => {
                if (val.status === 302) {
                    window.location.href = val.location;
                }else {
                    $.get(window.location.href).then(payload => {
                        $('body').html(payload.substring(payload.indexOf('body')+6,payload.indexOf('</body>')));
                    });
                }
             })
        }
        catch(e){
            alert(e)
        }

    });



})