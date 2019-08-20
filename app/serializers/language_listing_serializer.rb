class LanguageListingSerializer < ActiveModel::Serializer
    attributes :language
    has_one :language

end
