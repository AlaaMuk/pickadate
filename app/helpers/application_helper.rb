module ApplicationHelper
    def date_format(arg)
        arg.strftime("%m/%e/%Y at %I:%M")
    end
end
