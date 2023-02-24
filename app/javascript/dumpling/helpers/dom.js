export function html(htmlStrings, ...parts) {
  const htmlString = htmlStrings.reduce((acc, cur, i) => `${acc}${cur}${parts[i] || ''}`, '');
  const template = document.createElement('template');
  template.innerHTML = htmlString;
  return template.content;
}
