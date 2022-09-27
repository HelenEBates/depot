// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// From the book - make the I18n obect available
// window.I18n = require("../../../public/javascripts/i18n")

// translations are stored in the public directory, which has not been generated for us
// require("../../../public/javascripts/translations")

// From installation instructions at https://github.com/fnando/i18n
import { I18n } from "i18n-js";
// import translations from "../../../public/packs/translations.json";
import translations from "./translations.json"; // seems to be the right place to generate files to
// import translations from  "../../frontend/locales/translations.json"

// First, you need to instantiate I18n with the translations' object, the main class of this library.
const i18n = new I18n(translations);

// gives it access to the Window object
window.I18n = i18n

// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
