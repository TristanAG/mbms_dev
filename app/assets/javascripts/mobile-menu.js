

$( document ).ready( function() {
  //init state
  var visible = false
  $( '#mobile-menu' ).hide()

  $( '#menu-display' ).click(function () {
    if( !visible ){
      visible = true
      $( '#mobile-menu' ).slideDown( 'fast' )
    } else {
      visible = false
      $( '#mobile-menu' ).slideUp( 'fast' )
    }
  })
})
