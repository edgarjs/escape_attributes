module EscapeAttributes
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    
    # Escape HTML for the specified attributes.
    #
    # Usage:
    #   escape_attributes :full_name, :description
    def escape_attributes(*attrs)
      before_save do |base|
        attrs.each do |a|
          base[a] = CGI.escapeHTML(base[a]) unless base[a].blank?
        end
      end
    end
  end
end
