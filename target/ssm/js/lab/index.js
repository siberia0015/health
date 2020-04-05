$(function ()
{
    $('.change a').click(function ()
    {
        $('.signform').animate({height: 'toggle', opacity: 'toggle'}, 'slow');
    });
})

function start() {
    document.getElementById('signform').style.display=""
}

function signclose() {
    document.getElementById('signform').style.display="none"
    document.getElementById('registerform').style.display="none"
}
function loading() {
    document.getElementById('registerloading').style.display=""
}