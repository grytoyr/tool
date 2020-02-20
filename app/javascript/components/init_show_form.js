
const toggleForm = () => {
  const button = document.querySelector('#rent-form-button');
  const form = document.querySelector('.tool-form')

  button.addEventListener('click', (event) => {
    event.preventDefault();
    console.log("Hello");
    form.classList.toggle('hidden');
  });
};

export { toggleForm }
