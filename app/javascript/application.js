// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



function initializeMySwipers() {
  document.querySelectorAll('[class*="mySwiper-"]').forEach(swiperEl => {
    // Extrai o ID do nome da classe
    const id = Array.from(swiperEl.classList)
      .find(c => c.startsWith('mySwiper-'))
      .split('-')[1];
    
    if (!swiperEl.swiper) {
      new Swiper(swiperEl, {
        slidesPerView: 1.2,
        spaceBetween: 16,
        navigation: {
          nextEl: `.swiper-button-next-${id}`,
          prevEl: `.swiper-button-prev-${id}`
        },
        pagination: {
          el: `.swiper-pagination-${id}`,
          clickable: true,
        },
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
  });
}

document.addEventListener('turbo:load', initializeMySwipers);
