$(() => {
    $('.ui').css({ 'left': '-13vw' }, 1000);
    toggle = false;
    window.addEventListener('message', (event) => {
        let v = event.data;
        if (v.type) {
            if (!toggle){
            $('.ui').show();
            $('.text').html(v.msg);
            $('.ui').css({ 'transition': '.4s','left': '2vw' });
            toggle = true;
                }
            }
            else if (v.type == false) {
                if (toggle){
                    toggle = false;
                $('.ui').css({ 'transition': '.4s','left': '-13vw' });
                setTimeout(() => {
                    $('.ui').hide();
                }, 3000);
            }
            }
    });
});