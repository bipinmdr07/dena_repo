let sidebar = {
  opened: false,

  openNav: function() {
    $("#sidebar-reveal-container").css("width", "300px");
    $("#sidebar-left-trigger").css("left", "300px");
    $('body').css("marginLeft", "300px");
    this.opened = true;
  },

  closeNav: function() {
    $("#sidebar-reveal-container").css("width", "0px");
    $("#sidebar-left-trigger").css("left", "0px");
    $('body').css("marginLeft", "0px");    
    this.opened = false;
  },

  toggleNav: function() {
    if (sidebar.opened) {
      console.log("Hi");
      sidebar.closeNav();
    } else {
      console.log("closed");

      sidebar.openNav();
    }
  }
}