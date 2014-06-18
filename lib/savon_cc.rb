require "savon_cc/version"
require "rexml/document"

class Savon::Client
  alias_method :orig_call, :call

  def call(operation_name, locals={}, &block)
    orig_call(operation_name, locals, &block).tap do |rsp|
      stmp = Time.now.to_i.to_s
      file_name = "#{operation_name}_#{stmp}.xml"
      buffer = StringIO.new
      xmldoc = REXML::Document.new rsp.http.raw_body
      xmldoc.write buffer, 1
      File.write file_name, buffer.string
    end
  end
end

module SavonCC; end
