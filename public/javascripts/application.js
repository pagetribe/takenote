$(document).ready(function(){
    $(".tags span").click(function(){
        var tag;
        // if there is already a tag add a space
        $("#post_tag_names").val().length ? tag = " " + $(this).text() : tag = $(this).text();
        if ($("#post_tag_names").val().indexOf($(this).text()) == -1) // if tag does not already exist in field add
            $("#post_tag_names")[0].value += tag;
            $(this).addClass("used_tag");
//            $(this).wrap("<s>");
            
//            console.log("added" + $(this).text())
//var str = $("#post_tag_names").val();
//console.log(str)
//var containsFoo = str.indexOf($(this).text()) >= 0; // true
//console.log(containsFoo);
//        if td:contains(Some Value)
    });
});
