const fs = require('fs'),
      path = require('path');

const PACKS_PATH = './app/javascripts/packs';

const packs = fs.readdirSync(PACKS_PATH);

module.exports = {
  entry: packs.reduce(function(o, name) {
    o[name.split('.')[0]] = PACKS_PATH + '/' + name;
    return o;
  }, {}),
  output: {
    path: path.join(__dirname, "app/assets/javascripts/board/packs"),
    filename: '[name].pack.js'
  },
  resolve: {
    // Add `.ts` and `.tsx` as a resolvable extension.
    extensions: ['.ts', '.tsx', '.js'] // note if using webpack 1 you'd also need a '' in the array as well
  },
  module: {
    loaders: [ // loaders will work with webpack 1 or 2; but will be renamed "rules" in future
      // all files with a `.ts` or `.tsx` extension will be handled by `ts-loader`
      { test: /\.tsx?$/, loader: 'ts-loader' }
    ]
  }
}