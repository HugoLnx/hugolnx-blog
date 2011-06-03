require 'jammit'
task :jammit do
  Jammit.package!(:base_url => 'http://hugolnx.com')
end
