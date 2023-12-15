import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async run(e) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    const commands = document.getElementById('command').value
    const commandsArray = commands.split('\n')

    for (const command of commandsArray) {
      const commandArray = command.split(' ');
      const header = commandArray[0] //PLACE, MOVE, etc

      if (header === 'PLACE') {
        const command = header
        const params = commandArray[1].split(',')
        const x = params[0]
        const y = params[1]
        const direction = params[2]

        await this.sleep(2000)
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
      } else if (header === 'MOVE') {
        await this.sleep(10000)
        fetch(`/tables/move`, {
          method: 'POST',
          mode: 'cors',
          cache: 'no-cache',
          credentials: 'same-origin',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken,
          }
        })
        .then (response => response.text())
        .then(html => Turbo.renderStreamMessage(html));
      }
    }
    
    
  }
}