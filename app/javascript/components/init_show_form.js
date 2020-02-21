
const toggleForm = () => {
  const button = document.querySelector('#rent-form-button');
  const form = document.querySelector('.tool-form');
  if (button) {
    button.addEventListener('click', (event) => {
    event.preventDefault();
    console.log("Hello");
    if (form) {
      form.classList.toggle('hidden');
    }
  });
  }

};

export { toggleForm }
