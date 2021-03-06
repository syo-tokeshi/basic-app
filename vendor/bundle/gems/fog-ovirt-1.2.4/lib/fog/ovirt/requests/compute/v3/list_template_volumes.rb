module Fog
  module Ovirt
    class Compute
      class V3
        class Real
          def list_template_volumes(template_id)
            client.template_volumes(template_id).map { |ovirt_obj| ovirt_attrs ovirt_obj }
          end
        end
        class Mock
          def list_template_volumes(_template_id)
            xml = read_xml "volumes.xml"
            Nokogiri::XML(xml).xpath("/disks/disk").map do |vol|
              ovirt_attrs OVIRT::Volume.new(self, vol)
            end
          end
        end
      end
    end
  end
end
