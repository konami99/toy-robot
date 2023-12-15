import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
  }

  run(e) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    const array = document.getElementById('command').value.split(' ')
    
    const command = array[0]
    console.log(array[1])
    const params = array[1].split(',')
    const x = params[0]
    const y = params[1]
    const direction = params[2]


    fetch(`/tables/place`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ x: x, y: y, direction: direction }) 
    })
    .then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }
}