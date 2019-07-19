$(function(){
  $("#price-input").on('keyup',function(e){
    e.preventDefault();
    var input = $("#price-input").val();
    if( 300 <= input && input <= 9999999) {
      var fee = Math.floor(input / 10);
      var total = (input - fee);
      $("#fee").text(fee.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"}) + "円");
      $("#total").text(total.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"}) + "円");
    }
    else{
      $("#fee").text("ー");
      $("#total").text("ー");
    }
  });
});