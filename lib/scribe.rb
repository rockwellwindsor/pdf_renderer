module Scribe
  require 'prawn'
  ActionController::Renderers.add :pdf do |filename, options|
    pdf = Prawn::Document.new
    pdf.text render_to_String(options)
    send_data(pdf.render, filename: "#{filename}.pdf", disposition: "attachment")
  end
end
