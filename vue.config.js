const CompressionPlugin = require("compression-webpack-plugin");
const { defineConfig } = require('@vue/cli-service');

module.exports = defineConfig({
  transpileDependencies: true,

        configureWebpack: {

	 optimization: {
	    splitChunks: {
	      chunks: 'async',
	    }
	 },

          plugins:
	  [
             new CompressionPlugin({
                algorithm: "gzip",
                test: /\.(js|css)$/       	  
             })		  
	  ]
   }
})
