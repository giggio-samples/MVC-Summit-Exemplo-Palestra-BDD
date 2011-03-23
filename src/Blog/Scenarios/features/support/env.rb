# encoding: utf-8
require 'rspec/expectations'
require 'cucumber/formatter/unicode'
require 'capybara/cucumber'
require 'active_support/core_ext/hash/keys'
require_relative 'hashinitializer'
require_relative 'modelos'
require 'win32/process'
require "sys/proctable"

Capybara.default_driver = :selenium
Capybara.app_host = 'http://localhost:42183'
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app, :browser => :firefox)
end

cmdline = '"C:\Program Files (x86)\IIS Express\iisexpress.exe" /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183"'
pid = 0
criado = false
Sys::ProcTable.ps{ |s|
  pid = s.pid if s.comm=="iisexpress.exe"
}
if pid == 0
  process = Process.create(:command_line => cmdline, :creation_flags   => Process::DETACHED_PROCESS)
  pid = process.process_id
  criado = true
end

at_exit do
  if criado
    Sys::ProcTable.ps{ |s|
      pid = s.pid if s.comm=="iisexpress.exe"
    }
    if pid != 0
      Process.kill(9, pid)
    end
  end
end