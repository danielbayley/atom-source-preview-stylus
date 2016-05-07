StylusProvider = require './stylus-provider'

module.exports =
	activate: -> @provider = new StylusProvider
	deactivate: -> @provider = null
	provide: -> @provider
