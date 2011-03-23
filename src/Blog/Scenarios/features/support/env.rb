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

#IO.popen('"C:\Program Files (x86)\Common Files\Microsoft Shared\DevServer\10.0\WebDev.WebServer40.exe" /port:42183 /nodirlist /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /vpath:"/"') { |f| puts f.gets }
#IO.popen('"C:\Program Files (x86)\IIS Express\iisexpress.exe"  /config:"G:\Users\Giovanni\Documents\IISExpress\config\applicationhost.config"  /site:"Blog.WebApp" /apppool:"Clr4IntegratedAppPool"') { |f| puts f.gets }
#IO.popen('"C:\Program Files (x86)\IIS Express\iisexpress.exe"  /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183') { |f| puts f.gets }
#spawn('"C:\Program Files (x86)\IIS Express\iisexpress.exe"  /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183')
#Process.exec('"C:\Program Files (x86)\IIS Express\iisexpress.exe"  /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183')
#pid = spawn('cmd.exe /c "G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Scenarios\startserver.cmd"', :out=>"NUL")
#pid = spawn('cmd.exe /c "G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Scenarios\startserver.cmd"')

#pgname = "G:\\proj\src\\Publicacoes\\Palestras\\MVCSummit\2011\\BDD\src\\Blog\\Scenarios\\startserver.cmd"
cmdline = '"C:\Program Files (x86)\IIS Express\iisexpress.exe" /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183"'
#cmdline = 'cmd.exe /C "C:\Program Files (x86)\IIS Express\iisexpress.exe" /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183"'
#cmdline = 'powershell -noprofile ". """"C:\Program Files (x86)\IIS Express\iisexpress.exe"""" /path:""""G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp""""  /clr:v4.0 /port:42183"""""'

#cmdline = '"%ProgramFiles(x86)%\IIS Express\iisexpress.exe" /path:"G:\proj\src\Publicacoes\Palestras\MVCSummit\2011\BDD\src\Blog\Blog.WebApp" /clr:v4.0 /port:42183"'
#process_info = Process.create(:command_line => cmdline, :startup_info => {:stdout => 'NUL'}, :creation_flags   => Process::DETACHED_PROCESS)
#process_info = Process.create(:command_line => cmdline, :creation_flags   => Process::DETACHED_PROCESS)

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
      #Process.kill("INT", pid)
      #print "Processinfo #{process_info}\n"
      #print "Matando #{process_info.process_id}\n"
      #Process.kill(9, process_info.process_id)
      Process.kill(9, pid)
    end
  end
end