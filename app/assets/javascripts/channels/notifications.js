App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data);
    // Called when there's incoming data on the websocket for this channel
    $(data.html).insertAfter( $("#notifications > li:nth-child(1)") );
    $("time.timeago").timeago();
    let unread_count = parseInt($("[data-behavior='unread-count']").text());
    $("[data-behavior='unread-count']").text(unread_count + 1);
    notification_sound.play();
    flashTitle("New notification", 100);
  }
});

(function () {

var original = document.title;
var timeout;

window.flashTitle = function (newMsg, howManyTimes) {
    function step() {
        document.title = (document.title == original) ? newMsg : original;

        if (--howManyTimes > 0) {
            timeout = setTimeout(step, 1000);
        };
    };

    howManyTimes = parseInt(howManyTimes);

    if (isNaN(howManyTimes)) {
        howManyTimes = 5;
    };

    cancelFlashTitle(timeout);
    step();
};

window.cancelFlashTitle = function () {
    clearTimeout(timeout);
    document.title = original;
};

}());