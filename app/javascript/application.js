// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

function initializeMySwipers() {
  document.querySelectorAll('[class*="mySwiper-"]').forEach((swiperEl) => {
    const id = Array.from(swiperEl.classList)
      .find((c) => c.startsWith("mySwiper-"))
      .split("-")[1];

    if (!swiperEl.swiper) {
      // Configurações base para todos os carrosséis
      let config = {
        slidesPerView: 1.2,
        spaceBetween: 16,
        navigation: {
          nextEl: `.swiper-button-next-${id}`,
          prevEl: `.swiper-button-prev-${id}`,
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
          },
        },
      };

      // Configurações específicas para o carrossel de destaques
      if (id === "destaques") {
        const progressCircle = document.querySelector(".autoplay-progress svg");
        const progressContent = document.querySelector(
          ".autoplay-progress span"
        );
        config = {
          slidesPerView: 3,
          spaceBetween: 0,
          loop: true,
          autoplay: {
            delay: 10000,
            disableOnInteraction: false,
          },
          effect: "fade",
          fadeEffect: {
            crossFade: true,
          },
          on: {
            autoplayTimeLeft(s, time, progress) {
              progressCircle.style.setProperty("--progress", 1 - progress);
              progressContent.textContent = `${Math.ceil(time / 1000)}s`;
            },
          },
          pagination: {
            el: `.swiper-pagination-${id}`,
            clickable: true,
            renderBullet: function (index, className) {
              return `<span class="${className} w-2 h-2 rounded-full transition-all duration-300"></span>`;
            },
          },
        };
      }

      if (id === "about") {
        config = {
          slidesPerView: 1,
          centeredSlides: true,
          spaceBetween: 30,
          loop: true,
          keyboard: {
            enabled: true,
          },
          grabCursor: true,
          navigation: {
            nextEl: `.swiper-button-next-${id}`,
            prevEl: `.swiper-button-prev-${id}`,
          },
          breakpoints: {
            640: {
              slidesPerView: 2,
              spaceBetween: 24,
            },
            1024: {
              slidesPerView: 3.5,
              spaceBetween: 32,
            },
          },
          on: {
            init() {
              this.slides.forEach((slide) => {
                slide.style.transition =
                  "transform 0.8s ease, opacity 0.8s ease, backdrop-filter: blur(4px);";
              });
            },
            slideChangeTransitionStart() {
              this.slides.forEach((slide) => {
                slide.style.transition =
                  "transform 0.8s ease, opacity 0.8s ease, backdrop-filter: blur(4px);";
              });
            },
            transitionStart() {
              this.slides.forEach((slide) => {
                slide.style.transition =
                  "transform 0.8s ease, opacity 0.8s ease, backdrop-filter: blur(4px);";
              });
            },
          },
        };
      }

      // Inicializa o Swiper com as configurações
      new Swiper(swiperEl, config);
    }
  });
}

function vanta(){
  VANTA.GLOBE({
    el: "#vanta-bg",
    mouseControls: true,
    touchControls: true,
    gyroControls: false,
    minHeight: 200.00,
    minWidth: 200.00,
    scale: 1.00,
    scaleMobile: 1.00,
    backgroundColor: 0x1c1c1c,
    color: 0x6a497f,
    color2: 0xffffff,
    size: 1
  })
}

document.addEventListener("turbo:load", vanta)
document.addEventListener("turbo:load", initializeMySwipers);

async function renderPDF(url, containerId) {
  const loadingTask = pdfjsLib.getDocument(url);
  const pdf = await loadingTask.promise;

  const container = document.getElementById(containerId);
  container.innerHTML = "";

  for (let i = 1; i <= pdf.numPages; i++) {
    const page = await pdf.getPage(i);

    const viewport = page.getViewport({ scale: 1.5 });
    const canvas = document.createElement("canvas");
    const context = canvas.getContext("2d");
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    container.appendChild(canvas);

    const renderContext = {
      canvasContext: context,
      viewport: viewport,
    };
    page.render(renderContext);
  }
}

// Exporta a função se quiser usar em outros scripts
window.renderPDF = renderPDF;


let deferredPrompt;
const installButton = document.getElementById('installApp');

window.addEventListener('beforeinstallprompt', (e) => {
  e.preventDefault();
  deferredPrompt = e;
  installButton.hidden = false;
});

installButton.addEventListener('click', async () => {
  if (deferredPrompt) {
    deferredPrompt.prompt();
    const { outcome } = await deferredPrompt.userChoice;
    if (outcome === 'accepted') {
      console.log('Usuário aceitou a instalação');
    } else {
      console.log('Usuário recusou a instalação');
    }
    deferredPrompt = null;
    installButton.hidden = true;
  }
});

import "trix"
import "@rails/actiontext"
