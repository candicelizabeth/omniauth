class TwoWordValidator < ActiveModel::EachValidator 
    def validate_each(record, attribute, value)
        # byebug
        if value.split(" ").length < 2
            record.errors.add(attribute, message: "Needs to be at least 2 words")
        end
    end
end