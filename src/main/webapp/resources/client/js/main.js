;(function () {

	'use strict';

	var isMobile = {
		Android: function() {
			return navigator.userAgent.match(/Android/i);
		},
			BlackBerry: function() {
			return navigator.userAgent.match(/BlackBerry/i);
		},
			iOS: function() {
			return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		},
			Opera: function() {
			return navigator.userAgent.match(/Opera Mini/i);
		},
			Windows: function() {
			return navigator.userAgent.match(/IEMobile/i);
		},
			any: function() {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}
	};

	var mobileMenuOutsideClick = function() {

		$(document).click(function (e) {
	    var container = $("#colorlib-offcanvas, .js-colorlib-nav-toggle");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {

	    	if ( $('body').hasClass('offcanvas') ) {

    			$('body').removeClass('offcanvas');
    			$('.js-colorlib-nav-toggle').removeClass('active');
				
	    	}
	    
	    	
	    }
		});

	};

	$(document).ready(function () {
        console.log(1);
        const urlParams = new URLSearchParams(window.location.search);

        const brands = urlParams.get('brand');
        if (brands) {
            brands.split(',').forEach(val => {
                $(`#CheckBrand input[value="${val}"]`).prop('checked', true);
            });
        }

        const sizes = urlParams.get('size');
        if (sizes) {
            sizes.split(',').forEach(val => {
                $(`#CheckSize input[value="${val}"]`).prop('checked', true);
            });
        }

        const colors = urlParams.get('color');
        if (colors) {
            colors.split(',').forEach(val => {
                $(`#CheckColor input[value="${val}"]`).prop('checked', true);
            });
        }

        // Check radio button theo 'sort'
        const sortValue = urlParams.get('sort');
        if (sortValue) {
            $(`#CheckSort input[name="radio-sort"][value="${sortValue}"]`).prop('checked', true);
        }
    });

    $("#filter-btn").click(function(e){
        e.preventDefault();
        var brand = [];
        var size = [];
        var color = [];
        
        $('#CheckBrand .form-check-input:checked').each(function() {
            brand.push($(this).val());
        })

        $('#CheckSize .form-check-input:checked').each(function() {
            size.push($(this).val());
        })

        $('#CheckColor .form-check-input:checked').each(function() {
            color.push($(this).val());
        })

        let sortValue = $("input[name=radio-sort]:checked").val();

        const currentUrl = new URL(window.location.href);
        const searchParam = currentUrl.searchParams;

        searchParam.set('page', '0');
        searchParam.set('sort', sortValue);

        searchParam.delete('brand');
        searchParam.delete('size');
        searchParam.delete('color');


        if (brand.length > 0) {
            searchParam.set('brand', brand.join(','));
        }

        if (size.length > 0) {
            searchParam.set('size', size.join(','));
        }
      
        if (color.length > 0) {
            searchParam.set('color', color.join(','));
        }

        window.location.href = currentUrl;
    })


	var offcanvasMenu = function() {

		$('#page').prepend('<div id="colorlib-offcanvas" />');
		$('#page').prepend('<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle colorlib-nav-white"><i></i></a>');
		var clone1 = $('.menu-1 > ul').clone();
		$('#colorlib-offcanvas').append(clone1);
		var clone2 = $('.menu-2 > ul').clone();
		$('#colorlib-offcanvas').append(clone2);

		$('#colorlib-offcanvas .has-dropdown').addClass('offcanvas-has-dropdown');
		$('#colorlib-offcanvas')
			.find('li')
			.removeClass('has-dropdown');

		// Hover dropdown menu on mobile
		$('.offcanvas-has-dropdown').mouseenter(function(){
			var $this = $(this);

			$this
				.addClass('active')
				.find('ul')
				.slideDown(500, 'easeOutExpo');				
		}).mouseleave(function(){

			var $this = $(this);
			$this
				.removeClass('active')
				.find('ul')
				.slideUp(500, 'easeOutExpo');				
		});


		$(window).resize(function(){

			if ( $('body').hasClass('offcanvas') ) {

    			$('body').removeClass('offcanvas');
    			$('.js-colorlib-nav-toggle').removeClass('active');
				
	    	}
		});
	};


	var burgerMenu = function() {

		$('body').on('click', '.js-colorlib-nav-toggle', function(event){
			var $this = $(this);


			if ( $('body').hasClass('overflow offcanvas') ) {
				$('body').removeClass('overflow offcanvas');
			} else {
				$('body').addClass('overflow offcanvas');
			}
			$this.toggleClass('active');
			event.preventDefault();

		});
	};
	

	var contentWayPoint = function() {
		var i = 0;
		$('.animate-box').waypoint( function( direction ) {

			if( direction === 'down' && !$(this.element).hasClass('animated-fast') ) {
				
				i++;

				$(this.element).addClass('item-animate');
				setTimeout(function(){

					$('body .animate-box.item-animate').each(function(k){
						var el = $(this);
						setTimeout( function () {
							var effect = el.data('animate-effect');
							if ( effect === 'fadeIn') {
								el.addClass('fadeIn animated-fast');
							} else if ( effect === 'fadeInLeft') {
								el.addClass('fadeInLeft animated-fast');
							} else if ( effect === 'fadeInRight') {
								el.addClass('fadeInRight animated-fast');
							} else {
								el.addClass('fadeInUp animated-fast');
							}

							el.removeClass('item-animate');
						},  k * 200, 'easeInOutExpo' );
					});
					
				}, 100);
				
			}

		} , { offset: '85%' } );
	};


	var dropdown = function() {

		$('.has-dropdown').mouseenter(function(){

			var $this = $(this);
			$this
				.find('.dropdown')
				.css('display', 'block')
				.addClass('animated-fast fadeInUpMenu');

		}).mouseleave(function(){
			var $this = $(this);

			$this
				.find('.dropdown')
				.css('display', 'none')
				.removeClass('animated-fast fadeInUpMenu');
		});

	};


	var goToTop = function() {

		$('.js-gotop').on('click', function(event){
			
			event.preventDefault();

			$('html, body').animate({
				scrollTop: $('html').offset().top
			}, 500, 'easeInOutExpo');
			
			return false;
		});

		$(window).scroll(function(){

			var $win = $(window);
			if ($win.scrollTop() > 200) {
				$('.js-top').addClass('active');
			} else {
				$('.js-top').removeClass('active');
			}

		});
	
	};

	// var increment = function(){

	// };


	// Loading page
	var loaderPage = function() {
		$(".colorlib-loader").fadeOut("slow");
	};


	var sliderMain = function() {
		
	  	$('#colorlib-hero .flexslider').flexslider({
			animation: "fade",
			slideshowSpeed: 5000,
			directionNav: true,
			start: function(){
				setTimeout(function(){
					$('.slider-text').removeClass('animated fadeInUp');
					$('.flex-active-slide').find('.slider-text').addClass('animated fadeInUp');
				}, 500);
			},
			before: function(){
				setTimeout(function(){
					$('.slider-text').removeClass('animated fadeInUp');
					$('.flex-active-slide').find('.slider-text').addClass('animated fadeInUp');
				}, 500);
			}

	  	});

	};

	// Owl Carousel
	var owlCrouselFeatureSlide = function() {
		var owl = $('.owl-carousel');
		owl.owlCarousel({
		   animateOut: 'fadeOut',
		   animateIn: 'fadeIn',
		   autoplay: false,
		   autoplayHoverPause: true,
		   loop:true,
		   margin:0,
		   nav:false,
		   dots: true,
		   autoHeight: false,
		   items: 1,
		   navText: [
		      "<i class='icon-chevron-left owl-direction'></i>",
		      "<i class='icon-chevron-right owl-direction'></i>"
	     	]
		});

		var owl2 = $('.owl-carousel2');
		owl2.owlCarousel({
			animateOut: 'fadeOut',
		   animateIn: 'fadeIn',
		   autoplay: true,
		   autoplayHoverPause: true,
		   loop:true,
		   margin:0,
		   nav:false,
		   dots: false,
		   autoHeight: true,
		   items: 1,
		   navText: [
		      "<i class='icon-chevron-left owl-direction'></i>",
		      "<i class='icon-chevron-right owl-direction'></i>"
	     	]
		});
	};

	var parallax = function() {

		if ( !isMobile.any() ) {
			$(window).stellar({
				horizontalScrolling: false,
				hideDistantElements: false, 
				responsive: true

			});
		}
	};

	var datePicker = function() {
		// jQuery('#time').timepicker();
		jQuery('.date').datepicker({
		  'format': 'm/d/yyyy',
		  'autoclose': true
		});
	};



	
	$(function(){
		mobileMenuOutsideClick();
		offcanvasMenu();
		burgerMenu();
		contentWayPoint();
		sliderMain();
		dropdown();
		goToTop();
		loaderPage();
		owlCrouselFeatureSlide();
		parallax();
		datePicker();
	});


}());