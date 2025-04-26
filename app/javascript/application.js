// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function initializeMySwipers() {
  document.querySelectorAll('[class*="mySwiper-"]').forEach(swiperEl => {
    const id = Array.from(swiperEl.classList)
      .find(c => c.startsWith('mySwiper-'))
      .split('-')[1];
    
    if (!swiperEl.swiper) {
      // Configurações base para todos os carrosséis
      let config = {
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
      };

      // Configurações específicas para o carrossel de destaques
      if (id === 'destaques') {
        const progressCircle = document.querySelector(".autoplay-progress svg");
        const progressContent = document.querySelector(".autoplay-progress span");
        config = {
          slidesPerView: 1,
          spaceBetween: 0,
          loop: true,
          autoplay: {
            delay: 10000,
            disableOnInteraction: false,
          },
          effect: 'fade',
          fadeEffect: {
            crossFade: true
          },
          on: {
            autoplayTimeLeft(s, time, progress) {
              progressCircle.style.setProperty("--progress", 1 - progress);
              progressContent.textContent = `${Math.ceil(time / 1000)}s`;
            }
          },
          pagination: {
            el: `.swiper-pagination-${id}`,
            clickable: true,
            renderBullet: function (index, className) {
              return `<span class="${className} w-2 h-2 rounded-full transition-all duration-300"></span>`;
            },
          }
        };
      }

      // Inicializa o Swiper com as configurações
      new Swiper(swiperEl, config);
    }
  });
}

document.addEventListener('turbo:load', initializeMySwipers);
