[ stylus, config, code ] = []

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

		preview = stylus code, options
			.set 'sourcemap', options

		preview.render (err, css) -> code = css
			#throw err if err

		code: code
		sourceMap: preview.sourcemap ? null
