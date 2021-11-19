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
                console.log(val);
                if (val['status'] === 200){
                    alert('Account created. Sending you to the dashboard now.');
                    window.location.href = '/dashboard';
                }
                else if (val['status'] === 500 || val['status'] === 400){
                    alert(val['reason']);
                }else{
                    console.log(`The following status was not accounted for. status: ${val['status']}`);
                    alert('Your account could not be created. Please contact an administrator if this keeps happening.');
                    console.log(`The following status was not accounted for. status: ${val['status']}`);
                }
            });
        }
        catch(e){
            alert(e)
        }

    });



})