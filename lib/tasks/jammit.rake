require 'jammit'
module Jammit
  class Compressor
    alias old compress_js
    def compress_js(paths)
      no_compress_paths,paths = paths.partition{|path| path.include? '/compressed/'}
      no_compress_contents = no_compress_paths.collect{|p| read_binary_file(p)}
      compressed_contents = old(paths)
      return ([compressed_contents] + no_compress_contents).join("\n")
    end
  end
end
task :jammit do
  Jammit.package!(:base_url => 'http://hugolnx.com')
end
