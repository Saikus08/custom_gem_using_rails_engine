module PrefixIds
  class Railtie < ::Rails::Railtie
    initializer 'prefix_ids' do
      ActiveSupport.on_load :active_record do
        include PrefixIds::Attribute
      end
    end
  end
end
