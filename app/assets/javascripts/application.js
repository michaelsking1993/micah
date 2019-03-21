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

    let $projects = $('#projects');
    let active_project_index = $projects.data('active-project-index');
    $projects.accordion({
        heightStyle: 'content',
        active: active_project_index, //which index div should be shown open. '' if none.
        collapsible: true
    })

/*
    $('.conjugation-accordion-indicative').accordion({
        heightStyle: "content",
        active: active_indic,
        collapsible: true
    });
    $('.conjugation-accordion-subjunctive').accordion({
        heightStyle: "content",
        active: active_subj,
        collapsible: true
    });
    $('.conjugation-accordion-imperative').accordion({
        heightStyle: "content",
        active: active_imp,
        collapsible: true
    });
    */

});

