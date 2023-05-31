<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반디</title>
    <script src="/assets/js/jquery.min.js"></script>
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
    <script src="/assets/js/custom-slick.js"></script>
    <!-- 작성한 css는 항상 밑에 있어야함 -->
    <link rel="stylesheet" href="/assets/css/style.css" />
  </head>
  <body>
    <div class="container">
    	<div class="inner">
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
            <a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
          </div>
          <ul class="gnb">
            <li><a href="#none">HOME</a></li>
            <li><a href="#none">소설</a></li>
            <li><a href="#none">공모전</a></li>
            <li class="dropdown">
              <a href="#none" class="dropbtn">게시판</a>
            </li>
            <li><a href="#none">고객지원</a></li>
            <li><a href="#none">마이페이지</a></li>
          </ul>
        </nav>
      </header>
      <!-- <main class="intro">
        <div class="inner">
          <div class="heading">
            <h1>The World’s Best fiction site</h1>
            <p>
              당신의 일상을 반디~<br>
              소설과 무제한 친해지리
            </p>
          </div>
        </div>
      </main> -->
      <section class="big-testimonial">
        <div class="inner">
          <div class="big-testimonial-content">
            <div class="bigSlider">
              <div>
                <p class="big-banner">
                  <img src="/assets/images/main/topSlider.png">
                </p>
              </div>
              <div>
                <p class="big-banner">
                  <img src="/assets/images/main/topSlider2.png">
                </p>
              </div>
              <div>
                <p class="big-banner">
                  <img src="/assets/images/main/topSlider.png">
                </p>
              </div>
              <div>
                <p class="big-banner">
                  <img src="/assets/images/main/topSlider2.png">
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 유료 -->
      <section class="ranking pay">
        <div class="inner">
          <div class="ranking-content">
            <h2>유료 웹소설 베스트 5</h2>
            <div class="row">
            </div>
            <div class="items">
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai1.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>단종이 너무 강함</h3>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai2.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>나 혼자만 강화술사</h3>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai3.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>내 집에 영약 광산이 열렸다</h3>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai4.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>해고 후 상속 대박</h3>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai5.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>종말의 바바리안</h3>
                </div>
              </div>
              <div class="item">
                <div class="up-image">
                  <img src="/assets/images/main/ai5.jpg" alt="">
                </div>
                <div class="down-desc">
                  <h3>종말의 바바리안</h3>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="vertical-list">
      	<div class="list-header"><h2>웹소설 통합 랭킹</h2></div>
      	<div class="list-body">
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner3.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      	</div>
      </section>
      <!-- Slider -->
      <section class="testimonial2">
        <div class="inner">
          <div class="testimonial2-content">
            <div class="topSlider">
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner3.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner2.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner1.jpg">
                </p>
              </div>
              <div>
                <p class="top-banner">
                  <img src="/assets/images/main/bandi-copy-banner3.jpg">
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="vertical-list">
      	<div class="list-header"><h2>무료소설 인기작</h2></div>
      	<div class="list-body">
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      		<ul>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      			<li class="li-item">
      				<a href="#" class="li-link">
      					<div class="li-thumbnail">
      						<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
      					</div>
      					<div class="li-info-area">
      						<p><span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span></p>
      						<p><span class="li-desc">꾸르미르</span></p>
      						<p><span class="li-desc">조회수 810</span></p>
      					</div>
      				</a>
      			</li>
      		</ul>
      	</div>
      </section>
      
      <!-- Slider -->
      <section class="testimonial">
        <div class="inner">
          <div class="testimonial-content">
            <h2>태그 <b>추천</b> 작품</h2>
            <hr>
            <div class="mySlider">
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai1.jpg">
                  <span><b>나 혼자만 강화술사</b></span>
                </p>
                <p class="comment">
                  세상에 강화템은 많지만 오직 나만이 강화할 수 있다.
                </p>
                <p class="comment">
                  세상에 강화템은 많지만 오직 나만이 강화할 수 있다.
                </p>
                
              </div>
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai2.jpg">
                  <span><b>내 집에 영약 광산이 열렸다</b></span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai3.jpg">
                  <span><b>해고 후 상속 대박</b></span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai1.jpg">
                  <span><b>나 혼자만 강화술사</b></span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai2.jpg">
                  <span><b>내 집에 영약 광산이 열렸다</b></span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              <div>
                <p class="client">
                  <img src="/assets/images/main/ai3.jpg">
                  <span><b>해고 후 상속 대박</b></span>
                </p>
                <p class="comment">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero tempora et sit in, quaerat consequuntur.
                </p>
              </div>
              
            </div>
          </div>
        </div>
      </section>
      </div>
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

