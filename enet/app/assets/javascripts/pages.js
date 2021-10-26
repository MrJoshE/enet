$(document).ready(  function(){
     $('#login_button').click( function() {
        let email = $('#email_field').val()
        let password = $('#password_field').val()
         $.ajax({
            type: 'post',
            crossDomain: true,
             url: "http://localhost:3000/sessions",
             dataType: 'json',
            data: {
                email: email,
                password: password,
                password_confirmation: password
            },
             xhrFields: { withCredentials: true },

            }
        ).then(val=> {
            if(val['logged_in']) window.location.href = 'http://localhost:3000/dashboard';
            else window.location.href = 'http://localhost:3000/unauthorized'
         });


    });
})