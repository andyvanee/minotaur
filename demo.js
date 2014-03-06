(function(){
  var href_to_id = function(href) { return href.substr(1) }
  var id_to_hash = function(id) { return '#/'+id }

  var activate_id = function(id) {
    $('.page').removeClass('active');
    $('#'+id).addClass('active');
    window.location.hash = id_to_hash(id);
  }

  $(function(){
    $('[href^="#"]').click(function(ev){
      ev.preventDefault();
      var id = href_to_id($(this).attr('href'));
      activate_id(id);
    });

    if (window.location.hash) {
      activate_id(window.location.hash.substr(2));
    }
  });

})();
