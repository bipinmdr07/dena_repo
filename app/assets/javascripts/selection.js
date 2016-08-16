if (!window.x) {
    x = {};
}

x.Selector = {};
x.Selector.getSelected = function() {
    var t = '';
    if (window.getSelection) {
        t = window.getSelection();
    } else if (document.getSelection) {
        t = document.getSelection();
    } else if (document.selection) {
        t = document.selection.createRange().text;
    }
    return t;
}

var pageX;
var pageY;

$(document).ready(function() {
    $(document).bind("mouseup", function() {
        var selectedText = x.Selector.getSelected();
        if(selectedText != ''){
          // document.getElementById("mytext").value = selectedText;
            $('ul.selText').css({
                'left': pageX + 0,
                'top' : pageY - 0
            }).fadeIn(200);
        } else {
            $('ul.selText').fadeOut(200);
        }
    });
    $(document).on("mousedown", function(e){
        pageX = e.pageX;
        pageY = e.pageY;
    });
});

function passValue() {
  document.getElementById("mytext").value = selectedText;
}
