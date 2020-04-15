import { Controller } from "stimulus";
import Pickr from "@simonwep/pickr";
import "../stylesheets/color_picker.css";

export default class extends Controller {
  static targets = ["picker", "input"]

  initialize() {
    this.initPicker();
  }

  initPicker() {
    this.picker = Pickr.create({
      el: this.pickerTarget,
      theme: 'classic',
      default: this.inputTarget.value,

      components: {
        preview: true,
        opacity: true,
        hue: true,

        interaction: {
          hex: true,
          rgba: true,
          hsla: false,
          hsva: false,
          cmyk: false,
          input: true,
          clear: false,
          save: true,
        },
      },
    });

    this.picker.on('save', (color, _instance) => {
      this.inputTarget.value = color.toHEXA().toString();

      this.picker.hide();
    });
  }
}
