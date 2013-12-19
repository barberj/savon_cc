require "savon_cc/version"
require "rexml/document"

class Savon::Operation
  alias_method :orig_call, :call

  def call
    orig_call.tap do |rsp|
      stmp = Time.now.to_i.to_s
      file_name = "#{instance_variable_get :@operation}_#{stmp}.xml"
      buffer = StringIO.new
      xmldoc = REXML::Document.new rsp.instance_variable_get(:@raw_response)
      xmldoc.write buffer, 1
      File.write file_name, buffer.string
    end
  end
end

module SavonCC; end
