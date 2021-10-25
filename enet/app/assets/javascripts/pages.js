$(document).ready(function(){
    console.log('hello');
    $('#login_button').onclick(function(){
        let email = $('#email_field')
        let password = $('#password_field')
        let password_confirmation = password;
        alert(`email: ${email}\npassword: ${password}`)
    })
})