$(document).on('turbolinks:load', () => {
    //let $body = $('body');
    let $tutorial_modal = $('#tutorial-modal');

    $('#dashboard-question-circle').on('click', () =>  {
        $tutorial_modal.toggleClass('is-active');
    })

    $tutorial_modal.find('.close-modal').click(function(){
        $tutorial_modal.toggleClass('is-active');
    })


    $('#tabs').find('li').on('click', function() {
        let tab = $(this).data('tab');

        $('#tabs li').removeClass('is-active');
        $(this).addClass('is-active');

        $('#tab-content p').removeClass('is-active');
        $('p[data-content="' + tab + '"]').addClass('is-active');
    });


})