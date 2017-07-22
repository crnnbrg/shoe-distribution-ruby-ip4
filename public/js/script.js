$(document).ready(function(){
    $(".newstore").click(function(){
        $(".new_store_form").fadeIn(1500);
    });

    $(".submit_store").click(function(){
        $(".new_store_form").fadeOut(1500);
    });

    $("#add_brand_btn").click(function(){
        $(".new_brand_form").fadeIn(1500);
    });

    $(".submit_brand").click(function(){
        $(".new_brand_form").fadeOut(1500);
    });
});