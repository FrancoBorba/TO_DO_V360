import { Controller } from "@hotwired/stimulus"
import { put } from  "@rails/request.js"

// Connects to data-controller="checkbox"
export default class extends Controller {

  static values = {url : String}

 async update(e) { // recebe o evento change
    let checkbox = e.target
    let verificada = checkbox.checked // verifica se esta marcada
    console.log("Atualizando checkbox", verificada)
    await put(this.urlValue , { // usa a funcao put do @rails/request.js
       body: {
          concluido: verificada
        },
        responseKind: "turbo-stream"
    })
  }
}
