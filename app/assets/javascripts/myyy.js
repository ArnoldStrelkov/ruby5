
$(document).ready(function() {

  
$('.post_in').each(function() {
    
   
  if (+($(this).css('height').replace('px', '')) > 280) {
    return $(this).parents('.post').find('.post_full').css('display', 'block');
  }
});  

$('body').on('click', '.post_full', function(e) {
  e.preventDefault();
  if ($(this).hasClass('full')) {
    //$(this).parents('.post_in').removeClass('full');
    $(this).parents('.post').find('.post_in').removeClass('full')
    $(this).removeClass('full');
    return $(this).text('развернуть');
  } else {
    //$(this).parents('.post_in').addClass('full');
     $(this).parents('.post').find('.post_in').addClass('full')
    $(this).addClass('full');
    return $(this).text('свернуть');
  }
});

 
var youtube;
youtube = function() {   
    
    
 $(".youtube").each(function() {
        
        
        // определение миниатюры
        $(this).css('background-image', 'url(http://i.ytimg.com/vi/' + this.id + '/sddefault.jpg)');

        // значок Play поверх миниатюры
        // $(this).append($('<div/>', {'class': 'play'}));

        $(document).delegate('#'+this.id, 'click', function() {
            // iframe со включенной опцией autoplay
            var iframe_url = "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&rel=0";
           // if ($(this).data('params')) iframe_url+='&'+$(this).data('params');

            // Высота и ширина iframe
            var iframe = $('<iframe/>', {'frameborder': '0', 'src': iframe_url });

            // Замена миниатюры плеером
            $(this).replaceWith(iframe);
        });
    });
    
    

 }; //конец youtube
    
    
youtube ();


    

    


var count = 1;
var hold = true;

$(window).scroll(function(){
    
    //alert(document.location.href);
	
    if  ($(window).scrollTop() >= $(document).height() - $(window).height() - 300){
                       //alert(count);
                       
                if   (hold){    
                        
                        hold = false;
                        count++;
                        
     // $.ajax({
    //  url:'/api/count/' + count,
    //url: $(this).attr('action'),
    //  type: 'POST',
    //  data:  { "user" : "username"} ,
    //  async: true,
    //  success: function(response) {
     //    alert(response);
       
    //    $('.posts').append(response);  
     //    hold = true;
        //$('.name').html (response.name);
        // $('.posts').html (response.posts);
         
    //  },
    // cache: false,
    //  contentType: false,
    //  processData: false
 // });
        var url = document.location.href
        if (url == "https://ruby-arnoldstrelkov-1.c9.io/") {
        url ='/user'
        };
        
        $.post( url, {  page: count })
  .done(function( response ) {
    
    //alert(response);
       
        $('.posts').append(response);
        youtube ();
         hold = true;
    
  });
        
        
        
        
                }
        
        
    }
    
}); 
            
});           
            
            
            

$(document).on('click', '.email_enter', function(e) {

 e.preventDefault();
  var formData;
    formData = new FormData($('#email_enter')[0]);
 
 
  return   $.ajax({
      url:"/enter",
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
        
       $('#email_enter').html (response);  
 
      },
     cache: false,
      contentType: false,
      processData: false
  });
 
 
 
 //$.post( "/enter", formData)
 // .done(function( data ) {
 //   alert( "email_enter " + data );
//  });

 




 });
 
 
 
