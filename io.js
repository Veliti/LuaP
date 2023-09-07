const input_text = document.querySelector("#input-text")
const read_button = document.querySelector("#io-read")

read_button.addEventListener("change", function() {
  var file_reader = new FileReader();
  file_reader.onload = function() {
    input_text.textContent = file_reader.result;
  }
  file_reader.readAsText(this.files[0])
})
