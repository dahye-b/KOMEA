(function ($) {
		'use strict';

		var browserWindow = $(window);

		// :: 1.0 Preloader Active Code
		/*
		browserWindow.on('load', function () {
				$('.preloader').fadeOut('slow', function () {
						$(this).remove();
				});
		});
		*/

		// :: 2.0 Nav Active Code
		if ($.fn.classyNav) {
				$('#palatinNav').classyNav();
		}


		// :: 3.0 Nice-select Active Code
		/*
		if ($.fn.niceSelect) {
				$('select').niceSelect();
		}
		*/

		// :: 4.0 Sliders Active Code
		if ($.fn.owlCarousel) {
				var welcomeSlide = $('.hero-slides');
				var bannerSlide = $('.banner-slides');

				welcomeSlide.owlCarousel({
						items: 1,
						margin: 0,
						loop: true,
						nav: false,
						dots: true,
						autoplay: true,
						autoplayTimeout: 7000,
						smartSpeed: 1000,
						animateIn: 'fadeIn',
						animateOut: 'fadeOut'
				});

				welcomeSlide.on('translate.owl.carousel', function () {
						var slideLayer = $("[data-animation]");
						slideLayer.each(function () {
								var anim_name = $(this).data('animation');
								$(this).removeClass('animated ' + anim_name).css('opacity', '0');
						});
				});

				welcomeSlide.on('translated.owl.carousel', function () {
						var slideLayer = welcomeSlide.find('.owl-item.active').find("[data-animation]");
						slideLayer.each(function () {
								var anim_name = $(this).data('animation');
								$(this).addClass('animated ' + anim_name).css('opacity', '1');
						});
				});

				$("[data-delay]").each(function () {
						var anim_del = $(this).data('delay');
						$(this).css('animation-delay', anim_del);
				});

				$("[data-duration]").each(function () {
						var anim_dur = $(this).data('duration');
						$(this).css('animation-duration', anim_dur);
				});

				var dot = $('.hero-slides .owl-dot');
				dot.each(function () {
						var index = $(this).index() + 1;
						if (index < 10) {
								$(this).html('0').append(index);
						} else {
								$(this).html(index);
						}
				});
				bannerSlide.owlCarousel({
					center: false,
					items: 5,
					loop:true,
					margin:0,
					autoWidth:true,
					nav:true,
					navText: ["<img src='/img/rolling-img/bn_prev.png'>","<img src='/img/rolling-img/bn_next.png'>"],
					dots:true,
					autoplay: true,
					autoplayTimeout:2000,
					smartSpeed:600,
					responsive:{
						0:{ items:1 },
						300:{ items:1 },
						600:{items:1},
						1000:{items:50}
					}
				});

		}

		// :: 5.0 ScrollUp Active Code
		if ($.fn.scrollUp) {
				browserWindow.scrollUp({
						scrollSpeed: 1500,
						scrollText: '<i class="fa fa-angle-up"></i>'
				});
		}

		// :: 6.0 CounterUp Active Code
		if ($.fn.counterUp) {
				$('.counter').counterUp({
						delay: 10,
						time: 2000
				});
		}

		// :: 7.0 Sticky Active Code
		if ($.fn.sticky) {
				$(".palatin-main-menu").sticky({
						topSpacing: 0
				});
		}

		// :: 8.0 Progress Bar Active Code
		if ($.fn.circleProgress) {
				$('#circle').circleProgress({
						size: 194,
						emptyFill: "rgba(0, 0, 0, .0)",
						fill: '#92593d',
						thickness: '4',
						reverse: true
				});
				$('#circle2').circleProgress({
						size: 194,
						emptyFill: "rgba(0, 0, 0, .0)",
						fill: '#92593d',
						thickness: '4',
						reverse: true
				});
				$('#circle3').circleProgress({
						size: 194,
						emptyFill: "rgba(0, 0, 0, .0)",
						fill: '#92593d',
						thickness: '4',
						reverse: true
				});
				$('#circle4').circleProgress({
						size: 194,
						emptyFill: "rgba(0, 0, 0, .0)",
						fill: '#92593d',
						thickness: '4',
						reverse: true
				});
		}

		// :: 9.0 Tooltip Active Code
		if ($.fn.tooltip) {
				$('[data-toggle="tooltip"]').tooltip()
		}

		// :: 10.0 niceScroll Active Code
		if ($.fn.niceScroll) {
				$(".album-all-songs").niceScroll({
						background: "#fff"
				});
		}

		// :: 11.0 prevent default a click
		$('a[href="#"]').on('click', function ($) {
				$.preventDefault();
		});

		// :: 12.0 wow Active Code
		if (browserWindow.width() > 767) {
				new WOW().init();
		}


		$(".datepicker").datepicker();

		$(".btn-comm-modal").click(function() {
console.log( $(this).attr("data-url") + " / " + $(this).attr("data-title") );
				var mdUrl = $(this).attr("data-url");
				var mdTitle = $(this).attr("data-title");
console.log( $(this).attr("data-url") + " / " + $(this).attr("data-title") );
				$.ajax({
					url: mdUrl,
					data: {
						para1:$(this).attr("data-para1")
					},
					type: 'POST',
					success: function(data) {
console.log( data );						
					  	$("#Cmm-Modal .modal-title").html(mdTitle);
						$("#Cmm-Modal .modal-body").html(data);
						$("#Cmm-Modal").modal('show');
					},
					error: function(error) {
					  	$("#Cmm-Modal").modal('hide');
					  	console.log(error);
					}
				})
		});


		// 하단 패밀리 사이트 레이어 처리.
		$(".f_select_ul").hide();
		$(".f_selectbx").mouseleave(function(){
				console.log("2222");

				// $(".f_select_ul").css({"display":"none" });
			    $(".f_select_ul").fadeOut(500);
		});

		$('.f_selectbx').click(function() {
				console.log("1111");

			   if ( $(".f_select_ul").css("display")=="none" ) {
				   $('.f_select_ul').css({"display":"block" });
				   return false;
			   } else {
				   $('.f_select_ul').css({"display":"none" });
			   }
		});

})(jQuery);

$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
});
