var webpack = require('webpack');
var path = require('path');
var fs = require('fs-extra');
var crypto = require('crypto');
var package_data = require('./package.json');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
var buildDir = path.resolve('./build');

// Create the hash
var hash = crypto.createHash('md5');
hash.update(fs.readFileSync('./package.json'));
var digest = hash.digest('hex');
fs.writeFileSync(path.resolve(buildDir, 'hash.md5'), digest);

module.exports = {
  entry:  './build/out/browser/index.js',
  target: 'electron-renderer',
  output: {
    path: buildDir,
    filename: 'browser.bundle.js',
  },
  externals: [
    function(context, request, callback) {
      if (/^@jupyterlab/g.test(request)){
        return callback();
      } else if (/^\.\/jupyterlab_app\/src\/browser/g.test(request)){
        return callback();
      } else if (/^\jupyterlab_app\/src\/browser/g.test(request)){
        return callback();
      }

      callback(null, 'commonjs ' + request);
    }
  ],
  module: {
    rules: [
      { test: /\.css$/, 
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              // you can specify a publicPath here
              // by default it use publicPath in webpackOptions.output
              //publicPath: '../'
            }
          },
          "css-loader"
        ]
      },
      { test: /\.html$/, use: 'file-loader?name=[name].[ext]' },
      { test: /\.md$/, use: 'raw-loader' },
      { test: /\.txt$/, use: 'raw-loader' },
      { test: /\.(jpg|png|gif)$/, use: 'file-loader' },
      { test: /\.js.map$/, use: 'file-loader' },
      { test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/, use: 'url-loader?limit=10000&mimetype=application/font-woff' },
      { test: /\.woff(\?v=\d+\.\d+\.\d+)?$/, use: 'url-loader?limit=10000&mimetype=application/font-woff' },
      { test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, use: 'url-loader?limit=10000&mimetype=application/octet-stream' },
      { test: /\.otf(\?v=\d+\.\d+\.\d+)?$/, use: 'url-loader?limit=10000&mimetype=application/octet-stream' },
      { test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, use: 'file-loader' },
      { test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, use: 'url-loader?limit=10000&mimetype=image/svg+xml' }
    ],
  },
  externals: {
    module: 'commonjs module',
    child_process: 'commonjs child_process',
    'try-thread-sleep': 'commonjs try-thread-sleep',
    'vega-scenegraph': 'commonjs vega-scenegraph'
  },
  node: {
    fs: 'empty'
  },
  plugins: [
    //new ExtractTextPlugin("styles.css"),
    new MiniCssExtractPlugin({
      filename: "styles.css",
    })
  ],
  bail: true,
  devtool: 'eval-source-map'
}
