# encoding: utf-8
require 'rspec/expectations'
require 'cucumber/formatter/unicode'
require 'capybara/cucumber'
require 'active_support/core_ext/hash/keys'
require_relative 'hashinitializer'
require_relative 'modelos'
require 'win32/process'
require "sys/proctable"
require_relative '../support/sql_server'
require 'fileutils'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://localhost:42184'
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
      Capybara::Driver::Selenium.new(app, :browser => :firefox)
end

caminho_app = File.expand_path('..\..\..\..\CompraColetiva', __FILE__).gsub('/','\\')
caminho_issexpress = 'C:\Program Files (x86)\IIS Express\iisexpress.exe'
cmdline = "\"#{caminho_issexpress}\" /path:\"#{caminho_app}\" /clr:v4.0 /port:42184\""
pid = 0
criado = false
Sys::ProcTable.ps{ |s|
  pid = s.pid if s.comm=="iisexpress.exe"
}
if pid == 0
  process = Process.create(:command_line => cmdline, :creation_flags => Process::DETACHED_PROCESS)
  pid = process.process_id
  criado = true
end

SqlServer.prerarar_schema

at_exit do
  if criado
    Sys::ProcTable.ps{ |s|
      pid = s.pid if s.comm=="iisexpress.exe"
    }
    if pid != 0
      begin
        Process.kill(9, pid)
      rescue Exception => ex
        warn "Erro:#{ex}"
      end
    end
  end
end