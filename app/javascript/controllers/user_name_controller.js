import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-name"
export default class extends Controller {
  static targets = ['name','profile']

  connect() {
    console.log("I'am connected!!!");
  }

  getUserName = () => {
    const element = this.nameTarget
    const name = element.textContent 
    alert(`You clicked on, ${name}`);
  }


  getProfile = () => {
    const element = this.profileTarget
    const profile = element.textContent 
    alert(`You clicked on profile, ${profile}`);
  }
}
