var show_page_trigger;
show_page_trigger = function(){
  var scroll_sidebar, add_active_to_nav, ready, add_offset;  

  scroll_sidebar = function() {
    var sidebar, position_sidebar;
    sidebar = $(".sidebar_container");

    position_sidebar = function(){
      if (76 - $(window).scrollTop() > 0) {        
        sidebar.css("top", 76 - $(window).scrollTop());  
      } else {
        sidebar.css("top", 0);
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
    target[0].parentNode.scrollTop = target[0].offsetTop; 
  }

  // scroll to current lesson
  slider_init = function() {
    // $("#sidebar-flashcard-form").slideReveal({
    //   trigger: $("#flashcard-trigger"), 
    //   position: "right",
    //   width: 350,
    //   speed: 700,
    //   top: 0
    // });
  };  

  scroll_sidebar();
  add_active_to_nav();
  slider_init();
  add_offset();  
}