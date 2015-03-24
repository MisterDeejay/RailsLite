require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      current_dir = File.dirname(__FILE__)
      template_dir = File.join(
        current_dir, "..", "..", "views", self.class.to_s.underscore,
        "#{template_name}.html.erb"
      )

      template_content = File.read(template_dir)
      self.render_content(ERB.new(template_content).result(binding), "text/html")
    end
  end
end
