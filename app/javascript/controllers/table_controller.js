import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async reset(e) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;

    fetch(`/tables/reset`, {
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

  async run(e) {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    const commands = document.getElementById('command').value
    const commandsArray = commands.split('\n')

    const output = document.getElementById('output');
    if (output) {
      output.remove();
    }

    const run = document.getElementById('run');
    if (run) {
      run.textContent = 'RUNNING....';
    }

    const fetchOptions = {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
    }

    for (const command of commandsArray) {
      const commandArray = command.split(' ');
      const header = commandArray[0] //PLACE, MOVE, etc
      const clonedFetchOptions = { ...fetchOptions };
      var route;

      await this.sleep(2000)

      if (header === 'PLACE') {
        const command = header
        const params = commandArray[1].split(',')
        const x = params[0]
        const y = params[1]
        const direction = params[2]
        clonedFetchOptions.body = JSON.stringify({ x: x, y: y, direction: direction });

        route = '/tables/place'
      } else if (header === 'MOVE') {
        route = '/tables/move'
      } else if (header === 'LEFT') {
        route = '/tables/turn_left'
      } else if (header === 'RIGHT') {
        route = '/tables/turn_right'
      } else if (header === 'REPORT') {
        route = '/tables/report'
      }

      fetch(route, clonedFetchOptions)
        .then (response => response.text())
        .then(html => Turbo.renderStreamMessage(html));
    }
    
    if (run) {
      run.textContent = 'RUN';
    }
  }
}