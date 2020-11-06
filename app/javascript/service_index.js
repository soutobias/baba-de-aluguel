const toogleTab1 = () => {
  const clickButton1 = document.getElementById("tab1");
  const clickButton2 = document.getElementById("tab2");

  const tab1 = document.getElementById("my_babysitters");
  const tab2 = document.getElementById("my_services");

  clickButton1.addEventListener('click', (event) => {

    event.currentTarget.classList.add('active');
    clickButton2.classList.remove('active');
    tab1.classList.remove('inactive-tab')
    tab2.classList.add('inactive-tab')
  });
};

const toogleTab2 = () => {
  const clickButton1 = document.getElementById("tab1");
  const clickButton2 = document.getElementById("tab2");

  const tab1 = document.getElementById("my_babysitters");
  const tab2 = document.getElementById("my_services");

  clickButton2.addEventListener('click', (event) => {
    event.currentTarget.classList.add('active');
    clickButton1.classList.remove('active');
    tab1.classList.add('inactive-tab')
    tab2.classList.remove('inactive-tab')
  });
};

export { toogleTab1, toogleTab2 };
