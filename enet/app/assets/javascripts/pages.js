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
        }).then(val => {
            if (val['logged_in'] === false){
                alert('Unable to login with the given email and password.')
            }else if (val['logged_in'] === true){
                alert('Login Successful')
                window.location.href = '/dashboard'
            }else{
                console.log(`logged_in not true or false. val: ${val}`)
            }
        });
    });

    $('#register_button').click(function(){
        window.location.href = '/registrations';
    });

})