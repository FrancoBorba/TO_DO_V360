import { Controller } from "@hotwired/stimulus"
import { put } from  "@rails/request.js"

// Connects to data-controller="checkbox"
export default class extends Controller {

  static values = {url : String}

 async update(e) {
    let checkbox = e.target
    let verificada = checkbox.checked
    console.log("Atualizando checkbox", verificada)
    await put(this.urlValue , {
        body: {
          concluido: verificada
        }


    })
  }
}
