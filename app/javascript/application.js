// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



function initializeMySwiper() {
  // Encontre o container do Swiper na página atual
  const swiperElement = document.querySelector('.mySwiper');

  if (swiperElement) {
    if (!swiperElement.swiper) { 
      const swiper = new Swiper('.mySwiper', {
        slidesPerView: 1.2, // permite ver parte do próximo slide no mobile
        spaceBetween: 16,
        breakpoints: {
          640: {
            slidesPerView: 2,
            spaceBetween: 24,
          },
          1024: {
            slidesPerView: 3.5,
            spaceBetween: 32,
          }
        }
      });      
    } 
  } 
}

document.addEventListener('turbo:load', initializeMySwiper);
