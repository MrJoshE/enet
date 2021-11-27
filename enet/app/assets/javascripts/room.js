$(document).ready(  function(){
    $('#new_room_m_message').on('ajax:success', function(e, data, status, xhr){
        $(this).find('input[type=text]').val('');
        $(this).append(xhr.responseText);
    });
});