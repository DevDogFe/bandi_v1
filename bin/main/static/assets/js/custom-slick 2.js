/* document.ready랑 같은 의미 */
$(function(){
    // Slick.js
    
})

$(function(){

    /* 브라우저를 스크롤 했다면 실행 */
    $(window).scroll(function(){
        /* 살짝이라도(50) 스크롤 했다면 작동 */
        if($(window).scrollTop() > 50){
            $('header').addClass('active');
        }
        else{
            $('header').removeClass('active');
        }
    })
    
    $('.bigSlider').slick({
        /* 무한 반복 */
        infinite: true,
        /* 처음에 3개 보여줘 */
        slidesToShow: 1,
        /* 스크롤 시에 3개 보여줘 */
        slidesToScroll: 1,
        /* 자동 회전 */
        autoplay: true,
        /* 자동 회전 속도 */
        autoplaySpeed: 2000
      });
      
    $('.top-rightSlider').slick({
        /* 무한 반복 */
        infinite: true,
        /* 처음에 3개 보여줘 */
        slidesToShow: 1,
        /* 스크롤 시에 3개 보여줘 */
        slidesToScroll: 1,
        /* 자동 회전 */
        autoplay: true,
        /* 자동 회전 속도 */
        autoplaySpeed: 1500
      });

    $('.topSlider').slick({
        /* 무한 반복 */
        infinite: true,
        /* 처음에 3개 보여줘 */
        slidesToShow: 3,
        /* 스크롤 시에 3개 보여줘 */
        slidesToScroll: 3,
        /* 자동 회전 */
        autoplay:true,
        /* 자동 회전 속도 */
        autoplaySpeed: 2000
      });

    $('.mySlider').slick({
        dots: true,
        infinite: true,
        speed: 1300,
        slidesToShow: 3,
        slidesToScroll: 3,
        autoplay:true,
        autoplaySpeed: 2000,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });
})