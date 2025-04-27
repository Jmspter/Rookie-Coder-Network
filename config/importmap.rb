# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "pdfjs-dist", to: "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/5.1.91/pdf.min.js"
pin "pdfjs", to: "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/5.1.91/pdf.min.js"

