<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반디</title>
    <script src="js/jquery-3.5.1.min.js"></script>
    <!-- jquery-3.5.1이 위에 있어야 작동 -->
    <!-- Slick.js -->

    <!-- Slider.js no CDN -->
    <!-- <script src="js/slick/slick.min.js"></script>
    <link rel="stylesheet" href="js/slick/slick.css">
    <link rel="stylesheet" href="js/slick/slick-theme.css"> -->

    <!-- Slider.js CDN -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- 작성한 css는 항상 밑에 있어야함 -->
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <div class="container">
      <header>
        <div class="banner">
          <div class="lnb">
            <a href="#none"><em>for</em> member</a>
            <a href="#none">로그인</a>
            <a href="#none">회원가입</a>
          </div>
        </div>
        <nav>
          <div class="logo">
            <a href="#none"><img src="images/bandi-logo3.png"></a>
          </div>
          <ul class="gnb">
            <li><a href="#none">HOME</a></li>
            <li><a href="#none">소설</a></li>
            <li><a href="#none">공모전</a></li>
            <li class="dropdown">
              <a href="#none" class="dropbtn">게시판</a>
              <div class="dropdown-content">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
              </div>
            </li>
            <li><a href="#none">고객지원</a></li>
            <li><a href="#none">마이페이지</a></li>
          </ul>
        </nav>
      </header>
      <main class="intro">
        <div class="inner">
          <div class="heading">
            <h1>The World’s Best fiction site</h1>
            <p>
              당신의 일상을 반디~<br>
              소설과 무제한 친해지리
            </p>
          </div>
        </div>
      </main>
      <!-- 유료 -->
      <section class="ranking pay">
        <div class="inner">
          <div class="ranking-content">
            <h2>유료 웹소설 베스트 5</h2>
            <div class="items">
              <div class="item">
                <div class="up-image">
                  <img src="images/ai1.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge pay">유료 소설</span>
                  <h3>단종이 너무 강함</h3>
                  <p>조선 최강의 정통성을 가지고 태어났지만 '수양' 당해버린 왕 단종이 되어버렸다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai2.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge pay">유료 소설</span>
                  <h3>나 혼자만 강화술사</h3>
                  <p>세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai3.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge pay">유료 소설</span>
                  <h3>내 집에 영약 광산이 열렸다</h3>
                  <p>어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai4.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge pay">유료 소설</span>
                  <h3>해고 후 상속 대박</h3>
                  <p>아무래도 내게 엄청난 일이 일어난 것 같다</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai5.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge pay">유료 소설</span>
                  <h3>종말의 바바리안</h3>
                  <p>어느 날 갑자기 사람들이 게임 속 던전에 떨어지게 되었다.
                    주인공은 마침 평소 즐겨 하던 게임이라
                    최대한 경험을 살려 던전을 헤쳐 나가는데,
                    탈출하면 주어지는 보상으로 현금부자가 된다.
                    주인공은 비로소 자본주의의 단맛을 깨달았으나
                    그게 다가 아니었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Slider -->
      <section class="testimonial2">
        <div class="inner">
          <div class="testimonial2-content">
            <div class="topSlider">
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner3.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner3.jpg">
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 무료 -->
      <section class="ranking free">
        <div class="inner">
          <div class="ranking-content">
            <h2>무료 웹소설 베스트 5</h2>
            <div class="items">
              <div class="item">
                <div class="up-image">
                  <img src="images/ai1.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge free">무료 소설</span>
                  <h3>단종이 너무 강함</h3>
                  <p>조선 최강의 정통성을 가지고 태어났지만 '수양' 당해버린 왕 단종이 되어버렸다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai2.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge free">무료 소설</span>
                  <h3>나 혼자만 강화술사</h3>
                  <p>세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai3.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge free">무료 소설</span>
                  <h3>내 집에 영약 광산이 열렸다</h3>
                  <p>어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai4.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge free">무료 소설</span>
                  <h3>해고 후 상속 대박</h3>
                  <p>아무래도 내게 엄청난 일이 일어난 것 같다</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai5.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge free">무료 소설</span>
                  <h3>종말의 바바리안</h3>
                  <p>어느 날 갑자기 사람들이 게임 속 던전에 떨어지게 되었다.
                    주인공은 마침 평소 즐겨 하던 게임이라
                    최대한 경험을 살려 던전을 헤쳐 나가는데,
                    탈출하면 주어지는 보상으로 현금부자가 된다.
                    주인공은 비로소 자본주의의 단맛을 깨달았으나
                    그게 다가 아니었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Slider -->
      <section class="testimonial2">
        <div class="inner">
          <div class="testimonial2-content">
            <div class="topSlider">
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner3.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="images/bandi-copy-banner3.jpg">
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 공모전 -->
      <section class="ranking contest">
        <div class="inner">
          <div class="ranking-content">
            <h2>공모전 웹소설 베스트 5</h2>
            <div class="items">
              <div class="item">
                <div class="up-image">
                  <img src="images/ai1.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge contest">공모전 소설</span>
                  <h3>단종이 너무 강함</h3>
                  <p>조선 최강의 정통성을 가지고 태어났지만 '수양' 당해버린 왕 단종이 되어버렸다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai2.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge contest">공모전 소설</span>
                  <h3>나 혼자만 강화술사</h3>
                  <p>세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai3.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge contest">공모전 소설</span>
                  <h3>내 집에 영약 광산이 열렸다</h3>
                  <p>어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.어느 날 탑 100층과 내 집의 거실이 연결되었다.
                    나는 영약 광산의 주인이 되었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai4.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge contest">공모전 소설</span>
                  <h3>해고 후 상속 대박</h3>
                  <p>아무래도 내게 엄청난 일이 일어난 것 같다</p>
                  <a class="btn-explore" href="#none">바로가기
                    <img src="images/icon-arrow.png"></a>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="images/ai5.jpg" alt="">
                </div>
                <div class="down-desc">
                  <span class="badge contest">공모전 소설</span>
                  <h3>종말의 바바리안</h3>
                  <p>어느 날 갑자기 사람들이 게임 속 던전에 떨어지게 되었다.
                    주인공은 마침 평소 즐겨 하던 게임이라
                    최대한 경험을 살려 던전을 헤쳐 나가는데,
                    탈출하면 주어지는 보상으로 현금부자가 된다.
                    주인공은 비로소 자본주의의 단맛을 깨달았으나
                    그게 다가 아니었다.</p>
                    <a class="btn-explore" href="#none">바로가기
                      <img src="images/icon-arrow.png"></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="about">
        <div class="inner">
          <div class="about-content">
            <div class="desc">
              <h2>당신을 기다리는 웹 소설</h2>
              <p>
                Factors including its highly rated nightlife landed Madrid, Spain, 12th on this list of world’s best cities. It’s not just about good weather or great food and nightlife. Unlike other best-of lists, Resonance’s annual ranking also considers a city’s diversity and, yes, the number of Instagram hashtags shared online to give a comprehensive view of what it’s like to visit and live in these places.

                To figure out where you should travel to next, there are plenty of lists out there ranking the world’s best cities. Some use reader polls to determine which place lands at the top, while others base rankings on data like its livability or how easy it is to bike there.
              </p>
              <a href="#none">무료 웹 소설</a>
            </div>
            <div class="photo">
              <img src="images/bandi-about1.jpg" alt="">
            </div>
          </div>
        </div>
      </section>
      
      <section class="callaction">
        <div class="callaction-heading">
          <h2>The Most Simple & <b>Powerful Way</b><br> to <b>your trip</b></h2>
          <a href="#none">GET EARLY ACCESS</a>
        </div>
      </section>
      <section class="blog">
        <div class="inner"></div>
      </section>
      <section class="festival">
        <div class="festival-heading">
          <h3><span>SEE ALL FESTIVALS</span> for the Best Trip Place</h3>
          <div class="btns">
            <!-- 낱개로 있을 경우 부모를 div로 묶어두는게 좋음 -->
            <a href="#none">Maxico Festivals</a>
            <a href="#none">Barcelona Festivals</a>
          </div>
        </div>
      </section>
      <!-- Slider -->
      <section class="testimonial">
        <div class="inner">
          <div class="testimonial-content">
            <h2>what <b>our customers</b> are saying</h2>
            <hr>
            <div class="mySlider">
              <div>
                <p class="client">
                  <img src="images/bandi-slider1.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="images/bandi-slider2.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="images/bandi-slider3.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="images/bandi-slider3.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="images/bandi-slider2.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="images/bandi-slider1.jpg">
                  <span><b>Coding Works</b>Seoul, Korea</span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              
            </div>
          </div>
        </div>
      </section>
      <footer>
        <div class="inner">
          <div class="footer-top">
            <ul>
              <li>(주)반디</li>
              <li><a href="#none">이용약관</a></li>
              <li><a href="#none">개인정보 처리방침</a></li>
              <li><a href="#none">청소년 보호 정책</a></li>
              <li><a href="#none">회사 소개</a></li>
            </ul>
          </div>
          <div class="footer-content">
            <ul class="community">
              <!-- 제목 줄은 a없이-->
              <li>게시판</li>
              <li><a href="#none">Subscribe</a></li>
              <li><a href="#none">Give A Gift</a></li>
              <li><a href="#none">Customer Service FAQ</a></li>
              <li><a href="#none">Access Your Subscription</a></li>
            </ul>
            <ul class="network">
              <li>Network</li>
              <li><a href="#none">Privacy Policy</a></li>
              <li><a href="#none">Terms Of Service</a></li>
              <li><a href="#none">Advertise</a></li>
              <li><a href="#none">Jobs</a></li>
            </ul>
            <ul class="help">
              <li>Help Preserve This Project</li>
              <li>We may earn a commission if you purchase an item 
                featured on our site.</li>
              <li>Copyright ©  2020 CodingWorks. All rights reserved.</li>
            </ul>
          </div>
        </div>
      </footer>
    </div>

    <!-- 
        보통 1280px ~ 1560px 컨텐츠 영역으로 사용
        .inner  --- width: 1300px margin: auto (컨텐츠 영역 전부에 적용 시킬것)
     -->
  </body>
</html>


