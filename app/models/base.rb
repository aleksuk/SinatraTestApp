class Base

  def to_json(options = {})
    serializer = ActiveModel::Serializer.serializer_for(self, options)

    if serializer
      serializer.new(self, options).to_json
    else
      super.to_json
    end
  end

end
