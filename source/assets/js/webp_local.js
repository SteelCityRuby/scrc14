function useRegular(){
  $("img[data-webp]").each(function(){
    $(this).attr("src", $(this).data("src"));
  });
}
function useWebP(){
  $("img[data-webp]").each(function(){
    $(this).attr("src", $(this).data("webp"));
  });
}

$(function(){
  if(WebP) {
    WebP.isSupport(function(isSupported){
      if(isSupported) useWebP();
      else useRegular();
    });
  } else {
    useRegular();
  }

});
