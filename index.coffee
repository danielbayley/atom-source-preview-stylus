module.exports =
	activate: ->

		fromGrammarName: 'Stylus'
		fromScopeName: 'source.css.stylus'
		toScopeName: 'source.css'

		include: ['.','..','../..','lib','styles','stylus','css']
			#'assets/styles'
			#'assets/stylus'
			#'assets/css'
			#'partials'
			#'modules'
			#'mixins'
			#'helpers'
		#]
#-------------------------------------------------------------------------------

		transform: (code, { filePath, sourceMap }) ->
			stylus = require 'stylus'

			options =
				filename: filePath?.split('/').pop()
				paths: @include.concat atom.project.getPaths()
				sourcemap: sourceMap
				comment: false
				#sourceRoot:
				#basePath:

			preview = stylus code, options
				.set 'sourcemap', options

			preview.render (err, css) -> code = css
				#throw err if err

			code: code
			sourceMap: preview.sourcemap ? null
