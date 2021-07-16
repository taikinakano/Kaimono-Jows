// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require moment
//= require fullcalendar
//= require bootstrap-sprockets

const sentence = document.querySelector('.sentence') //ヘッダーのボタン
const h1 = document.querySelector('h1')
const h2 = document.querySelector('h2')

let wordsToArray = (str) => str.split('').map(e => e === ' ' ? '&nbsp;' : e)

function insertSpan(elem, letters, startTime) {
  elem.textContent = ''
  let curr = 0
  let delay = 20
  for(let letter of letters) {
    let span = document.createElement('span')
    span.innerHTML = letter
    span.style.animationDelay = (++curr / delay + (startTime || 0)) + 's'
    elem.appendChild(span)
  }
}

