
/*
 * 프로필 쿠키 다이어로그 생성 메소드
 */
function btn_profile() {
		var target = $('.Header-Btn-Profile');
		$('.Dialog-Cookie').dialog({
			modal: true,
			closeOnEscape: false,
		    resizeable : false,
			open: function(event, ui) {
	            $(".ui-widget-header").remove();
	            $('#ui-id-1').css('z-index',1000);
	            $('.ui-widget-overlay').css('z-index',900);
	            //	프로필 다이어로그 버튼 클릭 이벤트
	            $('.Dialog-Cookie-Btn1').click( function() {
	            	$('.Dialog-Cookie-Btn1').css('color','#ff6f00');
	            	$('.Dialog-Cookie-Btn1').css('border-bottom','solid 3px #ff6f00');
	            	$('.Dialog-Cookie-Btn2').css('color','gray');
	            	$('.Dialog-Cookie-Btn2').css('border-bottom','none');
				});
	            $('.Dialog-Cookie-Btn2').click( function() {
	            	$('.Dialog-Cookie-Btn2').css('color','#ff6f00');
	            	$('.Dialog-Cookie-Btn2').css('border-bottom','solid 3px #ff6f00');
	            	$('.Dialog-Cookie-Btn1').css('color','gray');
	            	$('.Dialog-Cookie-Btn1').css('border-bottom','none');
				});
	            // 스크롤 막기
	            $('body').css('overflow','hidden');
	            
	            // 오버레이 클릭 이벤트
	            $('.ui-widget-overlay').click( function() {
	            	$('.ui-dialog-content').dialog('close');
	            	$('.Dialog-Cookie-Btn1').css('color','gray');
	            	$('.Dialog-Cookie-Btn1').css('border-bottom','none');
	            	$('.Dialog-Cookie-Btn2').css('color','gray');
	            	$('.Dialog-Cookie-Btn2').css('border-bottom','none');
	            	// 스크롤 풀기
	            	$('body').css('overflow','');
				});
	         	// 모달 오버레이 설정
				$(".ui-widget-overlay").css({
					width: '100%',
					height: '100%',
					opacity: '0.5',
					filter: "Alpha(Opacity=50)",
					backgroundColor: "black"
				});
	            
			}
		});	
	}
/*
 * 회원 로그인 다이어로그 생성 메소드
 */
	function btn_login() {
		$('.Dialog-Login').dialog({
			modal: true,
			closeOnEscape: false,
		    resizeable : false,
			width: '320',
		    height: '500',
			open: function(event, ui) {
	            $(".ui-widget-header").remove();
	            $('#ui-id-3').css('z-index',1200);
	            $('.ui-widget-overlay').css('z-index',1100);
	            //	닫기 버튼 클릭 
	            $('.Dialog-Btn-Close').click( function() {
	            	$('#ui-id-3').dialog('close');
	            	$('.ui-widget-overlay').css('z-index',900);
	            	// 스크롤 막기
		            $('body').css('overflow','hidden');
				});
	            $('.ui-widget-overlay').click( function() {
	            	$('#ui-id-3').dialog('close');
	            	$('.ui-widget-overlay').css('z-index',900);
				});
	            
			}
		});	
	}
/*
* 사용할 앱의 JavaScript 키를 설정해 주세요.
*/	
	Kakao.init('94c7fb4ece74d1d680cd96d9f6eb82a2');
	
/*
* 카카오 로그아웃 기능
*/
	function kakaoLogout() {
		 if (!Kakao.Auth.getAccessToken()) {
		    alert('Not logged in.')
		    return
		 }
		 Kakao.Auth.logout(function() {
		  	alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
		    $('#kakaoId2').val(null);
	         $('#kakaoName2').val(null);
			 $('#kakaoImage2').val(null);
		 })
	}
/*
* 카카오 간편 로그인
*/
	function kakaoLogin() {
	  Kakao.Auth.login({
	    success: function(authObj) {
	    	Kakao.API.request({
	    		 url: '/v2/user/me',
	    	      success: function(res) {
	    	    	  //alert(JSON.stringify(res));
						$('#kakaoId').val(res.id);
		    	         $('#kakaoName').val(res.properties.nickname);
						 $('#kakaoImage').val(res.properties.thumbnail_image);
						 var id = $('#kakaoId').val;
	    	         if(id != null) {
					 	$( ".KakaoLoginForm-Hidden").submit();
	    	         }
	    	      },
	    	      fail: function(error) {
	    	        alert('login success, but failed to request user information: ' +
	    	               JSON.stringify(error)
	    	        )
	    	      },
	    	})
	    },
	    fail: function(err) {
	      	alert(JSON.stringify(err))
	    },
	  })
	}
	
/*	
	// 카카오 새 로그인 창을 띄웁니다.
	function kakaoLoginForm() {
	  Kakao.Auth.loginForm({
	    success: function(authObj) {
	    	Kakao.API.request({
	    		 url: '/v2/user/me',
	    	      success: function(res) {
	    	    	  	//alert(JSON.stringify(res));
						$('#kakaoId').val(res.id);
		    	         $('#kakaoName').val(res.properties.nickname);
						 $('#kakaoImage').val(res.properties.thumbnail_image);
						 var id = $('#kakaoId').val;
	    	         if(id != null) {
					 	$( ".KakaoLoginForm-Hidden").submit();
					 	$('.ui-widget-overlay').css('z-index',1300);
					 	//alert("망고 로그인됨 / 카카오api 로그인됨");
					 	kakaoLogout();
	    	         }
	    	      },
	    	      fail: function(error) {
	    	        alert('login success, but failed to request user information: ' +
	    	               JSON.stringify(error)
	    	        )
	    	      },
	    	})
	    },
	    fail: function(err) {
	      	alert(JSON.stringify(err))
	    },
	  })
	}
*/