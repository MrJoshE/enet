$(document).ready(  function(){
    $('#unauthorized_home_button').click(function(){
        window.location.href='http://localhost:3000/';
    });

    $('#login_button').click(function(){
        let email = $('#email_field').val()
        let password = $('#password_field').val()
        $.ajax({
            url: '/sessions',
            type: 'post',
            data: {
                email: email,
                password: password,
            },
            xhrFields: {withCredentials: true}
        }).then(
            val => {
                if (val.logged_in) {
                    window.location.href=val.location;
                }
                else {
                    // alert('Invalid email or password');
                    $.get(window.location.href).then(payload => {
                        $('body').html(payload.substring(payload.indexOf('body')+6,payload.indexOf('</body>')));
                    });
                }
            }
        )
    });

    $('#register_button').click(function(){
        window.location.href = '/registrations';
    });

})