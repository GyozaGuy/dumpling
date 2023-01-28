export function setScreenSize() {
  const currentWidth = window.innerWidth;
  let screenSize;

  if (currentWidth <= 480) {
    screenSize = 'xs';
  } else if (currentWidth <= 768) {
    screenSize = 'sm';
  } else if (currentWidth <= 1024) {
    screenSize = 'md';
  } else if (currentWidth <= 1200) {
    screenSize = 'lg';
  } else {
    screenSize = 'xl';
  }

  document.documentElement.dataset.screenSize = screenSize;
}