$(document).on('click', '._a_ajax', function(e) {
e.preventDefault();

var url;
url = $(this).attr('href');

    return   $.ajax({
      url:url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: '',
      async: true,
      success: function(response) {
        // alert(response);
        $('.name').html (response.name);
         $('.posts').html (response.posts);
         
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
 
 $(document).on('click', '._exit', function(e) {
e.preventDefault();
var url;
url = $(this).attr('href');
    return   $.ajax({
      url:'/signin',
    //url: $(this).attr('action'),
      type: 'GET',
      data: '',
      async: true,
      success: function(response) {
        // alert(response);
       
         $('.posts').fadeOut(400);
         $('.sign').html (response);
         
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
 
 
 

  
      



var ajaxpost;
  ajaxpost = function(_this) {
   
  
    var formData;
    formData = new FormData($('.ajax_form')[0]);
    
    
    console.log (formData);
    console.log ($(".www").val());
    return   $.ajax({
      url:"/addpost",
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
         $('.posts').prepend(response);
         $('.ajax_form')[0].reset();
         $('.on_off').fadeOut(400);
         $('.add_menu_on').removeClass('active');
         $('.add_menu_on').find('a').text('добавить пост');
         $(_this).find('.image_preview').attr("src", '');
         $(_this).find('.add_foto_menu').css("display","block");
         
         ////
        $(".youtube").each(function() {
       
        // определение миниатюры
        $(this).css('background-image', 'url(http://i.ytimg.com/vi/' + this.id + '/sddefault.jpg)');

        // значок Play поверх миниатюры
        // $(this).append($('<div/>', {'class': 'play'}));

        $(document).delegate('#'+this.id, 'click', function() {
            // iframe со включенной опцией autoplay
            var iframe_url = "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&rel=0";
           // if ($(this).data('params')) iframe_url+='&'+$(this).data('params');

            // Высота и ширина iframe
            var iframe = $('<iframe/>', {'frameborder': '0', 'src': iframe_url })

            // Замена миниатюры плеером
            $(this).replaceWith(iframe);
        });
    });
     /////
         
         
         
         
         
         
        //  $('.main').prepend(data);
	  // $(_this).html(data);
	  //$('.my_post').html($.parseHTML(data.data));
      },
     cache: false,
      contentType: false,
      processData: false
  });
  };
  
$(document).on('submit', '.post-form', function(e) {
  var _this;
    e.preventDefault();
    
    
    _this = this;
     
    ajaxpost (_this);
    });
    
    
$(document).on('click', '._sign_in', function(e) {
e.preventDefault();
  var formData;
    formData = new FormData($('#sign_in_form')[0]);
    //formData = new FormData($(_this)[0]['firstElementChild']);
    
    //var formElement = document.querySelector("#new_base1");
    //formData = new FormData(formElement);
    //formData.append("username", $(".www").val());
    
    console.log (formData);
   // console.log ($(".www").val());
    return   $.ajax({
      url:"/sessions",
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
        
           if  (response.result == 'true'){
 
         $('.sign').html (response.div);
        }
        else{
            
         //   alert ('убираем')
         $('.sign').html ('');   
         $('.posts').fadeIn(400);
         $('.button_ee').html ('<a class="menu" rel="nofollow" data-method="delete" href="/signout">Выход</a>');  
         
        }
        // $('.post-cont').prepend(response);
       //  $('.new_base')[0].reset();
        // $('.new_base').fadeOut(400);
        
        //  $('.main').prepend(data);
	  // $(_this).html(data);
	  //$('.my_post').html($.parseHTML(data.data));
      },
     cache: false,
      contentType: false,
      processData: false
  });
  
  
  
  
  
  });
  
  
  $(document).on('click', '.add_menu_on', function(e) {
  e.preventDefault();
  if ($(this).hasClass('active')) {
    $('.on_off').fadeOut(400);
    $(this).removeClass('active');
    return $(this).find('a').text('добавить пост');
  } else {
    $('.on_off').fadeIn(400);
    $(this).addClass('active');
    return $(this).find('a').text('скрыть форму');
  }
});



$(document).on('click', '.del_post', function(e) {
  var _this;
  e.preventDefault();
  _this = $(this);
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'GET',
      data: '',
      async: true,
      success: function(response) {
 

    return _this.parents('.post').remove();
        
        
        
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
 
 $(document).on('click', '.get_edit', function(e) {
  var _this;
  e.preventDefault();
  _this = $(this);
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'GET',
      data: '',
      async: true,
      success: function(response) {
 

     _this.parents('.post').html(response);
       
        
        
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
$(document).on('submit', '.update', function(e) {
  var _this;
  e.preventDefault();
  _this = $(this);
var url;
url = $(this).attr("action");

 var formData;
    formData = new FormData(_this[0]);
//alert(formData);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
 
//alert(response);
     _this.parents('.post').html(response);
        
        
      },
     cache: false,
      contentType: false,
      processData: false
  });

 });
 
 
 $(document).on('click', '.saved', function(e) {
  var _this;
  e.preventDefault();
  _this = $(this);
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'GET',
      data: '',
      async: true,
      success: function(response) {
 
if (_this.hasClass('active')) {
    
    _this.removeClass('active');
    _this.html('сохранить');
    
  } else {
    
    _this.addClass('active');
    _this.html('сохранено');
    
  }
    
       
        
        
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
 
 $(document).on('click', '.feed', function(e) {
  var _this;
  e.preventDefault();
  _this = $(this);
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'GET',
      data: '',
      async: true,
      success: function(response) {
 
if (_this.hasClass('active')) {
    
    _this.removeClass('active');
    _this.html('читать');
    
  } else {
    
    _this.addClass('active');
    _this.html('читаю');
    
  }
    
       
        
        
      },
     cache: false,
      contentType: false,
      processData: false
  });


 });
 
 $(document).on('click', '.js_avatar', function(e) {
e.preventDefault();



return $(".button_picture").click();
 });
 
 
 $(document).on('change', '.button_picture', function(e) {
e.preventDefault();


  var formData;
    formData = new FormData($('.form_picture')[0]);
    //formData = new FormData($(_this)[0]['firstElementChild']);
    
    //var formElement = document.querySelector("#new_base1");
    //formData = new FormData(formElement);
    //formData.append("username", $(".www").val());
    
    console.log (formData);
   // console.log ($(".www").val());
    return   $.ajax({
      url:"/api/picture",
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response){
           $(".avatar").attr("src", response);
      },
     cache: false,
      contentType: false,
      processData: false
  });
  
 });
 
 
 
 $(document).on('click', '.js_add_post_picture', function(e) {
e.preventDefault();

$(this).parent().find(".post_picture_input").click();

//$(".post_picture_input").click();

 });
 
 
 
  $(document).on('click', '.js_test', function() {

$(this).parent().find(".post_picture_input").click();

//$(".post_picture_input").click();

 });
 
 
 
 
$(document).on('change', '.post_picture_input', function() {
     
     
     
     
    var input = $(this)[0];
    if ( input.files && input.files[0] ) {
        if ( input.files[0].type.match('image.*') ) {
            var reader = new FileReader();
            reader.onload = function(e) {
                
                
                $('.add_foto_menu').css("display","none");
                
                $('.image_preview').attr('src', e.target.result);
                
            }
            reader.readAsDataURL(input.files[0]);
        } else console.log('is not image mime type');
    } else console.log('not isset files data or files API not supordet');
});


$('body').on('click', '.post_full', function(e) {
  e.preventDefault();
  if ($(this).hasClass('full')) {
    $(this).parents('.post_in').removeClass('full');
    $(this).removeClass('full');
    return $(this).text('развернуть');
  } else {
    $(this).parents('.post_in').addClass('full');
    $(this).addClass('full');
    return $(this).text('свернуть');
  }
});

