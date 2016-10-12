var show_page_trigger;
show_page_trigger = function(){
  var scroll_sidebar, add_active_to_nav, ready, add_offset;  

  scroll_sidebar = function(element){    

    let position_sidebar = function(){
      if (76 - $(window).scrollTop() > 0) {        
        element.css("top", 76 - $(window).scrollTop());  
      } else {
        element.css("top", 0);
      }
    }

    position_sidebar();
    $(document).bind('scroll', position_sidebar);
  }

  add_active_to_nav = function(){
    var url;

    url = window.location;
    // Will only work if string in href matches with location
    $('ul.nav a[href="'+ url +'"]').parent().addClass('active');

    // Will also work for relative and absolute hrefs
    $('ul.nav a').filter(function() {
        return this.href == url
    }).parent().addClass('active');

    $('ul.nav a').filter(function() {
        return this.href == url
    }).parent().parent().addClass('collapse in');

    $('ul.nav a').filter(function() {
        return this.href == url
    }).parent().parent().parent().closest('li').find('a').attr('aria-expanded', 'true');

  }

  add_offset = function(){
    var target;

    target = document.getElementsByClassName("active");
    // target[0].parentNode.scrollTop = target[0].offsetTop; 
  }

  scroll_sidebar($(".sidebar_container_right"));
  scroll_sidebar($("#sidebar-left-trigger"));
  add_active_to_nav();
  add_offset();  

  window.onresize = function(){
    $(".sidebar_container_right").css("width", $(window).width() / 8.88 + 360 - 30);
    $(".sidebar-right").css("width", $(window).width() / 8.88 - 30);
  }

}