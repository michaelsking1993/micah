// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery-ui/widgets/accordion
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){

    //this removes the flash message banner after a few seconds.
    setTimeout(function() {
        $('[class^="isa_"]').fadeOut().empty();
    }, 4000);

    changeTabsListener();

    activateProjectAccordions();
});

function activateProjectAccordions(){
    let $projects = $('.projects');
    // let active_project_index = $projects.data('active-project-index');
    $projects.accordion({
        heightStyle: 'content',
        active: 0, //active_project_index == '' ? 0 : active_project_index, //which index div should be shown open. '' if none. For now, keep 1st open.
        collapsible: true
    })
}

function changeTabsListener(){
    $('[id$="-link"]').click(function() {
        changeTabs(this);
    });
}

function changeTabs(clicked_tab){
    let tabs = $(clicked_tab).closest('ul').find('li');
    activateTab(clicked_tab, tabs)
    showTabContent(clicked_tab, tabs)
}

function activateTab(clicked_tab, tabs){
    $.each(tabs, function(i, tab){
        $(tab).removeClass('is-active');
    });
    $(clicked_tab).addClass('is-active');
}

function showTabContent(clicked_tab, tabs){
    let content_id = $(clicked_tab).attr('id').replace('-link', '');
    $.each(tabs, function(i, tab){
        $('#' + $(tab).attr('id').replace('-link', '')).css('display', 'none')
    });
    $('#' + content_id).show();
}


function renderFlashMessages(flash_type, flash_message){
    let flash_html = "<div class='isa_" + flash_type + " flash-offset flash-message'>" + flash_message + "</div>";
    $('.site-content').before(flash_html);
    setTimeout(function() {
        $('.isa_' + flash_type).fadeOut().empty();
    }, 4000);
}