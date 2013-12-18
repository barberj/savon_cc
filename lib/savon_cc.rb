require "savon_cc/version"
require "rexml/document"

class Savon::Operation
  alias_method :orig_create_response, :create_response

  def create_response response
    stmp = Time.now.to_i.to_s
    file_name = "#{instance_variable_get :@name}_#{stmp}.xml"
    buffer = StringIO.new
    xmldoc = REXML::Document.new response.body
    xmldoc.write buffer, 1
    File.write file_name, buffer.string

    orig_create_response(response)
  end
end

module SavonCC; end
