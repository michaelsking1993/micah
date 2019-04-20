$(document).on('turbolinks:load', () => {
    //let $body = $('body');
    let $tutorial_modal = $('#tutorial-modal');

    $('.dashboard-question-circle').on('click', () =>  {
        $tutorial_modal.toggleClass('is-active');
    })

    $tutorial_modal.find('.close-modal').click(function(){
        $tutorial_modal.toggleClass('is-active');
    })

})