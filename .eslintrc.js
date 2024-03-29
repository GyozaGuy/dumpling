module.exports = {
  env: {
    browser: true,
    es6: true,
    node: true
  },
  extends: ['eslint:recommended'],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  rules: {
    indent: ['error', 2, { ignoredNodes: ['TemplateLiteral *'], SwitchCase: 1 }],
    'linebreak-style': ['error', 'unix'],
    'max-len': ['warn', { code: 100 }],
    'no-unused-vars': 'warn',
    'object-curly-spacing': ['error', 'always'],
    quotes: ['error', 'single'],
    semi: ['error', 'always']
  }
};
