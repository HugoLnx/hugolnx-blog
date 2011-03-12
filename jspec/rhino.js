
load('/home/hugolnx/.rvm/gems/ruby-1.9.2-p136/gems/jspec-4.3.3/lib/jspec.js')
load('/home/hugolnx/.rvm/gems/ruby-1.9.2-p136/gems/jspec-4.3.3/lib/jspec.xhr.js')
load('public/javascripts/application.js')
load('jspec/unit/spec.helper.js')

JSpec
.exec('jspec/unit/spec.js')
.run({ reporter: JSpec.reporters.Terminal, fixturePath: 'jspec/fixtures' })
.report()