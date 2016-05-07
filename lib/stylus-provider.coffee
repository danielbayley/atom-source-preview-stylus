[ stylus, config, preview ] = []

module.exports =
class StylusProvider

	fromGrammarName: 'Stylus'
	fromScopeName: 'source.css.stylus'
	toScopeName: 'source.css'

	relative: ['.','..','../..']
#-------------------------------------------------------------------------------

	transform: (code, { filePath, sourceMap } = {}) ->
		stylus ?= require 'stylus'
		{config: {includePaths}} = config ?= require '../package.json'

		options =
			filename: filePath.split(/[/]/).pop()
			paths: includePaths.concat @relative, atom.project.getPaths()
			sourcemap: sourceMap
			comment: false
			#sourceRoot:
			#basePath:

		stylus = stylus code, options
			.set 'sourcemap', options

		stylus.render (err, css) -> preview = css
			#throw err if err

		code: preview
		sourceMap: stylus.sourcemap ? null
